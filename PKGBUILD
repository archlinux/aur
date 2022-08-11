_pkgname=discord-development
pkgname=${_pkgname}-electron-bin
pkgver=0.0.202
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
b2sums=('725ca992aa7c7873372d8aa61a2894b4745568d8ba97f9244aaefdbb34f16ddbcc5ccbe97bc922b68a6e281237fc694184588d47b85668fae8f81430a5c1ff05'
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
