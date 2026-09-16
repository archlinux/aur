# Maintainer: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Maintainer: JasonLandbridge
# Packaging repository: https://github.com/JasonLandbridge/Arch-Linux-AUR-Packages-Updater/tree/main/github-mcp-server-bin

_pkgname=github-mcp-server
pkgname=${_pkgname}-bin
pkgver=1.12.2 # renovate: datasource=github-releases depName=github/github-mcp-server versioning=semver-coerced
pkgrel=1
pkgdesc="GitHub's official MCP server which connects AI tools directly to GitHub's platform"
arch=('aarch64' 'i686' 'x86_64')
url="https://github.com/github/${_pkgname}"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_aarch64=(
  "${_pkgname}_${pkgver}_Linux_arm64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_arm64.tar.gz"
)
source_i686=(
  "${_pkgname}_${pkgver}_Linux_i386.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_i386.tar.gz"
)
source_x86_64=(
  "${_pkgname}_${pkgver}_Linux_x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_x86_64.tar.gz"
)
sha256sums_aarch64=('2b30f9fcc061b57456cbe38ddc0f13c88863bad49557508a9196f2d1c4cb17a5')
sha256sums_i686=('9d0be9fe3f68b3f4d6a9203b0405d821e839f3cdf6db5cd2e72210b690957f9f')
sha256sums_x86_64=('95843162759da2c31dde082dd145be35db82164594796c294414b69790c2290e')

prepare() {
  chmod +x "${srcdir}/${_pkgname}"
  mkdir -p "${srcdir}/completions"
}

build() {
  local shell
  for shell in bash fish powershell zsh; do
    "${srcdir}/${_pkgname}" completion "${shell}" > "${srcdir}/completions/${_pkgname}.${shell}"
  done
}

package() {
  install -Dm755 "${srcdir}/${_pkgname}" \
    "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/README.md" \
    "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "${srcdir}/completions/${_pkgname}.bash" \
    "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -Dm644 "${srcdir}/completions/${_pkgname}.fish" \
    "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
  install -Dm644 "${srcdir}/completions/${_pkgname}.powershell" \
    "${pkgdir}/usr/share/powershell/Completions/${_pkgname}.ps1"
  install -Dm644 "${srcdir}/completions/${_pkgname}.zsh" \
    "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
}
