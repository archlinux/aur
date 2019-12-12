# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>
# Contributor: Christoph Korn <christoph.korn at posteo dot de>
_pkgname=chatty
pkgname=${_pkgname}-beta
pkgver=0.11b3
_pkgver=${pkgver//b/-b}
pkgrel=1
pkgdesc='Twitch Chat Client for Desktop'
arch=('any')
url='https://chatty.github.io/'
license=('GPL3')
depends=('java-environment' 'sh')
optdepends=('streamlink: for watching streams in a custom video player.'
            'livestreamer: for watching streams in a custom video player.')
makedepends=('gradle')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}-${_pkgver}.tar.gz::https://github.com/chatty/${_pkgname}/archive/v${_pkgver}.tar.gz"
        "${_pkgname}.desktop"
        "${_pkgname}_script"
        'disable_version_check.patch')
sha512sums=('968c8c04a288ca230933b193a361167c4bcf91da290bff612da56e6437e277ec85dbe22f215efd54de61b398eed0787c0a55d7bae0eca81b9e0a6d71976290cb'
            '6b18009b4e34a2255cec42fd1e136e437aa528c80c40d9f1ab7379ab9e4a637fbd64860fb51e7e57aa0c74165b42f8d4c1ed6a1ffd061d07a02af1ec5167145e'
            'b5ea9a3e77cf5ed006537348371619577aabf86bdb4e90b249c2e3a236b1f1d51920c6af2d2779920a0853cb4f5456fc0a10ad2a788c7c1e5b2649f7f2b756d0'
            '8df69baaf9a0bad68d7c1aac96877b65637c4688d59f9b36f4915b77e2ec9bfa99c67adfe69bca95baee88a585f6f01f5f26eb076079f95bfca9f0ac19180199')

prepare() {
  cd "${_pkgname}-${_pkgver}"
  patch -p1 -i '../disable_version_check.patch'
}

build() {
  cd "${_pkgname}-${_pkgver}"
  gradle --quiet build
  gradle --quiet release
}

package(){
  mkdir "${srcdir}/Chatty_${_pkgver}" && cd "${srcdir}/Chatty_${_pkgver}"
  bsdcpio -i -m --make-directories < "../${_pkgname}-${_pkgver}/build/releases/Chatty_${_pkgver}.zip"
  install -Dm644 'Chatty.jar' "${pkgdir}/usr/share/${_pkgname}/Chatty.jar"
  cp -a 'img' 'sounds' "${pkgdir}/usr/share/${_pkgname}/"
  install -Dm644 'readme.txt' "${pkgdir}/usr/share/doc/${_pkgname}/readme.txt"

  cd "${srcdir}"
  install -Dm755 "${_pkgname}_script" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  cd "${srcdir}/${_pkgname}-${_pkgver}"
  install -Dm644 "./src/chatty/gui/app_main_16.png" "${pkgdir}/usr/share/icons/hicolor/16x16/apps/${_pkgname}.png"
  install -Dm644 "./src/chatty/gui/app_main_64.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/${_pkgname}.png"
  install -Dm644 "./src/chatty/gui/app_main_128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png"
}
