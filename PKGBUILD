# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="github-mcp-server"
pkgname="${_pkgname}-bin"
pkgver=0.32.0
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
_pkgsrc="${_pkgname}-${pkgver}"
source_aarch64=(
  "${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_arm64.tar.gz"
)
source_i686=(
  "${_pkgsrc}-i686.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_i386.tar.gz"
)
source_x86_64=(
  "${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_x86_64.tar.gz"
)
sha256sums_aarch64=('def367faff0bd5b971765f407df24f8679938e8fbcb467896c8ab8a39ad92ba4')
sha256sums_i686=('504b26a3ca5868c3bb97e79d19d8ae07e068391cd558a639671124dfb0a5694b')
sha256sums_x86_64=('c90fcbd681b716fdb845cc6e19f88fac1c26fec0b8084b11ef39fc410a17e304')

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
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "completions"
  install -vDm644 "${_pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -vDm644 "${_pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
  install -vDm644 "${_pkgname}.powershell" "${pkgdir}/usr/share/powershell/Completions/${_pkgname}.ps1"
  install -vDm644 "${_pkgname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
}
