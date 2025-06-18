# Maintainer: PandaDEV <contact@pandadev.net> -> https://github.com/0pandadev

pkgname=rclone-filen-git
pkgver=1.70.0.filen.12
pkgrel=1
pkgdesc="rclone fork with support for filen.io (git version)"
arch=(i686 x86_64 armv7h aarch64)
url="https://github.com/FilenCloudDienste/filen-rclone"
license=(MIT)
depends=(glibc)
makedepends=(git python go)
optdepends=('fuse3: for rclone mount')
conflicts=(rclone rclone-filen)
provides=(rclone rclone-filen)
#options=(!lto)
source=("rclone-filen::git+https://github.com/FilenCloudDienste/filen-rclone.git")
sha256sums=('SKIP')

pkgver() {
  cd "rclone-filen"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "rclone-filen"
  sed -i "1s/python$/&2/" bin/make_manual.py bin/make_backend_docs.py
}

build() {
  cd "rclone-filen"
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
  cd "rclone-filen"
  install -D rclone ${pkgdir}/usr/bin/rclone
  install -Dm644 rclone.bash_completion "$pkgdir"/usr/share/bash-completion/completions/rclone
  install -Dm644 rclone.zsh_completion "$pkgdir"/usr/share/zsh/site-functions/_rclone
  install -Dm644 rclone.fish_completion "$pkgdir"/usr/share/fish/vendor_completions.d/rclone.fish

  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING

  install -Dm644 rclone.1 "$pkgdir"/usr/share/man/man1/rclone.1
  install -d "$pkgdir"/usr/share/doc/$pkgname
  install -t "$pkgdir"/usr/share/doc/$pkgname -m644 MANUAL.html MANUAL.txt
}
