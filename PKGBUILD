# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Naoki Kanazawa <nk dot naoki912 at gmail dot com>

_pkgname="usacloud"
pkgname="${_pkgname}-bin"
pkgver=1.21.0
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
sha256sums_aarch64=('a444e3ef9bd7ef550f11e603ff9a2e17ff5d7d25b7d851b4aaefbc7543cfc141')
sha256sums_armv7h=('5546e27fda0d7f288fd60fae6d10007e59976483742fcee3a4b95b5c314b60cb')
sha256sums_i686=('23bcd308a34f328b94354195070411ffb33f00c9883339711539bc8edec03353')
sha256sums_x86_64=('dc046f21b412365ab319a03497e781cbc7bf4612c1566323dbc9c2923c8dd22e')

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
