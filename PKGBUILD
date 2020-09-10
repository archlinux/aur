# Maintained by johnnyapol (arch@johnnyapol.me)
# Based off the discord community repo PKGBUILD by Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=discord_arch_electron
_pkgname=discord
pkgver=0.0.12
pkgrel=1
pkgdesc="Discord (popular voice + video app) using the system provided electron for increased security and performance"
arch=('x86_64')
provides=('discord')
conflicts=('discord')
url='https://discordapp.com'
license=('custom')
depends=('electron')
optdepends=('libpulse: Pulseaudio support'
            'xdg-utils: Open files')
source=("https://dl.discordapp.net/apps/linux/$pkgver/$_pkgname-$pkgver.tar.gz"
        'LICENSE.html::https://discordapp.com/terms'
        'OSS-LICENSES.html::https://discordapp.com/licenses')
sha512sums=('cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e'
             SKIP
             SKIP)

prepare() {
  cd Discord

  sed -i "s|Exec=.*|Exec=/usr/bin/$_pkgname|" $_pkgname.desktop
  echo 'Path=/usr/bin' >> $_pkgname.desktop
}

package() {
  # Install the app
  install -d "$pkgdir"/opt/$_pkgname

  # Copy Relevanat data
  cp -r Discord/resources  "$pkgdir"/opt/$_pkgname/
  cp    Discord/discord.png "$pkgdir"/opt/$_pkgname/
  cp 	Discord/discord.desktop "$pkgdir"/opt/$_pkgname/

  # Create starter script for discord
  echo "#!/bin/sh" >> "$pkgdir"/opt/$_pkgname/$_pkgname
  echo "electron /opt/$_pkgname/resources/app.asar \$@" >> "$pkgdir"/opt/$_pkgname/$_pkgname

  # Set Permissions, symlinks
  chmod 755 "$pkgdir"/opt/$_pkgname/$_pkgname

  install -d "$pkgdir"/usr/{bin,share/{pixmaps,applications}}
  install -d "$pkgdir"/usr/lib/electron
  install -d "$pkgdir"/usr/lib/electron/resources

  ln -s /opt/$_pkgname/$_pkgname "$pkgdir"/usr/bin/$_pkgname
  ln -sf /opt/$_pkgname/discord.png "$pkgdir"/usr/share/pixmaps/$_pkgname.png
  ln -sf /opt/$_pkgname/$_pkgname.desktop "$pkgdir"/usr/share/applications/$_pkgname.desktop

  # HACKS FOR SYSTEM ELECTRON
  ln -s /opt/$_pkgname/resources/build_info.json "$pkgdir"/usr/lib/electron/resources/
  ln -s /opt/$_pkgname/discord.png        "$pkgdir"/usr/lib/electron

  # Licenses
  install -Dm 644 LICENSE.html "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.html
  install -Dm 644 OSS-LICENSES.html "$pkgdir"/usr/share/licenses/$pkgname/OSS-LICENSES.html
}
