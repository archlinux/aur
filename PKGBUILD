# Maintainer: Ilya Trukhanov <lahvuun@gmail.com>
#
# This package is based on discorddownloader by simonizor
# http://www.simonizor.gq/discorddownloader.html

pkgname=betterdiscord
pkgver=0.2.82.r450.1a6648eb
pkgrel=1
pkgdesc='Discord extension that introduces new features like BTTV emotes and plugin support.'
arch=('any')
url='https://betterdiscord.net/home/'
license=('MIT')
depends=('discord')
makedepends=('asar')
install='BetterDiscord.install'
source=('git+https://github.com/Jiiks/BetterDiscordApp.git#commit=4114a6ee266d7ec5c6d980b200e282b9d2c28b7e' LICENSE)
sha512sums=('SKIP'
            'e2bb20271117ebef69eab2d505204dcfb83334e596c5ce02e5f5e1950ba502b9485ebb2005f9df74ac692ba4a99cce869942611b07bba4d588247d53bd21efcc')

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
