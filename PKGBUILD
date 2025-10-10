# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Naoki Kanazawa <nk dot naoki912 at gmail dot com>

_pkgname="usacloud"
pkgname="${_pkgname}-bin"
pkgver=1.16.2
pkgrel=1
pkgdesc="CLI client for the Sakura Cloud"
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
url="https://github.com/sacloud/${_pkgname}"
license=('Apache-2.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_linux-arm64.zip")
source_armv7h=("${_pkgsrc}-armv7h.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_linux-arm.zip")
source_i686=("${_pkgsrc}-i686.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_linux-386.zip")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_linux-amd64.zip")
sha256sums_aarch64=('227316bd420c8353a328cf077c1db0135f18723dbeb5742860f07bc554c65f5d')
sha256sums_armv7h=('0486ef6901cf8d14da0fdcac934b82463aa67361f91f98130905bd93df4f0590')
sha256sums_i686=('1c56d6d0317f3f4ec61cf61f9944227c81526929d62f8485a6eb97c5149ff6c8')
sha256sums_x86_64=('c8fe4dcdbae9f2568ac71dc1cdcaf67645b84538196668ee056e209ef247e119')

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
