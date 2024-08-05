# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: ccat3z <c0ldcat3z@gmail.com>

_pkgname="miktex"
pkgname="${_pkgname}-git"
pkgver=24.4.r9.g07fb41f
pkgrel=1
pkgdesc="A distribution of the TeX/LaTeX typesetting system"
arch=('any')
url="https://miktex.org"
_url="https://github.com/MiKTeX/${_pkgname}"
license=('custom:MiKTeX license')
makedepends=('git' 'cmake>=3.12.0' 'apr' 'apr-util' 'boost' 'gmp'
             'harfbuzz-icu' 'libjpeg' 'pixman' 'poppler' 'libxslt' 'potrace')
depends=('glibc' 'gcc-libs' 'boost-libs' 'bzip2' 'cairo' 'curl' 'expat'
         'fontconfig' 'freetype2' 'fribidi' 'gd' 'graphite' 'harfbuzz'
         'hunspell' 'icu' 'log4cxx' 'xz' 'mpfi' 'mpfr' 'libmspack' 'openssl'
         'libpng' 'popt' 'poppler-qt6' 'uriparser' 'zlib' 'zziplib' 'qt6-base'
         'qt6-declarative' 'qt6-tools' 'qt6-5compat')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}"
source=("${_pkgsrc}::git+${_url}.git"
        "${_pkgname}_fix_outocp.patch")
sha256sums=('SKIP'
            'a094dbfb9221664303179e8a3c3093dd4095e05ef0312d41dcd1482bca99b2a5')

pkgver() {
  cd "${_pkgsrc}"
  git describe --long --tags --abbrev=7 | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -p1 -i "${srcdir}/${_pkgname}_fix_outocp.patch"

  find . -name "*.h"   -exec sed -i 's|log4cxx/rollingfileappender.h|log4cxx/rolling/rollingfileappender.h|g' {} +
  find . -name "*.cpp" -exec sed -i 's|log4cxx/rollingfileappender.h|log4cxx/rolling/rollingfileappender.h|g' {} +

  cd "cmake/modules"
  cp "FindPOPPLER_QT5.cmake" "FindPOPPLER_QT6.cmake"
  sed -i 's/QT5/QT6/g' "FindPOPPLER_QT6.cmake"
  sed -i 's/qt5/qt6/g' "FindPOPPLER_QT6.cmake"
}

build() {
  cd "${srcdir}"
  cmake \
    -G 'Unix Makefiles' \
    -B "${_pkgsrc}/build" \
    -S "${_pkgsrc}" \
    -DCMAKE_BUILD_TYPE:STRING='None' \
    -DCMAKE_INSTALL_PREFIX:PATH="/opt/${_pkgname}" \
    -DWITH_UI_QT=ON \
    -DUSE_SYSTEM_POPPLER=TRUE \
    -DUSE_SYSTEM_POPPLER_QT=TRUE \
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
  install -Dm644 "README.md"  "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "COPYING.md" "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING.md"

  cd "${pkgdir}/opt/${_pkgname}"  
  find "share" -type f -exec install -Dm644 "{}" "${pkgdir}/usr/{}" \;
  sed -i 's/^Exec=miktex-console$/Exec=\/opt\/miktex\/bin\/miktex-console/' "${pkgdir}/usr/share/applications/miktex-console.desktop"
  rm -rf "share"

  find "man" -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/{}" \;
  rm -rf "man"
}
