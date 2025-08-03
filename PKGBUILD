# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_sdk=9.0
_Name="FsAutoComplete"
_pkgname="${_Name,,}"
pkgname="${_pkgname}-bin"
pkgver=0.78.5
pkgrel=1
pkgdesc="F# language server using Language Server Protocol (LSP)"
arch=('any')
url="https://ionide.io/Tools/fsac.html"
_url="https://github.com/ionide/${_Name}"
license=('Apache-2.0')
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
sha256sums=('bc6bff9aac510e0e6acd9905c99242de2ea0c42c26a8c40dfea1de39cc164b8a'
            '5a9fb77d05a40f55b22b89b50883eca48ec3c09afcbe4324c0f3370064575d2f'
            'c4f2f8970c4eeaa055c42d591896f2fe1439bab11b756fc7533da652c7e4e57a'
            '1ee6b06043c1f7eca730ecb0e4d2272c451077f6c96ff66fdd252d29843ba482'
            '57f541c67d8b96c2354bf9a76b29a789281f5f4a166f2619e096521af5351b5e')

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
