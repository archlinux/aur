# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_sdk=9.0
_Name="FsAutoComplete"
_pkgname="${_Name,,}"
pkgname="${_pkgname}-bin"
pkgver=0.79.2
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
sha256sums=('b3329b46f618290380c6b9d7436fa9ca19efc269af5a8b4fb06263daaaaa5ad1'
            '3b35f1eb62afc3ef014f238945c86a88399333f81798b3b9f3024394c465b6e5'
            '9cf7b4689f1dee6429db489b537efe7d5f44aa4d7f06c1d22e9e4d0e769bd1dd'
            '1ee6b06043c1f7eca730ecb0e4d2272c451077f6c96ff66fdd252d29843ba482')

if   [ "${CARCH}" = 'aarch64' ]; then _msarch=arm64;
elif [ "${CARCH}" = 'armv7h'  ]; then _msarch=arm;
elif [ "${CARCH}" = 'i686'    ]; then _msarch=x86;
elif [ "${CARCH}" = 'x86_64'  ]; then _msarch=x64; fi

prepare() {
  cd "${srcdir}"
  sed -e "s/@@DOTNET_TOOL_NAME@@/${_pkgname}/g" \
      -e "s/@@DOTNET_TOOL_DLL@@/${_pkgname}.dll/g" \
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
