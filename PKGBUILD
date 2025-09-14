# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="Lerc"
_pkgname="${_Name,,}"
pkgname="${_pkgname}-bin"
pkgver=4.0.0
pkgrel=1
pkgdesc="Limited Error Raster Compression library"
arch=('x86_64')
url="https://github.com/Esri/${_pkgname}"
license=('Apache-2.0')
depends=(
  'gcc-libs'
  'glibc'
)
provides=(
  "${_pkgname}"
  "lib${_Name}.so"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${url##*/}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('91431c2b16d0e3de6cbaea188603359f87caed08259a645fd5a3805784ee30a0')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  cp "${_Name}.pc.in" "${_Name}.pc"
  sed -e "s|@CMAKE_INSTALL_PREFIX@|/usr|g" \
      -e "s|@CMAKE_INSTALL_INCLUDEDIR@|include|g" \
      -e "s|@CMAKE_INSTALL_LIBDIR@|lib|g" \
      -e "s|@PROJECT_NAME@|${_Name}|g" \
      -e "s|@PROJECT_DESCRIPTION@|${pkgdesc% library}|g" \
      -e "s|@PROJECT_HOMEPAGE_URL@|${url}|g" \
      -e "s|@PROJECT_VERSION@|${pkgver}|g" \
      -i "${_Name}.pc"
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm644 "NOTICE"    "${pkgdir}/usr/share/doc/${_pkgname}/NOTICE"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  install -vDm644 "${_Name}.pc" "${pkgdir}/usr/lib/pkgconfig/${_Name}.pc"

  cd "${srcdir}/${_pkgsrc}/bin/linux"
  find . -type f -name 'lib*.so*' -exec \
    install -vDm644 "{}" "${pkgdir}/usr/lib/{}" \;

  cd "${srcdir}/${_pkgsrc}/src/LercLib"
  find "include" -type f -name '*.h' -exec \
    install -vDm644 "{}" "${pkgdir}/usr/{}" \;

  cd "${pkgdir}/usr/lib"
  for lib in lib*.so.*; do
    ln -vsf "${lib}" "${lib%.[0-9]*}"
  done
}
