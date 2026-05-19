# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Morgan <morganamilo@archlinux.org>
# Contributor: Robin Candau <antiz@archlinux.org>
# Contributor: Christian Heusel <gromit@archlinux.org>
# Contributor: T.J. Townsend <blakkheim@archlinux.org>

pkgname=discord-canary
_pkgname=DiscordCanary
pkgver=1.0.1100
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
sha512sums=('eae946032d63cf42ccda7b1fcec558cd0eba7dacffe6b4264396d53e8cbdda695c2193393d5978f21a510b86856d2a27e21a8c655753267c49f63816fcbc8648'
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
