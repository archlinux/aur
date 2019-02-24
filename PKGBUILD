# Maintainer: twa022 <twa022 at gmail dot com>

pkgname=sdbusplus
pkgver=r298.3a3bb9e
pkgrel=1
pkgdesc="C++ bindings for systemd dbus APIs"
url="https://github.com/openbmc/sdbusplus"
arch=('i686' 'x86_64')
license=('Apache')
depends=('systemd-libs' 'python-mako' 'python-inflection' 'python-yaml')
makedepends=('git')
_commit='3a3bb9e932b2306dafd33ddd2eb31d61ff89b3fb'
source=("${pkgname}::git+https://github.com/openbmc/sdbusplus.git#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
#  git describe --long --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd "${pkgname}"
  ./bootstrap.sh
  ./configure --prefix=/usr \
              --enable-tests=no \
              --disable-dependency-tracking #fails otherwise
  # Avoid compile failure
  sed -i '/@CODE_COVERAGE_RULES@/d' test/Makefile
}
  
build() {
  cd "${pkgname}"
  make
}

package() {
  cd "${pkgname}"
  make DESTDIR="$pkgdir" install
}
