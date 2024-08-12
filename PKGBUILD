# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="subprocess"
pkgver=0.4.0
pkgrel=1
pkgdesc="A subprocess library for C++, similar to design of Python subprocess"
arch=('any')
url="https://github.com/benman64/${pkgname}"
license=('MIT')
makedepends=('cmake>=3.6' 'python')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        "${pkgname}_fix_install.patch"
        "${pkgname}Config.cmake.in"
        "${pkgname}ConfigVersion.cmake.in")
sha256sums=('19d865146d8565969da659ffdf9cf5feac5c36d02b52a6a687e41bd53114645f'
            'f06960ebe74628dd5039f145a2f8a0d80a04d6f111013572b9d877e2b5004c54'
            '9996ac3d10228e5b4e86db4071f009710b4a2cf15e9b8ac450c97f63f0be92fe'
            '85be543b806413728ed7d288843fe407b01073e1ec851ba06fdd2c0585fb5b3e')

prepare() {
  cd "${srcdir}"
  cp -R "${pkgname}Config.cmake.in"        "${_pkgsrc}/src/cpp/"
  cp -R "${pkgname}ConfigVersion.cmake.in" "${_pkgsrc}/src/cpp/"
  
  cd "${_pkgsrc}"
  patch -p1 -i "${srcdir}/${pkgname}_fix_install.patch"
}

build() {
  cd "${srcdir}"
  cmake \
    -G 'Unix Makefiles' \
    -B "${_pkgsrc}/build" \
    -S "${_pkgsrc}" \
    -DCMAKE_BUILD_TYPE:STRING='None' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -Wno-dev
  cmake --build "${_pkgsrc}/build"
}

check() {
  cd "${srcdir}"
  ctest --test-dir "${_pkgsrc}/build" --output-on-failure --stop-on-failure
}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${_pkgsrc}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
