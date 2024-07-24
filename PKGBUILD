# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="starkli"
pkgname="${_pkgname}-bin"
pkgver=0.3.3
pkgrel=1
pkgdesc="A blazing fast CLI tool for Starknet powered by starknet-rs"
arch=('x86_64' 'aarch64')
url="https://book.starkli.rs"
_url="https://github.com/xJonathanLEI/${_pkgname}"
license=('Apache-2.0' 'MIT')
depends=('glibc' 'gcc-libs')
optdepends=('bash-completion: for shell auto-completion'
            'zsh-completions: for shell auto-completion')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${_url}/raw/v${pkgver}/README.md"
        "LICENSE-APACHE-2.0-${pkgver}::${_url}/raw/v${pkgver}/LICENSE-APACHE"
        "LICENSE-MIT-${pkgver}::${_url}/raw/v${pkgver}/LICENSE-MIT")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('c754365c41980e392e9c2e8d6c446b4856e1d7da6d4a95ac80debfb3de51cc56'
            '93ca65a55581bae536fc2e6bafc613f22fc1bec74b36081ea08ccb199fed4e48'
            'ece393ef82b9a2c92affd94872d3b52064f8a82904f64861b93e49b1fc7833d5')
sha256sums_x86_64=('9c3df145a65aade4732af25686e95cea3fa725e0f6b9d0019abb5a57d6c409e6')
sha256sums_aarch64=('53397d3bf7ee6e7648ccc7d3e6e46995df8f3e668f17fdccaf1f60d50a8f114d')

prepare() {
  cd "${srcdir}"
  mkdir -p "completions"
}

build() {
  cd "${srcdir}"
  for _sh in bash fish zsh elvish powershell; do
    ./"${_pkgname}" completions "${_sh}" > "completions/${_pkgname}.${_sh}"
  done
}

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE-APACHE-2.0-${pkgver}" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-APACHE-2.0"
  install -Dm644 "LICENSE-MIT-${pkgver}" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-MIT"

  cd "completions"
  install -Dm644 "${_pkgname}.bash"       "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -Dm644 "${_pkgname}.fish"       "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
  install -Dm644 "${_pkgname}.zsh"        "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
  install -Dm644 "${_pkgname}.elvish"     "${pkgdir}/usr/share/elvish/completions/${_pkgname}.elv"
  install -Dm644 "${_pkgname}.powershell" "${pkgdir}/usr/share/powershell/Modules/${_pkgname}/${_pkgname}.ps1"
}
