# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="starkli"
pkgname="${_pkgname}-bin"
pkgver=0.4.2
pkgrel=1
pkgdesc="A blazing fast CLI tool for Starknet powered by starknet-rs"
arch=(
  'aarch64'
  'x86_64'
)
url="https://book.starkli.rs"
_url="https://github.com/xJonathanLEI/${_pkgname}"
license=(
  'Apache-2.0 OR MIT'
)
depends=(
  'glibc'
  'libgcc'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_url##*/}-${pkgver}"
source=(
  "${_pkgsrc}-LICENSE-APACHE::${_url}/raw/refs/tags/v${pkgver}/LICENSE-APACHE"
  "${_pkgsrc}-LICENSE-MIT::${_url}/raw/refs/tags/v${pkgver}/LICENSE-MIT"
  "${_pkgsrc}-README.md::${_url}/raw/refs/tags/v${pkgver}/README.md"
)
source_aarch64=(
  "${_pkgname}-${pkgver}-aarch64-unknown-linux-gnu.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}-aarch64-unknown-linux-gnu.tar.gz"
)
source_x86_64=(
  "${_pkgname}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu.tar.gz"
)
sha256sums=('93ca65a55581bae536fc2e6bafc613f22fc1bec74b36081ea08ccb199fed4e48'
            'ece393ef82b9a2c92affd94872d3b52064f8a82904f64861b93e49b1fc7833d5'
            'c754365c41980e392e9c2e8d6c446b4856e1d7da6d4a95ac80debfb3de51cc56')
sha256sums_aarch64=('2d2d48bbf81190d7541accfe4f0ea846f56998919ce10833f683927d636810c0')
sha256sums_x86_64=('da6ec4597cf17ddbb803fbb1c032a14ed09e4b7b57bbcf7683854f9d3f51757a')

prepare() {
  cd "${srcdir}"
  mkdir -p "completions"
  chmod +x "./${_pkgname}"
}

build() {
  cd "${srcdir}"
  for _sh in bash elvish fish powershell zsh; do
    ./"${_pkgname}" completions "${_sh}" > "completions/${_pkgname}.${_sh}"
  done
}

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-APACHE-2.0"
  install -vDm644 "${_pkgsrc}-LICENSE-MIT" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-MIT"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"

  cd "completions"
  install -vDm644 "${_pkgname}.bash"       "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -vDm644 "${_pkgname}.elvish"     "${pkgdir}/usr/share/elvish/completions/${_pkgname}.elv"
  install -vDm644 "${_pkgname}.fish"       "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
  install -vDm644 "${_pkgname}.powershell" "${pkgdir}/usr/share/powershell/Modules/${_pkgname}/${_pkgname}.ps1"
  install -vDm644 "${_pkgname}.zsh"        "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
}
