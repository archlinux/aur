# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Conrtibutor: Angelo Verlain  <hey@vixalien.com>

_pkgname="supabase"
pkgname="${_pkgname}-bin"
pkgver=1.190.0
pkgrel=1
pkgdesc="A CLI for Supabase, an open source Firebase alternative"
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgname}/cli"
license=('MIT')
optdepends=('bash-completion: for shell auto-completion'
            'zsh-completions: for shell auto-completion')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_linux_amd64.tar.gz")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_linux_arm64.tar.gz")
sha256sums_x86_64=('e80cf491111b333caae0d3c1407d18d2e316b695c7c66e279d703c6e11008127')
sha256sums_aarch64=('0ee74b6b92625026a10cf6845e3d5fe8f25d968fcdfaab1fc62d911b8c175ff5')

prepare() {
  cd "${srcdir}"
  mkdir -p "completions"
}

build() {
  cd "${srcdir}"

  for _sh in bash fish zsh powershell; do
    ./"${_pkgname}" completion "${_sh}" > "completions/${_pkgname}.${_sh}"
  done
}

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "completions"
  install -Dm644 "${_pkgname}.bash"       "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -Dm644 "${_pkgname}.fish"       "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
  install -Dm644 "${_pkgname}.zsh"        "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
  install -Dm644 "${_pkgname}.powershell" "${pkgdir}/usr/share/powershell/Modules/${_pkgname}/${_pkgname}.ps1"
}
