# Maintainer: Luong The Minh Quang <luci at devel.faith>
_name=ovh-ttyrec
pkgname="$_name-git"
pkgdesc='Enhanced (but compatible) version of the classic ttyrec'
pkgrel=1
pkgver=v1.1.6.3.r0.gb8bdaab
arch=('x86_64')
url='https://github.com/ovh/ovh-ttyrec'
license=('BSD')
depends=('zstd')
makedepends=('git' 'make')
conflicts=('ttyrec')
source=("git+https://github.com/ovh/ovh-ttyrec#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "$_name"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$_name"
  find "${pkgdir}"/usr -type d -exec chmod 755 {} +
  chown -R root:root "$pkgdir"
}

prepare() {
  cd "$_name"
  ./configure NO_STATIC_ZSTD=1
}

build() {
  cd "$_name"
  make
}

package() {
  cd "$_name"
  make DESTDIR="$pkgdir" install
}
