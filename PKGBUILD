# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_sdk=10.0
_Name="CSharpier"
_pkgname="${_Name,,}"
pkgname="${_pkgname}-bin"
pkgver=1.1.2
pkgrel=1
pkgdesc="An opinionated code formatter for C#"
arch=('any')
url="https://csharpier.com"
_url="https://github.com/belav/${_pkgname}"
license=('MIT')
depends=("aspnet-runtime-${_sdk}" 'sh')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
# options=('!strip' '!debug')
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}.nupkg::https://globalcdn.nuget.org/packages/${_pkgname}.${pkgver}.nupkg?packageVersion=${pkgver}"
        "${_pkgsrc}-CHANGELOG.md::${_url}/raw/refs/tags/${pkgver}/CHANGELOG.md"
        "${_pkgsrc}-LICENSE::${_url}/raw/refs/tags/${pkgver}/LICENSE"
        "dotnet-tool-common.sh")
sha256sums=('765588aa512b5d3d25f1668bc2d80a6fbc69615ba79198a1689dc4ccaa9aa851'
            'd638d9cb24b819c640748a6d321191360bb5e68b4c670e18d42ceb9622ff7b7f'
            '0ed797a602216813b874392c4668e5e5611fc9e3b89af6a1989add2e3d825b37'
            'b3329b46f618290380c6b9d7436fa9ca19efc269af5a8b4fb06263daaaaa5ad1')

prepare() {
  cd "${srcdir}"
  sed -e "s/@@DOTNET_TOOL_NAME@@/${_pkgname}/g" \
      -e "s/@@DOTNET_TOOL_DLL@@/${_Name}.dll/g" \
      -i "dotnet-tool-common.sh"
}

package() {
  cd "${srcdir}"
  install -vDm755 "dotnet-tool-common.sh"   "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"               "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-CHANGELOG.md" "${pkgdir}/usr/share/doc/${_pkgname}/CHANGELOG.md"
  install -vDm644 "${_pkgsrc}-LICENSE"      "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "tools/net${_sdk}/any"
  install -vd "${pkgdir}/usr/lib/${_pkgname}"
  cp -vr --no-preserve=ownership . "${pkgdir}/usr/lib/${_pkgname}"
}
