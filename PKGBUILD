# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Conrtibutor: Angelo Verlain  <hey@vixalien.com>

_pkgname="supabase"
pkgname="${_pkgname}-bin"
pkgver=1.192.5
pkgrel=1
pkgdesc="A CLI for Supabase, an open source Firebase alternative"
arch=('x86_64' 'aarch64')
url="https://supabase.com/docs/reference/cli/about"
_url="https://github.com/${_pkgname}/cli"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}_linux_amd64.tar.gz")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}_linux_arm64.tar.gz")
sha256sums_x86_64=('87fcf53e1aad4b763a94c5c706f66346ca0c6c873f3180ec39cf42788c63e6ec')
sha256sums_aarch64=('b784b3f3af6f863ef5d6c4c047eb3cc6dc7adb6340e1c2bd47ea41f407c60750')

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
