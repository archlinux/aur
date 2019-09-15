_pkgbasename=jsoncpp
pkgname=lib32-${_pkgbasename}
pkgver=1.9.1
pkgrel=1
pkgdesc='A C++ library for interacting with JSON'
url='https://github.com/open-source-parsers/jsoncpp'
license=('MIT' 'custom:Public_Domain')
arch=('x86_64')
depends=("${_pkgbasename}" 'lib32-gcc-libs')
makedepends=('meson' 'python')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/open-source-parsers/${_pkgbasename}/archive/${pkgver}.tar.gz")
sha256sums=('c7b40f5605dd972108f503f031b20186f5e5bca2b65cd4b8bd6c3e4ba8126697')

prepare() {
  cd ${_pkgbasename}-${pkgver}
  echo "${pkgver}" > version
  sed -E "s|(version : )'1.9.0'|\1'${pkgver}'|" -i meson.build
}

build() {
  cd ${_pkgbasename}-${pkgver}
  CXXFLAGS=-m32 arch-meson --default-library shared --libdir lib32 --optimization 2 build
  ninja -C build
}

check() {
  cd ${_pkgbasename}-${pkgver}
  ninja -C build test
  cd test
  python runjsontests.py ../build/jsontestrunner
  python rununittests.py ../build/jsoncpp_test
}

package() {
  cd  ${_pkgbasename}-${pkgver}

  DESTDIR="${pkgdir}" ninja -C build install
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  rm -r "${pkgdir}/usr/include"
  rm -r "${pkgdir}/usr/lib32/pkgconfig"
}

