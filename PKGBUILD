# Maintained by Kodehawa <david.alejandro.rubio at gmail.com>

# Original discord_arch_electron PKGBUILD:
# Maintained by johnnyapol (arch@johnnyapol.me)

# Original mantainers below:
# Based off the discord community repo PKGBUILD by Filipe Laíns (FFY00) <lains@archlinux.org>
# Maintainer: Anna <morganamilo@gmail.com>
# Maintainer: E5ten <e5ten.arch@gmail.com>
# Maintainer: Parker Reed <parker.l.reed@gmail.com>
# Maintainer: Stephanie Wilde-Hobbs <steph@rx14.co.uk>
# Contributor: Cayde Dixon <me@cazzar.net>
# Contributor: Anthony Anderson <aantony4122@gmail.com>

pkgname=discord-development-electron-bin
_pkgname=discord-development
pkgver=0.0.145
pkgrel=1
pkgdesc="Discord Development (popular voice + video app) using the system provided electron for increased security and performance"
arch=('x86_64')
provides=('discord-development')
conflicts=('discord-development')
url='https://discordapp.com'
license=('custom')
depends=('electron' 'gtk3' 'libnotify' 'libxss' 'glibc' 'alsa-lib' 'nspr' 'nss' 'xdg-utils' 'libcups')
makedepends=('asar')
optdepends=('libpulse: Pulseaudio support'
            'xdg-utils: Open files'
            'noto-fonts-emoji: Google font for emoji support.'
            'ttf-symbola: Font for emoji support.'
            'noto-fonts-cjk: Font for special characters such as /shrug face.')
source=("https://dl-development.discordapp.net/apps/linux/${pkgver}/${_pkgname}-${pkgver}.tar.gz"
        'LICENSE.html::https://discordapp.com/terms'
        'OSS-LICENSES.html::https://discordapp.com/licenses')
# Skip SHA256 of licenses, it fails always for some reason.
b2sums=('037c9e47763565d30548c2e5dadb2d20f3d68eea1287e5ffc803ed299002516dd7a9a8bc5822c772824ae5d3727e778bc62b657d838b3facade69259a193ad7d'
        '6d10467d8ee30d0b9de15a0511e8af5ef15513c1f688c4a1f413bc607bb6cb10a616d6189b7bf7bbef45bd2672f3c4c5fb0dd8db9f4a10e329c12da1573ec74e'
        'd1f54cb3f9f6f4169f5debb5399764271a20ce631c8639cfe2c37ddbf0da7bf26364b509c149ab9df75a86c8ba6fdc400d8cac86ddcc86ab35d6dedab34f30c1')

# The tar extracts to a folder called DiscordCanary.
_tarname=DiscordDevelopment

prepare() {
  # Extract the downloaded tar.
  tar xf ${_pkgname}-${pkgver}.tar.gz
  cd $_tarname

  sed -i "s|Exec=.*|Exec=/usr/bin/$_pkgname|" $_pkgname.desktop
  echo 'Path=/usr/bin' >> $_pkgname.desktop
}

package() {
  # Install the app
  install -d "$pkgdir"/usr/lib/$_pkgname
  
  # HACKS FOR SYSTEM ELECTRON
  # Thanks to the discord_arch_electron guy for this ;)
  # Thanks to https://aur.archlinux.org/packages/discord_arch_electron/#comment-776307 for the less-hacky fix.
  asar e $_tarname/resources/app.asar $_tarname/resources/app
  sed -i "s|process.resourcesPath|'/usr/lib/$_pkgname'|" $_tarname/resources/app/app_bootstrap/buildInfo.js
  sed -i "s|exeDir,|'/usr/share/pixmaps',|" $_tarname/resources/app/app_bootstrap/autoStart/linux.js
  asar p $_tarname/resources/app $_tarname/resources/app.asar --unpack-dir '**'
  rm -rf $_tarname/resources/app 
  
  # Copy relevant data
  cp -r "$_tarname"/resources/*  "$pkgdir"/usr/lib/$_pkgname/
  
  # Create starter script for discord
  echo "#!/bin/sh" >> "$srcdir"/$_pkgname
  echo "exec electron /usr/lib/$_pkgname/app.asar \$@" >> "$srcdir"/$_pkgname
  
  install -d "$pkgdir"/usr/{bin,share/{pixmaps,applications}}
  install -Dm 755 $_pkgname "$pkgdir"/usr/bin/$_pkgname
  
  cp $_tarname/discord.png "$pkgdir"/usr/share/pixmaps/$_pkgname.png
  cp $_tarname/$_pkgname.desktop "$pkgdir"/usr/share/applications/$_pkgname.desktop
  
  # Licenses
  install -Dm 644 LICENSE.html "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.html
  install -Dm 644 OSS-LICENSES.html "$pkgdir"/usr/share/licenses/$pkgname/OSS-LICENSES.html
}
