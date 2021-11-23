# Maintainer: Topik <topik@topik.tech>

pkgname=oomd
pkgver=0.4.0
pkgrel=1
pkgdesc='A userspace out-of-memory killer.'
arch=('x86_64')
url='https://github.com/facebookincubator/oomd'
license=('GPL2')
depends=('jsoncpp')
optdepends=('systemd-libs')
makedepends=('meson' 'ninja')
checkdepends=('gtest' 'gmock')
install="${pkgname}.install"
provides=("${pkgname}")
conflicts=("${pkgname}-git")
backup=("etc/${pkgname}/${pkgname}.json")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/facebookincubator/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('6bf5668eedd093666abf290ec8a864e4028deb29605a35da31d8ba9eb4ae18322ec0bb214e683d5c5a8c2e1fdf17d3f81645ca0ff9a07316a172e2a7765de046')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # build system expects the directory to be named "oomd"
  ln -sfT "${pkgname}-${pkgver}" "${srcdir}/${pkgname}"
}

build() {
  cd "${srcdir}/${pkgname}"
  meson build --prefix=/usr && ninja -C build
}

check() {
   cd "${srcdir}/${pkgname}"
   ninja test -C build
}

package() {
  cd "${srcdir}/${pkgname}"
  DESTDIR="${pkgdir}" ninja -C build install
}

