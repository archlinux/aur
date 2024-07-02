# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Conrtibutor: Angelo Verlain  <hey@vixalien.com>

_pkgname="supabase"
pkgname="${_pkgname}-bin"
pkgver=1.179.5
pkgrel=1
pkgdesc="A CLI for Supabase, an open source Firebase alternative"
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgname}/cli"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_linux_arm64.tar.gz")
sha256sums_x86_64=('cd979f13f10317b16ee8133e0d2d276c4c709bb0bc61ccf9af310ce404075241')
sha256sums_aarch64=('ea98baf9f01c2e87ef97762ba2b170a11e212ec1fa04a32819066f34402d12d8')
optdepends=('bash-completion: for shell auto-completion'
            'zsh-completions: for shell auto-completion')

prepare() {
  cd "${srcdir}"
  [ -d "completions" ] || mkdir "completions"

  for _sh in bash fish zsh; do
    ./"${_pkgname}" completion "${_sh}" > "completions/${_pkgname}.${_sh}"
  done
}

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "completions"
  install -Dm644 "${_pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -Dm644 "${_pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
  install -Dm644 "${_pkgname}.zsh"  "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
}
