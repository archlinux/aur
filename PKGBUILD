# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="Lerc"
_pkgname="${_Name,,}"
pkgname="${_pkgname}-bin"
pkgver=4.1.0
pkgrel=1
pkgdesc="Limited Error Raster Compression library"
arch=(
  'x86_64'
)
url="https://github.com/Esri/${_pkgname}"
license=(
  'Apache-2.0'
)
depends=(
  'glibc'
  'libgcc'
  'libstdc++'
)
provides=(
  "${_pkgname}"
  "lib${_Name}.so"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${url##*/}-${pkgver}"
source=(
  "${url}/archive/refs/tags/v${pkgver}/${_pkgsrc}.tar.gz"
  "${_pkgsrc}-all.zip::${url}/releases/download/v${pkgver}/bin.zip"
)
sha256sums=('f05b24d2368becab9144873878655bb718910631550d4f786262378c16ab94a7'
            'c91f50d574411e75d1f472a2f8ff688aae3c56baa31f4602b0f0d67adaca1b74')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  cp -v "${_Name}.pc.in" "${_Name}.pc"
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
  cd "${srcdir}"
  find "bin/linux" -type f -name 'lib*.so*' -execdir \
    install -vDm644 "{}" "${pkgdir}/usr/lib/{}" \;

  cd "${_pkgsrc}"
  install -vDm644 "NOTICE"    "${pkgdir}/usr/share/doc/${_pkgname}/NOTICE"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  install -vDm644 "${_Name}.pc" "${pkgdir}/usr/lib/pkgconfig/${_Name}.pc"

  cd "src/LercLib"
  find "include" -type f -name '*.h' -exec \
    install -vDm644 "{}" "${pkgdir}/usr/{}" \;

  cd "${pkgdir}/usr/lib"
  for lib in lib*.so.*; do
    ln -vsf "${lib}" "${lib%.[0-9]*}"
  done
}
