# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_sdk=6.0
_Name="Fornax"
_pkgname="${_Name,,}"
pkgname="${_pkgname}-bin"
pkgver=0.15.1
pkgrel=1
pkgdesc="Scriptable static site generator using type safe F# DSL to define page templates"
arch=('x86_64')
url="https://ionide.io/Tools/fornax.html"
_url="https://github.com/ionide/${_Name}"
license=('MIT')
depends=("dotnet-runtime-${_sdk}" 'sh')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
# options=('!strip' '!debug')
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}.nupkg::${_url}/releases/download/v${pkgver}/${_Name}.${pkgver}.nupkg"
        "${_pkgsrc}-CHANGELOG.md::${_url}/raw/refs/tags/v${pkgver}/CHANGELOG.md"
        "${_pkgsrc}-README.md::${_url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE.md::${_url}/raw/refs/tags/v${pkgver}/LICENSE.md"
        "${_pkgname}.sh")
sha256sums=('5b1ac536983009afd5386c9b88bf879bc3c28e4cb783e5708c89826988752352'
            'db23f19f52e3e0b56dd32138ff3e566658d37236ab5d5d7cef9cef73b53f541e'
            '12e7b8329ec96f21d339ad2662afcb4b600b7577ffa96c3c5d8b686c0a916722'
            'e36af2669100520ba3318e44afce954492013875b916d78de9d3e93a41c8d736'
            'b075b4a61f0cdce2de559834cae2db9b1be9c5b9e35cf26793bf04295abb79bf')

if   [ "${CARCH}" = 'aarch64' ]; then _msarch=arm64;
elif [ "${CARCH}" = 'armv7h'  ]; then _msarch=arm;
elif [ "${CARCH}" = 'i686'    ]; then _msarch=x86;
elif [ "${CARCH}" = 'x86_64'  ]; then _msarch=x64; fi

prepare() {
  cd "${srcdir}/tools/net${_sdk}/any/runtimes"
  find . -mindepth 1 -maxdepth 1 -type d ! -name "linux-${_msarch}" -exec \
    rm -rf "{}" +
}

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}.sh"          "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-CHANGELOG.md" "${pkgdir}/usr/share/doc/${_pkgname}/CHANGELOG.md"
  install -vDm644 "${_pkgsrc}-README.md"    "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE.md"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"

  cd "tools/net${_sdk}/any"
  install -vd "${pkgdir}/usr/lib/${_pkgname}"
  cp -vr --no-preserve=ownership . "${pkgdir}/usr/lib/${_pkgname}"
}
