# Maintainer:  Daniel Fichtinger <daniel AT ficd DOT ca>
# Contributor:  Vitalii Kuzhdin <vitaliikuzhdin AT gmail DOT com>

_pkgname="tex-fmt"
pkgname="${_pkgname}-bin"
pkgver=0.5.5
pkgrel=1
pkgdesc="An extremely fast LaTeX formatter written in Rust"
arch=('aarch64' 'armv7h' 'x86_64')
url="https://github.com/WGUNDERWOOD/${_pkgname}"
license=('MIT')
depends=('gcc-libs' 'glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${url##*/}-${pkgver}"
source=("${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-aarch64-linux.tar.gz")
source_armv7h=("${_pkgsrc}-armv7h.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-armv7hf-linux.tar.gz")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-x86_64-linux.tar.gz")
sha256sums=('e8b41ca2bcfe6e1d03bd62e486a2e7439bcfeb0de8f03fdbcc1d26cefb251109'
            'd909d9843225ff2ccec3a74f3b13c889fb0bfabb7b3801dcad68505a872c941d')
sha256sums_aarch64=('9ef94afc284c554f8803a1c7c45d520500cc5128cfdc83d9711c9c60fd741475')
sha256sums_armv7h=('18141cb6ed472eb348a569be6576b94876e6dd111a398f11b260c0a284fd531e')
sha256sums_x86_64=('3fcd82c96992f35efcfd9c5b5f3ca2d6ab2f7a2789ebca1db3b466c421d86528')

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
