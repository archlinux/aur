# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Naoki Kanazawa <nk dot naoki912 at gmail dot com>

_pkgname="usacloud"
pkgname="${_pkgname}-bin"
pkgver=1.14.1
pkgrel=2
pkgdesc="CLI client for the Sakura Cloud"
arch=('x86_64' 'aarch64' 'i686' 'armv7h')
url="https://github.com/sacloud/${_pkgname}"
license=('Apache-2.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
noextract=("${_pkgsrc}-"{x86_64,aarch64,i686,armv7h}".tar.gz")
source=("AUTHORS-${pkgver}::${url}/raw/refs/tags/v${pkgver}/AUTHORS")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_linux-amd64.zip")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_linux-arm64.zip")
source_i686=("${_pkgsrc}-i686.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_linux-386.zip")
source_armv7h=("${_pkgsrc}-armv7h.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_linux-arm.zip")
sha256sums=('6fc8ddebe8de3c524e3e9290b967670b8ea0eedd67b53f5ef052dad994ad034d')
sha256sums_x86_64=('860d20a1b46653de996abde93db362f951b3abd596d10152c679ead1b384b2ce')
sha256sums_aarch64=('a4acb6f8cb57e44869afae33f5d0206e3a1c027478e87725cfd921f2288b4dfb')
sha256sums_i686=('0bee6f72ca7b8088cc333bfbb11bcf3cfbb55d4e72c74734b4d634b1cbf0281e')
sha256sums_armv7h=('84de35aeadb3add7e6b42aa0e0d2e9f40496460508b3d8d682392219942106f0')

prepare() {
  cd "${srcdir}"
  mkdir -p "${srcdir}/${_pkgsrc}-${CARCH}"
  bsdtar -xzf "${_pkgsrc}-${CARCH}.tar.gz" -C "${srcdir}/${_pkgsrc}-${CARCH}"

  mv -f "AUTHORS-${pkgver}" "${_pkgsrc}-${CARCH}/AUTHORS"
  
  cd "${_pkgsrc}-${CARCH}"
  mkdir -p "completions"
}

build() {
  cd "${srcdir}/${_pkgsrc}-${CARCH}"
  for _sh in bash fish zsh powershell; do
    ./"${_pkgname}" completion "${_sh}" > "completions/${_pkgname}.${_sh}"
  done
}

package() {
  cd "${srcdir}/${_pkgsrc}-${CARCH}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "AUTHORS"     "${pkgdir}/usr/share/doc/${_pkgname}/AUTHORS"
  install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "completions"
  install -Dm644 "${_pkgname}.bash"       "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -Dm644 "${_pkgname}.fish"       "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
  install -Dm644 "${_pkgname}.zsh"        "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
  install -Dm644 "${_pkgname}.powershell" "${pkgdir}/usr/share/powershell/Modules/${_pkgname}/${_pkgname}.ps1"
}
