# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Maintainer: Saren Arterius <saren at wtako dot com>
# Contributor: Felix Yan

pkgname=rclone-git
pkgver=1.41.r8.g50dc5fe9
pkgrel=1
pkgdesc="Sync files to and from Google Drive, S3, Swift, Cloudfiles, Dropbox and Google Cloud Storage"
arch=('i686' 'x86_64')
url="http://rclone.org/"
license=('MIT')
depends=('glibc')
makedepends=('git' 'python2' 'pandoc' 'go-pie')
source=("${pkgname}::git+https://github.com/ncw/rclone.git")
conflicts=('rclone')
provides=('rclone')
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname}"

  sed -i "1s/python$/&2/" bin/make_manual.py

  mkdir -p .gopath/src/github.com/ncw
  ln -sf "$PWD" .gopath/src/github.com/ncw/rclone
  export GOPATH="$PWD/.gopath"

  go get github.com/ncw/rclone
}

build() {
  cd "${pkgname}/.gopath/src/github.com/ncw/rclone"

  PATH="$GOPATH/bin:$PATH" make TAG=v$pkgver rclone doc
}

check() {
  cd "${pkgname}/.gopath/src/github.com/ncw/rclone"
  make TAG=v$pkgver test || warning "Tests failed"
}

package() {
  cd "${pkgname}/.gopath/src/github.com/ncw/rclone"
  make TAG=v$pkgver DESTDIR="$pkgdir" install

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"

  install -Dm644 rclone.1 "$pkgdir/usr/share/man/man1/rclone.1"
  install -d "$pkgdir/usr/share/doc/$pkgname"
  install -t "$pkgdir/usr/share/doc/$pkgname" -m644 MANUAL.html MANUAL.txt
}
