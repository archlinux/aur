# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Morgan <morganamilo@archlinux.org>
# Contributor: Robin Candau <antiz@archlinux.org>
# Contributor: Christian Heusel <gromit@archlinux.org>
# Contributor: T.J. Townsend <blakkheim@archlinux.org>

pkgname=discord-canary
_pkgname=DiscordCanary
pkgver=1.0.2392
pkgrel=1
pkgdesc="All-in-one voice and text chat for gamers - alpha build"
arch=('x86_64')
url='https://discord.com'
license=('custom')
options=(!debug !strip)
optdepends=('libpulse: PulseAudio support'
            'libappindicator-gtk3: Systray indicator support'
            'xdg-utils: For opening URLs and files')
source=("https://dl-canary.discordapp.net/apps/linux/$pkgver/$pkgname-$pkgver.tar.gz"
        "LICENSE-$pkgver.html::https://discordapp.com/terms"
        "OSS-LICENSES-$pkgver.html::https://discordapp.com/licenses")
sha512sums=('f933f1264ca6f3e566faa72cf7c393e5b36267130b202081d3a7e0893e9245a65441ee258514f9ce7b24225831540ce6a3ec37a166324172839990ee6ca2099e'
            'SKIP'
            'SKIP')

# Skip license hashes as they are unstable (discord#2)
# Since "updpkgsums"/"pkgctl version upgrade" overwrite the checksum array with
# literal hashes, set them to SKIP with indexed assignments (pacman-contrib#119)
# https://gitlab.archlinux.org/archlinux/packaging/packages/discord/-/issues/2
# https://gitlab.archlinux.org/pacman/pacman-contrib/-/issues/119
sha512sums[1]='SKIP'
sha512sums[2]='SKIP'

package() {
  depends=('libnotify' 'libxss' 'nspr' 'nss' 'gtk3')
  install -d "$pkgdir"/opt/$pkgname
  cp -a $_pkgname/. "$pkgdir"/opt/$pkgname

  chmod 755 "$pkgdir"/opt/$pkgname/$pkgname

  rm "$pkgdir"/opt/$pkgname/postinst.sh

  install -d "$pkgdir"/usr/bin
  ln -s /opt/$pkgname/$pkgname "$pkgdir"/usr/bin/$pkgname

  install -d "$pkgdir"/usr/share/applications
  ln -s /opt/$pkgname/$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop

  install -d "$pkgdir"/usr/share/icons/hicolor/256x256/apps
  ln -s /opt/$pkgname/discord.png "$pkgdir"/usr/share/icons/hicolor/256x256/apps/$pkgname.png

  install -Dm644 LICENSE-$pkgver.html "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.html
  install -Dm644 OSS-LICENSES-$pkgver.html "$pkgdir"/usr/share/licenses/$pkgname/OSS-LICENSES.html
}
