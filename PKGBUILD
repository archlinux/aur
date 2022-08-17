# Maintainer: syntheit <daniel@matv.io>
pkgname=oomd
pkgver=0.5.0
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
sha512sums=('1841245c56c9de359b8b9d5e03325430e5b1300b6210f94d810ba3857506658ba9162460baf5ae683a797b534215baa30cefca6daa207d257e30b7c5bd1ac33d')

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

