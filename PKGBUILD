# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_sdk=8.0
_Name="Rapicgen"
_pkgname="${_Name,,}"
pkgname="${_pkgname}-bin"
pkgver=1.29.0
pkgrel=1
pkgdesc="Generates API client code from OpenAPI specs using templates via command-line"
arch=('any')
url="https://christianhelle.com/apiclientcodegen/"
_url="https://github.com/christianhelle/apiclientcodegen"
license=('GPL-3.0-only')
depends=("dotnet-runtime-${_sdk}" 'sh')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
# options=('!strip' '!debug')
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}.nupkg::https://globalcdn.nuget.org/packages/${_pkgname}.${pkgver}.nupkg?packageVersion=${pkgver}"
        "${_pkgsrc}-CHANGELOG.md::${_url}/raw/refs/tags/${pkgver}/CHANGELOG.md"
        "${_pkgsrc}-README.md::${_url}/raw/refs/tags/${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${_url}/raw/refs/tags/${pkgver}/LICENSE"
        "dotnet-tool-common.sh")
sha256sums=('406b838a93d647e8e0ffbdd5d83dedd9898b89f4fd4a0dfc93a6fe189bbcdda4'
            '736090a5205159cae5b94b57bff3ff8d919edc7b887712cf6f47c079407e5a64'
            '6e028a74a837d50ad061d6ed8c238e042ee2a39cb28678cfb3634a228d82b069'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            'b3329b46f618290380c6b9d7436fa9ca19efc269af5a8b4fb06263daaaaa5ad1')

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
  # find . -mindepth 1 -maxdepth 1 -type d ! -name "linux-${_msarch}" -exec \
  #   rm -rf "{}" +
  rm -rf "win"
}

package() {
  cd "${srcdir}"
  install -vDm755 "dotnet-tool-common.sh"   "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-CHANGELOG.md" "${pkgdir}/usr/share/doc/${_pkgname}/CHANGELOG.md"
  install -vDm644 "${_pkgsrc}-README.md"    "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"      "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "tools/net${_sdk}/any"
  install -vd "${pkgdir}/usr/lib/${_pkgname}"
  cp -vr --no-preserve=ownership . "${pkgdir}/usr/lib/${_pkgname}"
}
