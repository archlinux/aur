# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_sdk=8.0
_Name="Fantomas"
_pkgname="${_Name,,}"
pkgname="${_pkgname}-bin"
pkgver=7.0.3
pkgrel=1
pkgdesc="F# source code formatter"
arch=('any')
url="https://fsprojects.github.io/fantomas/"
_url="https://github.com/fsprojects/${_pkgname}"
license=('Apache-2.0')
depends=("dotnet-runtime-${_sdk}" 'sh')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
# options=('!strip' '!debug')
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}.nupkg::${_url}/releases/download/v${pkgver}/${_pkgname}.${pkgver}.nupkg"
        "${_pkgsrc}-CHANGELOG.md::${_url}/raw/refs/tags/v${pkgver}/CHANGELOG.md"
        "${_pkgsrc}-README.md::${_url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE.md::${_url}/raw/refs/tags/v${pkgver}/LICENSE.md"
        "${_pkgname}.sh")
sha256sums=('afbd4a0372c5ce5d31633d191364414b2db881032e0a3ceb1b532c8a2e79a227'
            '4a5732d393c6d1cd311807fd22ecaf04745cd4f6c1c32913c2a2892ecf453070'
            'd221b9cccf3821eadcc95cd45c3ed18cd20c41e00831df15cee095bc5237123a'
            'afbf346a88919ce664b55a0078d385dfbd26c11b3f74043928055e99aea1eb6c'
            'a913c19f26ef163d08ac01ed700f00968c256271f08bfbbf6b2461e66ed2e769')

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
