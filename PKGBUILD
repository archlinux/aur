# Maintainer: Nick Cao <nickcao@nichi.co>
# Previous Maintainer: Julien Nicoulaud <julien dot nicoulaud at gmail dot com>

pkgname=oomd
pkgver=0.3.2
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
sha512sums=('42187233ad4b10feeb9666b56e0fa3fbb04dda824184b60eb6f69052913b44127331da8901e1ef5e2c723989f5f1ccd4c28f3ffdae3f02e359cc4e6d288b5fe3')

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

