# Maintainer:  Rubin Simons <me@rubin55.org

_sdk=10.0
_Name="FsAutoComplete"
_pkgname="${_Name,,}"
pkgname="${_pkgname}-bin"
pkgver=0.81.0
pkgrel=2
pkgdesc="F# language server using Language Server Protocol (LSP)"
arch=('any')
url="https://ionide.io/Tools/fsac.html"
_url="https://github.com/ionide/${_Name}"
license=('Apache-2.0')
depends=(
  "dotnet-sdk-${_sdk}"
  'sh'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_pkgname}-${pkgver}"
source=("dotnet-tool-common.sh"
        "${_url}/releases/download/v${pkgver}/${_Name}.${pkgver}.nupkg"
        "${_pkgsrc}-CHANGELOG.md::${_url}/raw/refs/tags/v${pkgver}/CHANGELOG.md"
        "${_pkgsrc}-LICENSE.md::${_url}/raw/refs/tags/v${pkgver}/LICENSE.md")
sha256sums=('8569a77543f4db3ce10517dd1614bc1d7200f8e746370c59ceb8b58cff267f8f'
            '5e7e78a800641b4156e0937049f2be918626234deeccd807b336f59052243142'
            '2bd10e9562a09582765f001d09fb3897fa276ed739c71c713c7a90321e751cac'
            '1ee6b06043c1f7eca730ecb0e4d2272c451077f6c96ff66fdd252d29843ba482')

if   [ "${CARCH}" = 'aarch64' ]; then _msarch=arm64;
elif [ "${CARCH}" = 'armv7h'  ]; then _msarch=arm;
elif [ "${CARCH}" = 'i686'    ]; then _msarch=x86;
elif [ "${CARCH}" = 'x86_64'  ]; then _msarch=x64; fi

prepare() {
  cd "${srcdir}"
  sed -e "s/@@DOTNET_TOOL_NAME@@/${_pkgname}/g" \
      -e "s/@@DOTNET_TOOL_DLL@@/${_pkgname}/g" \
      -i "dotnet-tool-common.sh"

  cd "tools/net${_sdk}/any/runtimes"
  find . -mindepth 1 -maxdepth 1 -type d ! -name "linux-${_msarch}" -exec \
    rm -rf "{}" +
}

package() {
  cd "${srcdir}"
  install -vDm755 "dotnet-tool-common.sh"   "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"               "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-CHANGELOG.md" "${pkgdir}/usr/share/doc/${_pkgname}/CHANGELOG.md"
  install -vDm644 "${_pkgsrc}-LICENSE.md"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"

  cd "tools/net${_sdk}/any"
  install -vd "${pkgdir}/usr/lib/${_pkgname}"
  cp -vr --no-preserve=ownership . "${pkgdir}/usr/lib/${_pkgname}"
}
