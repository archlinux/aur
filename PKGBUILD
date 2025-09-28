# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_sdk=9.0
_Name="Ionide.ProjInfo.Tool"
_pkgname="dotnet-proj"
pkgname="${_pkgname}-bin"
pkgver=0.71.2
pkgrel=1
pkgdesc="Parse and evaluate MsBuild project files"
arch=('any')
url="https://ionide.io/Tools/dpi.html"
_url="https://github.com/ionide/proj-info"
license=('MIT')
depends=(
  "dotnet-runtime-${_sdk}"
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
        "${_pkgsrc}.nupkg::${_url}/releases/download/v${pkgver}/${_Name}.${pkgver}.nupkg"
        "${_pkgsrc}-CHANGELOG.md::${_url}/raw/refs/tags/v${pkgver}/CHANGELOG.md"
        "${_pkgsrc}-LICENSE::${_url}/raw/refs/tags/v${pkgver}/LICENSE")
sha256sums=('b3329b46f618290380c6b9d7436fa9ca19efc269af5a8b4fb06263daaaaa5ad1'
            '7f6ba189010621d93b765999f297d8c6cfa06efd00764ffc0a675655323d8234'
            '94ad2ed49c0d9c9ca0cf338513e24fb0b98829f1054bd89d9b92e7a2f6cdeae8'
            'd2c1bb765043d39c5a4bbe13c532f71df2671e95ebab27303ae0c13e35b60b0a')

if   [ "${CARCH}" = 'aarch64' ]; then _msarch=arm64;
elif [ "${CARCH}" = 'armv7h'  ]; then _msarch=arm;
elif [ "${CARCH}" = 'i686'    ]; then _msarch=x86;
elif [ "${CARCH}" = 'x86_64'  ]; then _msarch=x64; fi

prepare() {
  cd "${srcdir}"
  sed -e "s/@@DOTNET_TOOL_NAME@@/${_pkgname}/g" \
      -e "s/@@DOTNET_TOOL_DLL@@/${_Name}.dll/g" \
      -i "dotnet-tool-common.sh"

  cd "tools/net${_sdk}/any/runtimes"
  rm -rf "win"
}

package() {
  cd "${srcdir}"
  install -vDm755 "dotnet-tool-common.sh"   "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"               "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-CHANGELOG.md" "${pkgdir}/usr/share/doc/${_pkgname}/CHANGELOG.md"
  install -vDm644 "${_pkgsrc}-LICENSE"      "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "tools/net${_sdk}/any"
  install -vd "${pkgdir}/usr/lib/${_pkgname}"
  cp -va --no-preserve=ownership . "${pkgdir}/usr/lib/${_pkgname}"
}
