# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Naoki Kanazawa <nk dot naoki912 at gmail dot com>

_pkgname="usacloud"
pkgname="${_pkgname}-bin"
pkgver=1.22.0
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
sha256sums_aarch64=('aea698c7064cc610321b73c74daa4b58c3ca54b91b72e0f2330ae1f9a1e616cb')
sha256sums_armv7h=('1db9482f7cb7f6fa13e396e1bc5c981b74d364d634aa3f308a6807b16b11e71f')
sha256sums_i686=('86adaff383fc7cf2cb519bbd89c0933034edc394d5989e15be4c0a991a03e319')
sha256sums_x86_64=('b83c9ce9aad3ba792de8af2a9091c884883a31be7c348af51ba961b7aba0a9d2')

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
