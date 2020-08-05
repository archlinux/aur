# Maintainer: Tim Schumacher <timschumi@gmx.de>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=discord-ptb
_pkgname=DiscordPTB
pkgver=0.0.21
pkgrel=1
pkgdesc="All-in-one voice and text chat for gamers that's free and secure. - Public Test Build"
arch=('x86_64')
url='https://discordapp.com'
license=('custom')
depends=('libnotify' 'libxss' 'nspr' 'nss' 'gtk3'
         'opera-ffmpeg-codecs' 'libegl' 'libgles') # Replacements
optdepends=('libpulse: Pulseaudio support'
            'xdg-utils: Open files'
            'noto-fonts-cjk: Font for special characters such as /shrug face'
            'emoji-font: Fonts for emoji support')
source=("https://dl-ptb.discordapp.net/apps/linux/$pkgver/$pkgname-$pkgver.tar.gz"
        'LICENSE.html::https://discordapp.com/terms'
        'OSS-LICENSES.html::https://discordapp.com/licenses')
sha512sums=('7a2aeeac825ef8af32d1a572ee12391e6eb18a392a887347efb25626a6a8ed8ac0873560e1bd64ce209160e4d2f8449fa89506d68fb333eb84f70259b644c854'
            'SKIP'
            'SKIP')

prepare() {
  cd $_pkgname

  sed -i "s|Exec=.*|Exec=/usr/bin/$pkgname|" $pkgname.desktop
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

  # Replacement symlinks
  ln -sf /usr/lib/opera/lib_extra/libffmpeg.so "$pkgdir"/opt/$pkgname/libffmpeg.so
  ln -sf /usr/lib/libEGL.so "$pkgdir"/opt/$pkgname/libEGL.so
  ln -sf /usr/lib/libGLESv2.so "$pkgdir"/opt/$pkgname/libGLESv2.so
  ln -sf /usr/lib/libEGL.so "$pkgdir"/opt/$pkgname/swiftshader/libEGL.so
  ln -sf /usr/lib/libGLESv2.so "$pkgdir"/opt/$pkgname/swiftshader/libGLESv2.so

  # Licenses
  install -Dm 644 LICENSE.html "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.html
  install -Dm 644 OSS-LICENSES.html "$pkgdir"/usr/share/licenses/$pkgname/OSS-LICENSES.html
}

