# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: hu3rror <hu3rror@protonmail.com>
# Contributor: Asuka Minato

_binname="space"
_pkgname="${_binname}-cli"
pkgname="${_pkgname}-bin"
pkgver=0.4.2
pkgrel=3
pkgdesc="Deta Space CLI"
arch=('x86_64' 'aarch64')
url="https://deta.space"
_url="https://github.com/deta/${_pkgname}"
license=('MIT')
optdepends=('bash-completion: for shell auto-completion'
            'zsh-completions: for shell auto-completion')
provides=("${_pkgname}" "${_binname}")
conflicts=("${_pkgname}" "${_binname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_x86_64=("${_pkgsrc}-x86_64.zip::${_url}/releases/download/v${pkgver}/${_binname}-linux-x86_64.zip")
source_aarch64=("${_pkgsrc}-aarch64.zip::${_url}/releases/download/v${pkgver}/${_binname}-linux-arm64.zip")
sha256sums_x86_64=('e0b458a8a967bdfa14dbc81a82f35db420ce6adb5562311ac474165f94084624')
sha256sums_aarch64=('ff10ebb0111b84b2fc9a4ccb75e515bccac8ddff94cf6deeae6bb4bef64d8f12')

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
  install -Dm755 "${_binname}" "${pkgdir}/usr/bin/${_binname}"
  install -Dm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "completions"
  install -Dm644 "${_binname}.bash"       "${pkgdir}/usr/share/bash-completion/completions/${_binname}"
  install -Dm644 "${_binname}.fish"       "${pkgdir}/usr/share/fish/vendor_completions.d/${_binname}.fish"
  install -Dm644 "${_binname}.zsh"        "${pkgdir}/usr/share/zsh/site-functions/_${_binname}"
  install -Dm644 "${_binname}.powershell" "${pkgdir}/usr/share/powershell/Completions/${_binname}.ps1"
}
