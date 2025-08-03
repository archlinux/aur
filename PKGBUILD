# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_sdk=9.0
_Name="FSharpLint"
_pkgname="${_Name,,}"
pkgname="${_pkgname}-bin"
pkgver=0.26.0
pkgrel=1
pkgdesc="Lint tool for F#"
arch=('any')
url="https://fsprojects.github.io/FSharpLint/"
_url="https://github.com/fsprojects/${_Name}"
license=('MIT')
depends=("dotnet-runtime-${_sdk}" 'sh')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
# options=('!strip' '!debug')
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}.nupkg::${_url}/releases/download/v${pkgver}/dotnet-${_pkgname}.${pkgver}.nupkg"
        "${_pkgsrc}-CHANGELOG.md::${_url}/raw/refs/tags/v${pkgver}/CHANGELOG.md"
        "${_pkgsrc}-README.md::${_url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${_url}/raw/refs/tags/v${pkgver}/LICENSE"
        "${_pkgname}.sh")
sha256sums=('be7c1a30d8dbbae834cfaa7a001fc63e5ef719366147731374a148eb4a63acfd'
            '3b8eb2e3233d8d55ba14882681e61ea84a9c273051d63e44843a65d8d7222ba0'
            'b6c948d984c0ab5f051d8f6931656ab5f44aebe9bb5f94ce10d0e2587a48fb91'
            '444b89818cfef1c9087bc85dd6c69e962884c66fe32dfaca32322bee8e8dedd6'
            '5b9e89ddefc37d5dca2766f534752657aa7b00cde61a3fdcce422bc3d18cf927')

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
  install -vDm644 "${_pkgsrc}-LICENSE"      "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "tools/net${_sdk}/any"
  install -vd "${pkgdir}/usr/lib/${_pkgname}"
  cp -vr --no-preserve=ownership . "${pkgdir}/usr/lib/${_pkgname}"
}
