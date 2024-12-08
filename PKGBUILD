# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: hu3rror <hu3rror@protonmail.com>
# Contributor: Asuka Minato

_binname="space"
_pkgname="${_binname}-cli"
pkgname="${_pkgname}-bin"
_pkgver=0.5.0-rc.0
pkgver="${_pkgver//-rc./rc}"
pkgrel=1
pkgdesc="Deta Space CLI"
arch=('x86_64' 'aarch64')
url="https://deta.space"
_url="https://github.com/deta/${_pkgname}"
license=('MIT')
provides=("${_pkgname}" "${_binname}")
conflicts=("${_pkgname}" "${_binname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_x86_64=("${_pkgsrc}-x86_64.zip::${_url}/releases/download/v${_pkgver}/${_binname}-linux-x86_64.zip")
source_aarch64=("${_pkgsrc}-aarch64.zip::${_url}/releases/download/v${_pkgver}/${_binname}-linux-arm64.zip")
sha256sums_x86_64=('87e4ba4e28fe84ce9c2d5d86767da1e507ff5509bfc63877951fe0e004677274')
sha256sums_aarch64=('6beca64b1baa61806709e1b0d61427804fdb236e6042e4a2fabad542c8beb0bf')

prepare() {
  cd "${srcdir}"
  mkdir -p "completions"
}

build() {
  cd "${srcdir}"
  for _sh in bash fish zsh powershell; do
    ./"${_binname}" completion "${_sh}" > "completions/${_binname}.${_sh}"
  done
}

package() {
  cd "${srcdir}"
  install -vDm755 "${_binname}" "${pkgdir}/usr/bin/${_binname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "completions"
  install -vDm644 "${_binname}.bash"       "${pkgdir}/usr/share/bash-completion/completions/${_binname}"
  install -vDm644 "${_binname}.fish"       "${pkgdir}/usr/share/fish/vendor_completions.d/${_binname}.fish"
  install -vDm644 "${_binname}.zsh"        "${pkgdir}/usr/share/zsh/site-functions/_${_binname}"
  install -vDm644 "${_binname}.powershell" "${pkgdir}/usr/share/powershell/Completions/${_binname}.ps1"
}
