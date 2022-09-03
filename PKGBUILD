# Maintainer: Johannes Jöns <johannes@joens.email>
# Contributor: fisch02 <kevin.majewski02 at gmail.com>
# Contributor: Nairaner <krzysztofmachura1 at gmail.com

# Original discord-canary-electron-bin PKGBUILD:
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

_pkgname=discord-development
pkgname=${_pkgname}-electron-bin
pkgver=0.0.203
pkgrel=1
pkgdesc="Discord Development (popular voice + video app) using the system provided electron for increased security and performance"
arch=('x86_64')
provides=(${_pkgname})
conflicts=(${_pkgname})
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
# Skip BLAKE2 of licenses, it fails always for some reason.
b2sums=('4b542acae1ba9e2dc9e6949f44e64a974005a71c3b8319fafee8b4c26af08d47a0484def90faec0f3118bd317aa5c0266a4162825b649f9ac5140e5e0e0a5f33'
        'SKIP'
        'SKIP')

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
  # Thanks to https://aur.archlinux.org/packages/discord_arch_electron#comment-872073 for the electron fix.

  asar e $_tarname/resources/app.asar $_tarname/resources/app
  sed -i "s|process.resourcesPath|'/usr/lib/$_pkgname'|" $_tarname/resources/app/app_bootstrap/buildInfo.js
  sed -i "s|exeDir,|'/usr/share/pixmaps',|" $_tarname/resources/app/app_bootstrap/autoStart/linux.js
  sed -i "s|module.paths = \[\]|module.paths = \[process.env.HOME + '/.config/discorddevelopment/$pkgver/modules'\]|" $_tarname/resources/app/app_bootstrap/requireNative.js
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
