# Maintainer: Felix Golatofski <contact@xdfr.de>

pkgname=betterdiscord-git
pkgver=0.3.0i.r20.g4707671
pkgrel=1
pkgdesc='Discord extension that introduces new features like BTTV emotes and plugin support (Git)'
arch=('any')
url='https://betterdiscord.net/home/'
license=('MIT')
depends=('discord')
makedepends=('git' 'asar')
install='BetterDiscord.install'
source=("${pkgname%-git}::git+https://github.com/Jiiks/BetterDiscordApp.git" LICENSE)
sha512sums=('SKIP'
            'e2bb20271117ebef69eab2d505204dcfb83334e596c5ce02e5f5e1950ba502b9485ebb2005f9df74ac692ba4a99cce869942611b07bba4d588247d53bd21efcc')
provides=('betterdiscord')
conflicts=('betterdiscord')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Get rid of git files.
  mkdir -p "package"
  cp -rf "./betterdiscord/" "./package/"
  cd "./package/betterdiscord/"
  rm -rf ".git"
  rm "./.gitignore"

  install -d "${pkgdir}/usr/lib/${pkgname}/"
  cp -a "./." "${pkgdir}/usr/lib/${pkgname}"
  mv "${pkgdir}/usr/lib/${pkgname}/lib/Utils.js" "${pkgdir}/usr/lib/${pkgname}/lib/utils.js"

  # Patch BetterDiscord files.
  sed -i "s/'\/var\/local'/process.env.HOME + '\/.config'/g" "${pkgdir}/usr/lib/${pkgname}/lib/BetterDiscord.js"
  sed -i "s/bdstorage/bdStorage/g" "${pkgdir}/usr/lib/${pkgname}/lib/BetterDiscord.js"
}
