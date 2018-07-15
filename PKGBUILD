# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>
# Contributor: Christoph Korn <christoph.korn at posteo dot de>
pkgname=chatty
pkgver=0.9.1
pkgrel=2
pkgdesc='Twitch Chat Client for Desktop'
arch=('any')
url='https://chatty.github.io/'
license=('GPL3')
depends=('java-environment' 'sh')
optdepends=('streamlink: for watching streams in a custom video player.'
            'livestreamer: for watching streams in a custom video player.')
makedepends=('gradle')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/chatty/chatty/archive/v${pkgver}-emotefix.tar.gz"
        "${pkgname}.desktop"
        "${pkgname}_script"
        'disable_version_check.patch')
sha512sums=('435041d7ad9893058d7d2a32fe669f746a679b3239c5e0e930f29766db4bfede19b84180dfef336ef200bfc84b36b93fd9d2a3ad99054cbeafba9154af4d6b51'
            '6b18009b4e34a2255cec42fd1e136e437aa528c80c40d9f1ab7379ab9e4a637fbd64860fb51e7e57aa0c74165b42f8d4c1ed6a1ffd061d07a02af1ec5167145e'
            'b5ea9a3e77cf5ed006537348371619577aabf86bdb4e90b249c2e3a236b1f1d51920c6af2d2779920a0853cb4f5456fc0a10ad2a788c7c1e5b2649f7f2b756d0'
            '8df69baaf9a0bad68d7c1aac96877b65637c4688d59f9b36f4915b77e2ec9bfa99c67adfe69bca95baee88a585f6f01f5f26eb076079f95bfca9f0ac19180199')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -p1 -i '../disable_version_check.patch'
}

build() {
  cd "chatty-${pkgver}"
  gradle build
  gradle release
}

package(){
  mkdir "${srcdir}/Chatty_${pkgver}" && cd "${srcdir}/Chatty_${pkgver}"
  bsdcpio -i -m --make-directories < "../${pkgname}-${pkgver}/build/releases/Chatty_${pkgver}.zip"
  install -Dm644 'Chatty.jar' "${pkgdir}/usr/share/${pkgname}/Chatty.jar"
  cp -a 'img' 'sounds' "${pkgdir}/usr/share/${pkgname}/"
  install -Dm644 'readme.txt' "${pkgdir}/usr/share/doc/${pkgname}/readme.txt"

  cd "${srcdir}"
  install -Dm755 "${pkgname}_script" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm644 "./src/chatty/gui/app_main_16.png" "${pkgdir}/usr/share/icons/hicolor/16x16/apps/${pkgname}.png"
  install -Dm644 "./src/chatty/gui/app_main_64.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/${pkgname}.png"
  install -Dm644 "./src/chatty/gui/app_main_128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname}.png"
}
