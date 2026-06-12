# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="github-mcp-server"
pkgname="${_pkgname}-bin"
pkgver=1.3.0
pkgrel=1
pkgdesc="GitHub's official MCP server which connects AI tools directly to GitHub's platform"
arch=(
  'aarch64'
  'i686'
  'x86_64'
)
url="https://github.com/github/${_pkgname}"
license=(
  'MIT'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
source_aarch64=(
  "${_pkgname}_${pkgver}_Linux_arm64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_arm64.tar.gz"
)
source_i686=(
  "${_pkgname}_${pkgver}_Linux_i386.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_i386.tar.gz"
)
source_x86_64=(
  "${_pkgname}_${pkgver}_Linux_x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_x86_64.tar.gz"
)
sha256sums_aarch64=('fe9edce9366774771a6911b77a83c6fcdc21babf74cf5cf1585ba5d17d3734b6')
sha256sums_i686=('97f31790ba1825d11101b69512cb571647beaf051c3ac191c0ef4811643c9578')
sha256sums_x86_64=('4c9a8ea487df9ce58ae73bb0c93bf8c95a0d31832ce90ebca6ac1f414ea80447')

prepare() {
  cd "${srcdir}"
  chmod +x ./"${_pkgname}"
  mkdir -p "completions"
}

build() {
  for _sh in bash fish powershell zsh; do
    ./"${_pkgname}" completion "${_sh}" > "completions/${_pkgname}.${_sh}"
  done
} 

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -vDm644 "README.md"   -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -vDm644 "LICENSE"     -t "${pkgdir}/usr/share/licenses/${_pkgname}"

  cd "completions"
  install -vDm644 "${_pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -vDm644 "${_pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
  install -vDm644 "${_pkgname}.powershell" "${pkgdir}/usr/share/powershell/Completions/${_pkgname}.ps1"
  install -vDm644 "${_pkgname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
}
