# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="starkli"
pkgname="${_pkgname}-bin"
pkgver=0.4.1
pkgrel=1
pkgdesc="A blazing fast CLI tool for Starknet powered by starknet-rs"
arch=('aarch64' 'x86_64')
url="https://book.starkli.rs"
_url="https://github.com/xJonathanLEI/${_pkgname}"
license=('Apache-2.0 OR MIT')
depends=('gcc-libs' 'glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${_url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE-APACHE-2.0::${_url}/raw/refs/tags/v${pkgver}/LICENSE-APACHE"
        "${_pkgsrc}-LICENSE-MIT::${_url}/raw/refs/tags/v${pkgver}/LICENSE-MIT")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}-aarch64-unknown-linux-gnu.tar.gz")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu.tar.gz")
b2sums=('dc2a6d314688b9836c021ffcab1d449c62d0e346ca964900a991914b5c29fdee6aa323e41a90e75d4cc71471e21b36518daaa533c0154edabe38845bd058703b'
        'bb6c98c86c05f7f782bed93821edbd8d51501780fd5279904a7f69392841fe91ffcc7632834ecac81701b85db0779efa40ff6053f7336a1074130099ca2d310f'
        'a6150ce3c1f2e9823f944cb92016eb6c0fa35d9c80a3c1d04092b25e05a970929ed49154dcbe1707bf7d4946ee0f25fb501f9b192a23775c8e186a9619dd4b7b')
b2sums_aarch64=('e515f7f78fe6aa30a5db92e3020340e74c062cc0a72fd3b1865cdf896f00c5aff10e23e0c24900bd5755aec88625faddad8cdd869991e9ccfa2f36321b1d60ae')
b2sums_x86_64=('37998193a3f0718c71d380beca88b2d93228d96babb5255347386552b5c71e817290a3b4f4ef7ebe5cde589424845a3266a56da0628b0dd1bdb92ced8c328fc7')

prepare() {
  cd "${srcdir}"
  mkdir -p "completions"
  chmod +x "${_pkgname}"
}

build() {
  cd "${srcdir}"
  for _sh in bash fish zsh elvish powershell; do
    ./"${_pkgname}" completions "${_sh}" > "completions/${_pkgname}.${_sh}"
  done
}

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE-APACHE-2.0" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-APACHE-2.0"
  install -vDm644 "${_pkgsrc}-LICENSE-MIT" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-MIT"

  cd "completions"
  install -vDm644 "${_pkgname}.bash"       "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -vDm644 "${_pkgname}.fish"       "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
  install -vDm644 "${_pkgname}.zsh"        "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
  install -vDm644 "${_pkgname}.elvish"     "${pkgdir}/usr/share/elvish/completions/${_pkgname}.elv"
  install -vDm644 "${_pkgname}.powershell" "${pkgdir}/usr/share/powershell/Modules/${_pkgname}/${_pkgname}.ps1"
}
