# Maintainer: Ilya Trukhanov <lahvuun@gmail.com>
#
# This package is based on discorddownloader by simonizor
# http://www.simonizor.gq/discorddownloader.html

pkgname=betterdiscord
pkgver=0.2.82
pkgrel=1
pkgdesc='Discord extension that introduces new features like BTTV emotes and plugin support.'
arch=('any')
url='https://betterdiscord.net/home/'
license=('MIT')
depends=('discord')
makedepends=('asar')
install='BetterDiscord.install'
source=('git+https://github.com/Jiiks/BetterDiscordApp.git#commit=0f2812bc10b3c9695ddf2e28b65bbfe1ae4d1ce7' LICENSE)
md5sums=('SKIP'
         '8414480728c5dc0d4ca9a93cfaf67acb')

package() {
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Get rid of git files.
  mkdir -p "package"
  cp -rf "./BetterDiscordApp/" "./package/"
  cd "./package/BetterDiscordApp/"
  rm -rf ".git"
  rm "./.gitignore"

  install -d "${pkgdir}/usr/lib/${pkgname}/"
  cp -a "./." "${pkgdir}/usr/lib/${pkgname}"
  mv "${pkgdir}/usr/lib/${pkgname}/lib/Utils.js" "${pkgdir}/usr/lib/${pkgname}/lib/utils.js"

  # Patch BetterDiscord files.
  sed -i "s/'\/var\/local'/process.env.HOME + '\/.config'/g" "${pkgdir}/usr/lib/${pkgname}/lib/BetterDiscord.js"
  sed -i "s/bdstorage/bdStorage/g" "${pkgdir}/usr/lib/${pkgname}/lib/BetterDiscord.js"
}
