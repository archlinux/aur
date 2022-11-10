# Maintainer: Zoddo <archlinux+aur@zoddo.fr>
# Contributor: Thaodan <AUR+me@thaodan.de>
# Contributor: huyizheng
# Contributor: johnnyapol <arch@johnnyapol.me>
# Based off the discord community repo PKGBUILD by Filipe Laíns (FFY00) <lains@archlinux.org>
_pkgname=discord
_electron=electron19
pkgname=${_pkgname}_arch_electron
pkgver=0.0.21
pkgrel=2
pkgdesc="Discord (popular voice + video app) using the system provided electron for increased security and performance"
arch=('x86_64')
provides=('discord')
conflicts=('discord')
url='https://discord.com'
license=('custom')
options=(!strip)
depends=("${_electron}" 'libxss')
makedepends=('asar')
optdepends=('libpulse: Pulseaudio support'
            'xdg-utils: Open files')
source=("https://dl.discordapp.net/apps/linux/$pkgver/$_pkgname-$pkgver.tar.gz"
        'discord-launcher.sh'
        'LICENSE.html::https://discord.com/terms'
        'OSS-LICENSES.html::https://discord.com/licenses')
sha512sums=('149ae5b8b7d92549e12eca52e45d3f5761ef022ae321cf33fadc3b56c4cee0616a5166380faea038256213713a7aa90e1befc4caa3e6a4de8e15c1cb1d8f925d'
            '93418d8e40cab7ed25f6debc341294f76f90a4f879e158cfea418360c8705347653f60dbd6f18fb754448d299404bfa247b07625ae113e9386188d9f9485a14b'
            SKIP
            SKIP)

prepare() {
  sed -i "s|@ELECTRON@|${_electron}|" discord-launcher.sh
  sed -i "s|Exec=.*|Exec=/usr/bin/$_pkgname|" Discord/discord.desktop
}

package() {
  # Install the app
  install -d "$pkgdir"/usr/lib/$_pkgname

  # HACKS FOR SYSTEM ELECTRON
  asar e Discord/resources/app.asar Discord/resources/app
  rm Discord/resources/app.asar
  sed -i "s|process.resourcesPath|'/usr/lib/$_pkgname'|" Discord/resources/app/app_bootstrap/buildInfo.js
  sed -i "s|exeDir,|'/usr/share/pixmaps',|" Discord/resources/app/app_bootstrap/autoStart/linux.js
  sed -i "s#^module\.paths.*;#module.paths = [(process.env.XDG_CONFIG_HOME || (process.env.HOME + \"/.config\")) + \"/discord/$pkgver/modules\"];#" Discord/resources/app/app_bootstrap/requireNative.js
  asar p Discord/resources/app Discord/resources/app.asar --unpack-dir '**'
  rm -rf Discord/resources/app

  # Copy Relevanat data
  cp -r Discord/resources/*  "$pkgdir"/usr/lib/$_pkgname/

  install -d "$pkgdir"/usr/{bin,share/{pixmaps,applications}}
  install -Dm 755 "${srcdir}/discord-launcher.sh" "${pkgdir}/usr/bin/${_pkgname}"

  cp Discord/discord.png "$pkgdir"/usr/share/pixmaps/$_pkgname.png
  cp Discord/discord.desktop "$pkgdir"/usr/share/applications/$_pkgname.desktop

  # Licenses
  install -Dm 644 LICENSE.html "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.html
  install -Dm 644 OSS-LICENSES.html "$pkgdir"/usr/share/licenses/$pkgname/OSS-LICENSES.html
}
