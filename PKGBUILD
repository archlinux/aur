# Contributor: Morgan <morganamilo@archlinux.org>

pkgname=discord-canary
_pkgname=DiscordCanary
pkgver=0.0.172
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
sha512sums=('9ed09439e485523c83c56e836f456f597c0144cce78f43816f6b28dd64baa53ab15b3f17b405bdb93e910ccb49af4d2c42b70ef76fedb328b63c8f197a9ef917'
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
