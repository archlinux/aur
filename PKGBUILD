# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="starkli"
pkgname="${_pkgname}-bin"
pkgver=0.3.7
pkgrel=1
pkgdesc="A blazing fast CLI tool for Starknet powered by starknet-rs"
arch=('x86_64' 'aarch64')
url="https://book.starkli.rs"
_url="https://github.com/xJonathanLEI/${_pkgname}"
license=('Apache-2.0 OR MIT')
depends=('gcc-libs' 'glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${_url}/raw/v${pkgver}/README.md"
        "LICENSE-APACHE-2.0-${pkgver}::${_url}/raw/v${pkgver}/LICENSE-APACHE"
        "LICENSE-MIT-${pkgver}::${_url}/raw/v${pkgver}/LICENSE-MIT")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}-aarch64-unknown-linux-gnu.tar.gz")
b2sums=('dc2a6d314688b9836c021ffcab1d449c62d0e346ca964900a991914b5c29fdee6aa323e41a90e75d4cc71471e21b36518daaa533c0154edabe38845bd058703b'
        'bb6c98c86c05f7f782bed93821edbd8d51501780fd5279904a7f69392841fe91ffcc7632834ecac81701b85db0779efa40ff6053f7336a1074130099ca2d310f'
        'a6150ce3c1f2e9823f944cb92016eb6c0fa35d9c80a3c1d04092b25e05a970929ed49154dcbe1707bf7d4946ee0f25fb501f9b192a23775c8e186a9619dd4b7b')
b2sums_x86_64=('dc7ef898cbf2a637dfdd781e1c206c457c8127882692b388ae4c86833cf0efaa260c6bb445e6cf16b2a3d3cb89590cdf24dd5da34c442f0938cbe1654a04c4eb')
b2sums_aarch64=('6822821f70ba8a825ee7e4cde5439be7c6d9d33351b444cf27c2c34f91471dbf446700e2254832f2c8e4d6b546c55d0a4498c799e1c38a77aad5b96e0d2deb44')

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
  install -vDm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE-APACHE-2.0-${pkgver}" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-APACHE-2.0"
  install -vDm644 "LICENSE-MIT-${pkgver}" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-MIT"

  cd "completions"
  install -vDm644 "${_pkgname}.bash"       "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -vDm644 "${_pkgname}.fish"       "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
  install -vDm644 "${_pkgname}.zsh"        "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
  install -vDm644 "${_pkgname}.elvish"     "${pkgdir}/usr/share/elvish/completions/${_pkgname}.elv"
  install -vDm644 "${_pkgname}.powershell" "${pkgdir}/usr/share/powershell/Modules/${_pkgname}/${_pkgname}.ps1"
}
