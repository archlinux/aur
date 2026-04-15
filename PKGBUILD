# Maintainer: avscs <avscs at proton dot me>
pkgname=bclone-git
pkgver=nightly.r0.gf11ee0176
pkgrel=1
pkgdesc="rclone with Alist, Alldebrid, iCloud Photos, Teldrive and Terabox support"
arch=(any)
url="https://github.com/BenjiThatFoxGuy/bclone"
license=(MIT)
depends=(glibc)
makedepends=(python go git)
optdepends=("fuse3: for rclone mount")
provides=(rclone bclone)
conflicts=(rclone bclone)
source=("git+https://github.com/BenjiThatFoxGuy/bclone.git")
sha256sums=(SKIP)

pkgver() {
	cd "${pkgname%-bin}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${pkgname%-bin}"
	sed -i "1s/python$/&2/" bin/make_manual.py bin/make_backend_docs.py
}

build() {
	cd "${pkgname%-bin}"
	export GOPATH="$SRCDEST/go-modules"

	go build \
	-trimpath \
	-buildmode=pie \
	-mod=readonly \
	-modcacherw \
	-ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
	.

	./rclone genautocomplete bash rclone.bash_completion
	./rclone genautocomplete zsh rclone.zsh_completion
	./rclone genautocomplete fish rclone.fish_completion
}

package() {
  cd "${pkgname%-bin}"
  install -D rclone ${pkgdir}/usr/bin/rclone
  install -Dm644 rclone.bash_completion "$pkgdir"/usr/share/bash-completion/completions/rclone
  install -Dm644 rclone.zsh_completion "$pkgdir"/usr/share/zsh/site-functions/_rclone
  install -Dm644 rclone.fish_completion "$pkgdir"/usr/share/fish/vendor_completions.d/rclone.fish

  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING

  install -Dm644 rclone.1 "$pkgdir"/usr/share/man/man1/rclone.1
  install -d "$pkgdir"/usr/share/doc/$pkgname
  install -t "$pkgdir"/usr/share/doc/$pkgname -m644 MANUAL.html MANUAL.txt
}
