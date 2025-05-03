# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="tex-fmt"
pkgname="${_pkgname}-bin"
pkgver=0.5.4
pkgrel=1
pkgdesc="An extremely fast LaTeX formatter written in Rust"
arch=('aarch64' 'armv7h' 'x86_64')
url="https://github.com/WGUNDERWOOD/${_pkgname}"
license=('MIT')
depends=('gcc-libs' 'glibc')
_pkgsrc="${url##*/}-${pkgver}"
source=("${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-aarch64-linux.tar.gz")
source_armv7h=("${_pkgsrc}-armv7h.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-armv7hf-linux.tar.gz")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-x86_64-linux.tar.gz")
sha256sums=('15ab0e5ad5cc45dca930d94172ae0c018f11b4c7838d425fbc1c3561d0599631'
            'd909d9843225ff2ccec3a74f3b13c889fb0bfabb7b3801dcad68505a872c941d')
sha256sums_aarch64=('a2e91ac4d198b68b57810da18a04e5b7a6286dc956aa0a6ae5a7ad45b6fe47c2')
sha256sums_armv7h=('26230ae444530db0249f0cea90e5991c840e054bdd4b752cdc0f845372dc351c')
sha256sums_x86_64=('ee5e69ef4f3ab719649e241c7027ab4f3ee3de17d3f956a9d6c5b14df0724297')

prepare() {
  cd "${srcdir}"
  mkdir -p "completions" "manpages"
  chmod +x ./"${_pkgname}"

  for _sh in bash fish elvish powershell zsh; do
    ./"${_pkgname}" --completion "${_sh}" > "completions/${_pkgname}.${_sh}"
  done
  ./"${_pkgname}" --man > "manpages/${_pkgname}.1"
}

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "${srcdir}/completions"
  install -vDm644 "${_pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -vDm644 "${_pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
  install -vDm644 "${_pkgname}.elvish" "${pkgdir}/usr/share/elvish/lib/${_pkgname}.elv"
  install -vDm644 "${_pkgname}.powershell" "${pkgdir}/usr/share/powershell/Completions/${_pkgname}.ps1"
  install -vDm644 "${_pkgname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"

  cd "${srcdir}/manpages"
  install -vDm644 "${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
}
