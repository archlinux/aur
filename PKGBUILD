# Maintainer: Tim Schumacher <timschumi@gmx.de>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=discord-ptb
_pkgname=DiscordPTB
pkgver=0.0.33
pkgrel=1
pkgdesc="All-in-one voice and text chat for gamers that's free and secure. - Public Test Build"
arch=('x86_64')
url='https://discordapp.com'
license=('custom')
depends=('libnotify' 'libxss' 'nspr' 'nss' 'gtk3')
optdepends=('libpulse: Pulseaudio support'
            'xdg-utils: Open files'
            'noto-fonts-cjk: Font for special characters such as /shrug face'
            'emoji-font: Fonts for emoji support')
source=("https://dl-ptb.discordapp.net/apps/linux/$pkgver/$pkgname-$pkgver.tar.gz"
        'LICENSE.html::https://discordapp.com/terms'
        'OSS-LICENSES.html::https://discordapp.com/licenses')
sha512sums=('2e4fb7625e09ef97836602efffb43e61505eca6ab5eff9d5084b5df15e1fa8580a59debec5e654fb34160a2f5ae9b73793d6b40e98c2c6326cc6e841fedf0065'
            'SKIP'
            'SKIP')

prepare() {
  cd $_pkgname

  sed -i "s|Exec=.*|Exec=/usr/bin/$pkgname|" $pkgname.desktop
  sed -i "s|StartupWMClass=.*|StartupWMClass=$pkgname|" $pkgname.desktop
  echo 'Path=/usr/bin' >> $pkgname.desktop
}

package() {
  # Install the app
  install -d "$pkgdir"/opt/$pkgname
  cp -a $_pkgname/. "$pkgdir"/opt/$pkgname

  chmod 755 "$pkgdir"/opt/$pkgname/$_pkgname

  rm "$pkgdir"/opt/$pkgname/postinst.sh

  install -d "$pkgdir"/usr/{bin,share/{pixmaps,applications}}
  ln -s /opt/$pkgname/$_pkgname "$pkgdir"/usr/bin/$pkgname
  ln -s /opt/$pkgname/discord.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
  ln -s /opt/$pkgname/$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop

  # setuid on chrome-sandbox
  chmod u+s "$pkgdir"/opt/$pkgname/chrome-sandbox

  # Licenses
  install -Dm 644 LICENSE.html "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.html
  install -Dm 644 OSS-LICENSES.html "$pkgdir"/usr/share/licenses/$pkgname/OSS-LICENSES.html
}

