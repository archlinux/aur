# Maintainer: Eris Nihila <v1ru5@frostfire.localdomain>
# Contributer: Tim Schumacher <timschumi@gmx.de>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Morgan <morganamilo@archlinux.org>

pkgname=discord-ptb_impatient_edition
_pkgname=DiscordPTB
pkgver=0.0.48
pkgrel=1
pkgdesc='All-in-one voice and text chat for gamers - public test build (discord-ptb, but I preemptively up the version num so updates are ready at launch, assuming I both remember and still care to do so. No sha512sum verification for obvious reasons.)'
arch=('x86_64')
url='https://discordapp.com'
license=('custom')
options=(!strip)
depends=('libnotify' 'libxss' 'nspr' 'nss' 'gtk3')
conflicts=('discord-ptb')
optdepends=('libpulse: Pulseaudio support'
            'xdg-utils: Open files'
            'noto-fonts-cjk: Font for special characters such as /shrug face'
            'emoji-font: Fonts for emoji support')
source=("https://dl-ptb.discordapp.net/apps/linux/$pkgver/discord-ptb-$pkgver.tar.gz"
        'LICENSE.html::https://discordapp.com/terms'
        'OSS-LICENSES.html::https://discordapp.com/licenses')
sha512sums=('SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd $_pkgname
  sed -i "s|Exec=.*|Exec=/usr/bin/discord-ptb|" discord-ptb.desktop
  sed -i "s|StartupWMClass=.*|StartupWMClass=discord-ptb|" discord-ptb.desktop
  echo 'Path=/usr/bin' >> discord-ptb.desktop
}

package() {
  install -d "$pkgdir"/opt/discord-ptb
  cp -a $_pkgname/. "$pkgdir"/opt/discord-ptb

  chmod 755 "$pkgdir"/opt/discord-ptb/$_pkgname

  rm "$pkgdir"/opt/discord-ptb/postinst.sh

  install -d "$pkgdir"/usr/{bin,share/{pixmaps,applications}}
  ln -s /opt/discord-ptb/$_pkgname "$pkgdir"/usr/bin/discord-ptb
  ln -s /opt/discord-ptb/discord.png "$pkgdir"/usr/share/pixmaps/discord-ptb.png
  ln -s /opt/discord-ptb/discord-ptb.desktop "$pkgdir"/usr/share/applications/discord-ptb.desktop

  # setuid on chrome-sandbox
  chmod u+s "$pkgdir"/opt/discord-ptb/chrome-sandbox

  install -Dm644 LICENSE.html "$pkgdir"/usr/share/licenses/discord-ptb/LICENSE.html
  install -Dm644 OSS-LICENSES.html "$pkgdir"/usr/share/licenses/discord-ptb/OSS-LICENSES.html
}
