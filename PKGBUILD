# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_sdk=6.0
_Name="Myriad"
_pkgname="${_Name,,}"
pkgname="${_pkgname}-bin"
pkgver=0.8.3
pkgrel=1
pkgdesc="Code generator for F#"
arch=('any')
url="https://github.com/MoiraeSoftware/${_Name}"
license=('Apache-2.0')
depends=("dotnet-runtime-${_sdk}" 'sh')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
# options=('!strip' '!debug')
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}.nupkg::${url}/releases/download/v${pkgver}/${_Name}.${pkgver}.nupkg"
        "${_pkgsrc}-CHANGELOG.md::${url}/raw/refs/tags/v${pkgver}/CHANGELOG.md"
        "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE"
        "${_pkgname}.sh")
sha256sums=('fca39a9956f0ef5a21db2988b28d482e4b09c826aabe1ed6abfaf4944dbf39a1'
            '2aa34e08c464831a3e03a352efb9c8c795093b29144bc008312137f2277663d6'
            'd1215c39b4ce818077f6409ad4b3980e548b0b71d2d746d7043d1eb47223bd68'
            '6ec0047276c867e62803fe798fd9a3762096a08a7e6ddfca4b3b9c9057b0b0d7')

if   [ "${CARCH}" = 'aarch64' ]; then _msarch=arm64;
elif [ "${CARCH}" = 'armv7h'  ]; then _msarch=arm;
elif [ "${CARCH}" = 'i686'    ]; then _msarch=x86;
elif [ "${CARCH}" = 'x86_64'  ]; then _msarch=x64; fi

prepare() {
  cd "${srcdir}/tools/net${_sdk}/any/runtimes"
  # find . -mindepth 1 -maxdepth 1 -type d ! -name "linux-${_msarch}" -exec \
  #   rm -rf "{}" +
  rm -rf "win"
}

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}.sh"          "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"               "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-CHANGELOG.md" "${pkgdir}/usr/share/doc/${_pkgname}/CHANGELOG.md"
  install -vDm644 "${_pkgsrc}-LICENSE"      "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "tools/net${_sdk}/any"
  install -vd "${pkgdir}/usr/lib/${_pkgname}"
  cp -vr --no-preserve=ownership . "${pkgdir}/usr/lib/${_pkgname}"
}
