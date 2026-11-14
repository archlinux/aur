# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Naoki Kanazawa <nk dot naoki912 at gmail dot com>

_pkgname="usacloud"
pkgname="${_pkgname}-bin"
pkgver=1.22.12
pkgrel=2
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
source=(
  "${_pkgsrc}_SHA256SUMS::${url}/releases/download/v${pkgver}/${_pkgname}_SHA256SUMS"
  "${_pkgsrc}_SHA256SUMS.sig::${url}/releases/download/v${pkgver}/${_pkgname}_SHA256SUMS.sig"
)
source_aarch64=(
  "${_pkgsrc}_linux-arm64.zip::${url}/releases/download/v${pkgver}/${_pkgname}_linux-arm64.zip"
)
source_armv7h=(
  "${_pkgsrc}_linux-arm.zip::${url}/releases/download/v${pkgver}/${_pkgname}_linux-arm.zip"
)
source_i686=(
  "${_pkgsrc}_linux-386.zip::${url}/releases/download/v${pkgver}/${_pkgname}_linux-386.zip"
)
source_x86_64=(
  "${_pkgsrc}_linux-amd64.zip::${url}/releases/download/v${pkgver}/${_pkgname}_linux-amd64.zip"
)
sha256sums=('cae9f12fc14f302049e1310b9348b2be9d8cdf3b1887f23e6542cc9e7d31c4d5'
            'SKIP')
sha256sums_aarch64=('b5dc9b14e3b9b65545eb091bcad5ffd5c8404be5d0b8e8fe0ed575294ab8e75c')
sha256sums_armv7h=('f4d4a2594b2335b3b983a3f5eee2a0af0040c87d544da12010ce33f08a211f04')
sha256sums_i686=('708ae1d69572ca1a63b5a6a07a0f170790913f6f5962f0f02dd626594986aaa8')
sha256sums_x86_64=('3be1ab2f1a86d58835d56b49a4d7d8759709b644d3424907ba816e41edb88ff8')
validpgpkeys=(
  'E37EC0B895A9AC27DC4919AB96CEB4B93D86849D' # Usacloud <yamamoto.febc@gmail.com> (https://raw.githubusercontent.com/yamamoto-febc/usacloud/f523cbbd36f46d3ba169941bce80fc9ce74152c2/repos/GPG-KEY-usacloud)
)

verify() {
  sed "s|${_pkgname}_|${_pkgsrc}_|g" "${_pkgsrc}_SHA256SUMS" |
    sha256sum --ignore-missing --check
}

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
