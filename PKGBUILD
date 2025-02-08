# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Conrtibutor: Angelo Verlain  <hey@vixalien.com>

_name="supabase"
_pkgname="${_name}-beta"
pkgname="${_pkgname}-bin"
pkgver=2.12.0
pkgrel=1
pkgdesc="CLI for Supabase, an open source Firebase alternative"
arch=('aarch64' 'x86_64')
url="https://supabase.com/docs/reference/cli/about"
_url="https://github.com/${_name}/cli"
license=('MIT')
provides=("${_name}" "${_pkgname}")
conflicts=("${_name}" "${_pkgname}")
_pkgsrc="${_name}-${pkgver}"
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${_url}/releases/download/v${pkgver}/${_name}_linux_arm64.tar.gz")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${_url}/releases/download/v${pkgver}/${_name}_linux_amd64.tar.gz")
sha256sums_aarch64=('2a2523e03cbd2fb6b375062f8562004177c4b99e521639062f83fe4dd4b8898c')
sha256sums_x86_64=('1ffbea91b48f05320397e0f5698990367278a74da83d279eafdaa79b79c070c8')

prepare() {
  cd "${srcdir}"
  mkdir -p "completions"
}

build() {
  cd "${srcdir}"
  chmod +x "${_name}"
  for _sh in bash fish zsh powershell; do
    ./"${_name}" completion "${_sh}" > "completions/${_name}.${_sh}"
  done
}

package() {
  cd "${srcdir}"
  install -vDm755 "${_name}"  "${pkgdir}/usr/bin/${_name}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${_name}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${_name}/LICENSE"

  cd "completions"
  install -vDm644 "${_name}.bash"       "${pkgdir}/usr/share/bash-completion/completions/${_name}"
  install -vDm644 "${_name}.fish"       "${pkgdir}/usr/share/fish/vendor_completions.d/${_name}.fish"
  install -vDm644 "${_name}.zsh"        "${pkgdir}/usr/share/zsh/site-functions/_${_name}"
  install -vDm644 "${_name}.powershell" "${pkgdir}/usr/share/powershell/Modules/${_name}/${_name}.ps1"
}
