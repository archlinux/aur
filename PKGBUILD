# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Naoki Kanazawa <nk dot naoki912 at gmail dot com>

_pkgname="usacloud"
pkgname="${_pkgname}-bin"
pkgver=1.18.0
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
sha256sums_aarch64=('c11dc7ae63a10caf52364d0347223bfd68689cc186381f07f23b7c047546abf8')
sha256sums_armv7h=('01c071381be8e2f13b5adbf3d4fdda13300bb3d8f98adb3a173c1aae52e8e56d')
sha256sums_i686=('090365ed9be05cd416925254c499fd2e791130fb03bbc840099777a084a0d322')
sha256sums_x86_64=('bd8c63e97f47c0b8169f2055e3030032dbaa5f8b30da47584a1a1ae4f236c19b')

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
