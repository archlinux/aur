# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="arduino-flasher-cli"
pkgname="${_pkgname}-bin"
pkgver=0.5.1
pkgrel=1
pkgdesc="CLI tool to flash UNO Q boards with the latest Arduino Linux image"
arch=(
  'aarch64'
  'x86_64'
)
url="https://github.com/arduino/${_pkgname}"
license=(
  'GPL-3.0-only'
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
source_aarch64=(
  "${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-arm64.tar.gz"
)
source_x86_64=(
  "${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.tar.gz"
)
sha256sums_aarch64=('fcd92ad01cc34d592a0e471a2291ba767e240b5df1b8bf20575f97c63d350b0f')
sha256sums_x86_64=('64e2d7977c639b87bba890f13938f630f0ba38f40807c3557181b6ad90f20222')

prepare() {
  cd "${srcdir}"
  mkdir -p "completions"
  chmod +x ./"${_pkgname}"
}

build() {
  cd "${srcdir}"
  for _sh in bash fish powershell zsh; do
    ./"${_pkgname}" completion "${_sh}" > "completions/${_pkgname}.${_sh}"
  done
}

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "completions"
  install -vDm644 "${_pkgname}.bash"       "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -vDm644 "${_pkgname}.fish"       "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
  install -vDm644 "${_pkgname}.powershell" "${pkgdir}/usr/share/powershell/Modules/${_pkgname}/${_pkgname}.ps1"
  install -vDm644 "${_pkgname}.zsh"        "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
}
