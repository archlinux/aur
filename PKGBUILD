# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Saren Arterius <saren at wtako dot com>
# Contributor: Felix Yan

pkgname=rclone-git
pkgver=1.65.0.r31.g8503282a5
pkgrel=1
pkgdesc="Sync files to and from Google Drive, S3, Swift, Cloudfiles, Dropbox and Google Cloud Storage"
arch=(i686 x86_64 arm armv6h armv7h aarch64)
url="https://rclone.org/"
license=(MIT)
depends=(glibc)
makedepends=(git python go)
optdepends=('fuse3: for rclone mount')
conflicts=(rclone)
provides=(rclone)
options=(!lto)
source=("git+https://github.com/rclone/rclone.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  sed -i "1s/python$/&2/" bin/make_manual.py bin/make_backend_docs.py
}

build() {
  cd "${pkgname%-git}"
  export GOPATH="$SRCDEST/go-modules"

  go build \
    -gcflags "all=-trimpath=${PWD}" \
    -asmflags "all=-trimpath=${PWD}" \
    -ldflags "-extldflags ${LDFLAGS}"

  ./rclone genautocomplete bash rclone.bash_completion
  ./rclone genautocomplete zsh rclone.zsh_completion
}

#check() {
#  cd "${pkgname%-git}"
#  PATH=$PATH:"$SRCDEST/go-modules/bin" ; export PATH
#  make test || warning "Tests failed"
#}

package() {
  cd "${pkgname%-git}"
  install -D rclone ${pkgdir}/usr/bin/rclone
  install -Dm644 rclone.bash_completion "$pkgdir"/usr/share/bash-completion/completions/rclone
  install -Dm644 rclone.zsh_completion "$pkgdir"/usr/share/zsh/site-functions/_rclone

  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING

  install -Dm644 rclone.1 "$pkgdir"/usr/share/man/man1/rclone.1
  install -d "$pkgdir"/usr/share/doc/$pkgname
  install -t "$pkgdir"/usr/share/doc/$pkgname -m644 MANUAL.html MANUAL.txt
}
