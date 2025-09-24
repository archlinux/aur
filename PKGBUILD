# Contributor: Morgan <morganamilo@archlinux.org>

pkgname=discord-canary
_pkgname=DiscordCanary
pkgver=0.0.760
pkgrel=1
pkgdesc="All-in-one voice and text chat for gamers - alpha build"
arch=('x86_64')
url='https://discordapp.com'
license=('custom')
options=(!strip)
depends=('libnotify' 'libxss' 'nspr' 'nss' 'gtk3')
optdepends=('libpulse: Pulseaudio support'
            'xdg-utils: Open files')
source=("https://dl-canary.discordapp.net/apps/linux/$pkgver/$pkgname-$pkgver.tar.gz"
        'LICENSE.html::https://discordapp.com/terms'
        'OSS-LICENSES.html::https://discordapp.com/licenses')
sha512sums=('aeab04211dc1d84d994fbe2d55ba524af3968e9a078672ad95e38b73c5d5ea190ae27d9f64a4b779498836b55f6dded53591f8a196cf8c68199767dcf57d5566'
            'SKIP'
            'SKIP')

prepare() {
  cd $_pkgname
  sed -i "s|Exec=.*|Exec=/usr/bin/$pkgname|" $pkgname.desktop
  echo 'Path=/usr/bin' >> $pkgname.desktop
}

package() {
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

  install -Dm644 LICENSE.html "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.html
  install -Dm644 OSS-LICENSES.html "$pkgdir"/usr/share/licenses/$pkgname/OSS-LICENSES.html
}
