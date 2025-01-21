# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: ccat3z <c0ldcat3z@gmail.com>

_pkgname="miktex"
pkgname="${_pkgname}-git"
pkgver=24.12.r20.g4c9a71e
pkgrel=1
pkgdesc="A distribution of the TeX/LaTeX typesetting system"
arch=('x86_64')
url="https://miktex.org"
_url="https://github.com/MiKTeX/${_pkgname}"
license=('custom:MiKTeX License')
depends=('boost-libs' 'bzip2' 'cairo' 'curl' 'expat' 'fontconfig' 'freetype2'
         'fribidi' 'gcc-libs' 'gd' 'glibc' 'graphite' 'harfbuzz'
         'hicolor-icon-theme' 'hunspell' 'icu' 'libmspack' 'libpng' 'log4cxx'
         'mpfi' 'mpfr' 'openssl' 'poppler-qt6' 'popt' 'qt6-5compat' 'qt6-base'
         'qt6-declarative' 'qt6-tools' 'uriparser' 'xz' 'zlib' 'zziplib')
makedepends=('apr' 'apr-util' 'boost' 'cmake>=3.12' 'git' 'gmp' 'harfbuzz-icu'
             'libjpeg' 'libxslt' 'pixman' 'poppler' 'potrace')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}"
source=("${_pkgsrc}::git+${_url}.git"
        "${_pkgname}_format_security.patch")
sha256sums=('SKIP'
            'a094dbfb9221664303179e8a3c3093dd4095e05ef0312d41dcd1482bca99b2a5')

pkgver() {
  cd "${srcdir}/${_pkgsrc}"
  git describe --long --tags --abbrev=7 | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${_pkgname}_format_security.patch"

  find . -type f \( -name '*.h' -o -name '*.cpp' \) -exec \
    sed -i 's|log4cxx/rollingfileappender.h|log4cxx/rolling/rollingfileappender.h|g' {} +

  cd "cmake/modules"
  cp "FindPOPPLER_QT5.cmake" "FindPOPPLER_QT6.cmake"
  sed -e 's/QT5/QT6/g' \
      -e 's/qt5/qt6/g' \
      -i "FindPOPPLER_QT6.cmake"
}

build() {
  local cmake_options=(
    -G 'Unix Makefiles' \
    -B "${_pkgsrc}/build" \
    -S "${_pkgsrc}" \
    -DCMAKE_BUILD_TYPE:STRING='None' \
    -DCMAKE_INSTALL_PREFIX:PATH="/opt/${_pkgname}" \
    -DWITH_UI_QT=ON \
    -DUSE_SYSTEM_POPPLER=TRUE \
    -DUSE_SYSTEM_POPPLER_QT=TRUE \
    -Wno-dev
  )

  cd "${srcdir}"
  cmake "${cmake_options[@]}"
  cmake --build "${_pkgsrc}/build"
}

check() {
  cd "${srcdir}"
  ctest --test-dir "${_pkgsrc}/build" --output-on-failure --stop-on-failure
}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${srcdir}/${_pkgsrc}"
  install -vDm644 "README.md"    "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "HACKING.md"   "${pkgdir}/usr/share/doc/${_pkgname}/HACKING.md"
  install -vDm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${_pkgname}/CHANGELOG.md"
  install -vDm644 "COPYING.md"   "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING.md"

  cd "${pkgdir}/opt/${_pkgname}"
  find "share" -type f -exec install -Dm644 "{}" "${pkgdir}/usr/{}" \;
  find "man"   -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/{}" \;
  rm -rf "share" "man"

  cd "${pkgdir}/usr/share/applications"
  find "icons" -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/{}" \;
  rm -rf "icons"

  sed -i 's|Exec=|Exec=/opt/miktex/bin/|' "miktex-console.desktop"

  cd "${pkgdir}/usr/share/polkit-1/actions"
  sed -i 's|/usr/bin|/opt/miktex/bin|' "miktex-console.policy"

  cd "${pkgdir}/opt/${_pkgname}/bin"
  for _gsu in pkexec kdesu gksu; do
    ln -s "/usr/bin/${_gsu}" "${_gsu}"
  done

  install -dm755 "${pkgdir}/usr/bin"
  find . -type f -name 'miktex*' -exec ln -s "/opt/miktex/bin/{}" "${pkgdir}/usr/bin/{}" \;
}
