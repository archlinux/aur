# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="gFTL"
pkgname="${_Name,,}"
pkgver=1.15.2
pkgrel=1
pkgdesc="Software containers for Fortran"
arch=('any')
url="https://github.com/Goddard-Fortran-Ecosystem/${_Name}"
license=('Apache-2.0')
makedepends=('cmake>=3.12' 'gcc-fortran')
_pkgsrc="${_Name}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('768771d64ad6e30251b4e7d1d35894006170980fa37c180d72823ff4c65a887a53137c2ae53a9fe9dde437847e43666f0aece6839fbf20306df3a04330aa6918')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  sed -i '/LANGUAGES NONE)/a include(GNUInstallDirs)' 'CMakeLists.txt'
  find . -type f -name 'CMakeLists.txt' -exec \
    sed -e 's|${top_dir}/cmake|${CMAKE_INSTALL_LIBDIR}/cmake/'"${_Name^^}|g" \
        -e 's|${top_dir}/include|${CMAKE_INSTALL_INCLUDEDIR}/'"${_Name}|g" \
        -e 's|${dest}/include|${CMAKE_INSTALL_INCLUDEDIR}/'"${_Name}|g" \
        -i "{}" +

  find "cmake" -type f -name '*.mk.in' -exec \
    sed -e 's|$(GFTL_TOP_DIR)/include|$(GFTL_INSTALL_PREFIX)/include/'"${_Name}|g" \
        -e '/GFTL_TOP_DIR/d' \
        -i "{}" +
}

build() {
  local cmake_options=(
    -G 'Unix Makefiles'
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}"
    -W no-dev
    -D CMAKE_BUILD_TYPE:STRING='None'
    -D CMAKE_INSTALL_PREFIX:PATH='/usr'
  )

  cd "${srcdir}"
  cmake "${cmake_options[@]}"
  cmake --build "${_pkgsrc}/build"
}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${_pkgsrc}"
  install -vDm644 "ChangeLog.MD"  "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
  install -vDm644 "README.md"     "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "Copyright.txt" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT.txt"
  install -vDm644 "License.txt"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"

  find "${pkgdir}" -type f -name '*.inc' -exec \
    sed -i "s|${srcdir}/${_pkgsrc}/include|/usr/include/${_Name}|g" "{}" +
}
