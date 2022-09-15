# Maintainer: Zoddo <archlinux+aur@zoddo.fr>
# Contributor: huyizheng
# Contributor: johnnyapol <arch@johnnyapol.me>
# Based off the discord community repo PKGBUILD by Filipe Laíns (FFY00) <lains@archlinux.org>
pkgname=discord_arch_electron
_pkgname=discord
pkgver=0.0.20
pkgrel=1
pkgdesc="Discord (popular voice + video app) using the system provided electron for increased security and performance"
arch=('x86_64')
provides=('discord')
conflicts=('discord')
url='https://discord.com'
license=('custom')
depends=('electron19')
makedepends=('asar')
optdepends=('libpulse: Pulseaudio support'
            'xdg-utils: Open files')
source=("https://dl.discordapp.net/apps/linux/$pkgver/$_pkgname-$pkgver.tar.gz"
        'discord-launcher.sh'
        'LICENSE.html::https://discordapp.com/terms'
        'OSS-LICENSES.html::https://discordapp.com/licenses')
sha512sums=('720bc8a8b61cbbe3566c34065f9831571da121d210e3f2876c34cb964d60bab33f8dc16f7ca758e918cd8f35a69699c0b9063782e6c95087c0baa41a6d0e7cf5'
            '93418d8e40cab7ed25f6debc341294f76f90a4f879e158cfea418360c8705347653f60dbd6f18fb754448d299404bfa247b07625ae113e9386188d9f9485a14b'
            SKIP
            SKIP)

prepare() {
  sed -i "s|@ELECTRON@|electron19|" discord-launcher.sh
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
