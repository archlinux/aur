# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Morgan <morganamilo@archlinux.org>
# Contributor: Robin Candau <antiz@archlinux.org>
# Contributor: Christian Heusel <gromit@archlinux.org>
# Contributor: T.J. Townsend <blakkheim@archlinux.org>

pkgname=discord-canary
_pkgname=DiscordCanary
pkgver=1.0.1159
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
sha512sums=('36e9f7fb18031af764fde309c783719e24a7676ebdd0fc797ff47d747f7db7345c9d28b2c23c75e0890a9ca421b3390e58c0df3c97e7613b39760d849e079929'
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
