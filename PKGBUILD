# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="dbxcli"
pkgname="${_pkgname}-bin"
pkgver=3.6.0
pkgrel=1
pkgdesc="A command line client for Dropbox built using the Go SDK"
arch=(
  'aarch64'
  'armv7h'
  'x86_64'
)
url="https://github.com/dropbox/${_pkgname}"
license=(
  'Apache-2.0'
)
depends=(
  'glibc'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${url##*/}-${pkgver}"
source_aarch64=(
  "${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz"
)
source_armv7h=(
  "${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm.tar.gz"
)
source_x86_64=(
  "${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz"
)
sha256sums_aarch64=('0bc1f6f7946d9f9679d09894ac7bfb1b020eb085f697def23e1c79a54fa6c6dd')
sha256sums_armv7h=('54799f55a2418153d7c3b4392b7b996e20990bd415a75ac87920a94841eb3ca6')
sha256sums_x86_64=('ce7652f6411614d0b0da994a9e93eca1a753ba6e82ae5cbcb190dc0a0c1bf3c4')

prepare() {
  local source_array="source_${CARCH}[0]"
  local source_url="${!source_array}"
  local source_artifact="${source_url##*/}"

  cd "${srcdir}/${source_artifact%.tar*}"
  chmod +x ./"${_pkgname}"
  mkdir -p "completions"
}

build() {
  local source_array="source_${CARCH}[0]"
  local source_url="${!source_array}"
  local source_artifact="${source_url##*/}"

  cd "${srcdir}/${source_artifact%.tar*}"
  for _sh in bash fish powershell zsh; do
    ./"${_pkgname}" completion "${_sh}" > "completions/${_pkgname}.${_sh}"
  done
} 

package() {
  local source_array="source_${CARCH}[0]"
  local source_url="${!source_array}"
  local source_artifact="${source_url##*/}"

  cd "${srcdir}/${source_artifact%.tar*}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "completions"
  install -vDm644 "${_pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -vDm644 "${_pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
  install -vDm644 "${_pkgname}.powershell" "${pkgdir}/usr/share/powershell/Completions/${_pkgname}.ps1"
  install -vDm644 "${_pkgname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
}
