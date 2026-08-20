# Maintainer: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Maintainer: JasonLandbridge
# Packaging repository: https://github.com/JasonLandbridge/Arch-Linux-AUR-Packages-Updater/tree/main/github-mcp-server-bin

_pkgname=github-mcp-server
pkgname=${_pkgname}-bin
pkgver=1.10.1 # renovate: datasource=github-releases depName=github/github-mcp-server versioning=semver-coerced
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
sha256sums_aarch64=('c51dc6cf192c35a328b9f71696d42c38a9a3ba3c2ffe010da836bed071d1ac8a')
sha256sums_i686=('2dfa5bf2b77a78113e70f7f396107f22fe2c7dc74eaee77b13019290a616df32')
sha256sums_x86_64=('c2629e850a344275cfc5a1590acdfd8c11476a44b688812d460163768e05572d')

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
