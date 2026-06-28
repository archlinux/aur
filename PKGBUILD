# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Naoki Kanazawa <nk dot naoki912 at gmail dot com>

_pkgname="usacloud"
pkgname="${_pkgname}-bin"
pkgver=1.22.4
pkgrel=1
pkgdesc="CLI client for the Sakura Cloud"
arch=(
  'aarch64'
  'armv7h'
  'i686'
  'x86_64'
)
url="https://github.com/sacloud/${_pkgname}"
license=(
  'Apache-2.0'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_pkgname}-${pkgver}"
source_aarch64=(
  "${_pkgsrc}-aarch64.zip::${url}/releases/download/v${pkgver}/${_pkgname}_linux-arm64.zip"
)
source_armv7h=(
  "${_pkgsrc}-armv7h.zip::${url}/releases/download/v${pkgver}/${_pkgname}_linux-arm.zip"
)
source_i686=(
  "${_pkgsrc}-i686.zip::${url}/releases/download/v${pkgver}/${_pkgname}_linux-386.zip"
)
source_x86_64=(
  "${_pkgsrc}-x86_64.zip::${url}/releases/download/v${pkgver}/${_pkgname}_linux-amd64.zip"
)
sha256sums_aarch64=('0809446e5398dc7d18552dbafcb1e4b7cd9ce310c0e8cff9d037dc735b697378')
sha256sums_armv7h=('55ed12643ae7709db82a569410cf6b35ae3357d7705245e6cf2439418fc42eba')
sha256sums_i686=('8d55a1e9233e66f564eef73caa64b8bfe57874b0ab7e9c97d6f10d06632bfafa')
sha256sums_x86_64=('9bb3fbd7f3fb08b513ec5aadefbf3d7778b005fe4847c05e70de111353a3006d')

prepare() {
  cd "${srcdir}"
  chmod +x ./"${_pkgname}"
  mkdir -p "completions"
}

build() {
  cd "${srcdir}"
  for _sh in bash fish zsh powershell; do
    ./"${_pkgname}" completion "${_sh}" > "completions/${_pkgname}.${_sh}"
  done
}

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}"  "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
  install -vDm644 "README.md"    "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE.txt"  "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "completions"
  install -vDm644 "${_pkgname}.bash"       "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -vDm644 "${_pkgname}.fish"       "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
  install -vDm644 "${_pkgname}.powershell" "${pkgdir}/usr/share/powershell/Modules/${_pkgname}/${_pkgname}.ps1"
  install -vDm644 "${_pkgname}.zsh"        "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
}
