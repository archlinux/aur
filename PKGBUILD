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

pkgname=discord-canary-electron-bin
_pkgname=discord-canary
pkgver=0.0.114
pkgrel=4
pkgdesc="Discord Canary (popular voice + video app) using the system provided electron for increased security and performance"
arch=('x86_64')
provides=('discord-canary')
conflicts=('discord-canary')
url='https://canary.discordapp.com'
license=('custom')
depends=('electron' 'gtk3' 'libnotify' 'libxss' 'glibc' 'alsa-lib' 'nspr' 'nss' 'xdg-utils' 'libcups')
optdepends=('libpulse: Pulseaudio support'
            'xdg-utils: Open files'
            'noto-fonts-emoji: Google font for emoji support.'
            'ttf-symbola: Font for emoji support.'
            'noto-fonts-cjk: Font for special characters such as /shrug face.')
source=("https://dl-canary.discordapp.net/apps/linux/${pkgver}/${_pkgname}-${pkgver}.tar.gz"
        'LICENSE.html::https://discordapp.com/terms'
        'OSS-LICENSES.html::https://discordapp.com/licenses')
# Skip SHA256 of licenses, it fails always for some reason.
sha256sums=('8130c6240f4b027eabf7fa0e8cf10485cb9db5c45a1832c0bf5947499c247c48'
            'SKIP'
            'SKIP')

# The tar extracts to a folder called DiscordCanary.
_tarname=DiscordCanary

prepare() {
  # Extract the downloaded tar.
  tar xf ${_pkgname}-${pkgver}.tar.gz
  cd $_tarname

  sed -i "s|Exec=.*|Exec=/usr/bin/$_pkgname|" $_pkgname.desktop
  echo 'Path=/usr/bin' >> $_pkgname.desktop
}

package() {
  # Install the app
  install -d "$pkgdir"/opt/$_pkgname

  # Copy relevant data
  cp -r "$_tarname"/resources  "$pkgdir"/opt/$_pkgname/
  cp    "$_tarname"/discord.png "$pkgdir"/opt/$_pkgname/
  cp 	"$_tarname"/$_pkgname.desktop "$pkgdir"/opt/$_pkgname/

  # Create starter script for discord
  echo "#!/bin/sh" >> "$pkgdir"/opt/$_pkgname/$_pkgname
  echo "electron /opt/$_pkgname/resources/app.asar \$@" >> "$pkgdir"/opt/$_pkgname/$_pkgname

  # Set permissions
  chmod 755 "$pkgdir"/opt/$_pkgname/$_pkgname

  # Install.
  install -d "$pkgdir"/usr/{bin,share/{pixmaps,applications}}
  install -d "$pkgdir"/usr/lib/electron
  install -d "$pkgdir"/usr/lib/electron/resources

  # Create a symbolic link to the binary itself (discord-canary)
  ln -s /opt/$_pkgname/$_pkgname "$pkgdir"/usr/bin/$_pkgname
  # Create a symbolic link to the icon.
  ln -sf /opt/$_pkgname/discord.png "$pkgdir"/usr/share/pixmaps/$_pkgname.png
  # Create a symbolic link to the .desktop file.
  ln -sf /opt/$_pkgname/$_pkgname.desktop "$pkgdir"/usr/share/applications/$_pkgname.desktop

  # HACKS FOR SYSTEM ELECTRON
  # Without this it'd fail to launch saying it's missing build_info.json.
  # Then fail saying it's missing discord.png
  # So just copy them to the root of the electron folder, so Discord can see them.
  # This is a little hacky, but lol. I dunno what Discord has against using the system electron
  # When their own electron is quite broken, to be fair. At least under linux.
  # No offense to them, though. I still enjoy the app, propietary and all.
  # Thanks to the discord_arch_electron guy for this ;)
  ln -s /opt/$_pkgname/resources/build_info.json "$pkgdir"/usr/lib/electron/resources/
  ln -s /opt/$_pkgname/discord.png        "$pkgdir"/usr/lib/electron

  # Licenses
  install -Dm 644 LICENSE.html "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.html
  install -Dm 644 OSS-LICENSES.html "$pkgdir"/usr/share/licenses/$pkgname/OSS-LICENSES.html
}
