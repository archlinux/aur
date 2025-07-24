# Maintainer: MrPowerGamerBR <howdy@mrpowergamerbr.com>

# Based on the original "discord" PKGBUILD:
# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Maintainer: Morgan <morganamilo@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Maintainer: Christian Heusel <gromit@archlinux.org>
# Contributor: T.J. Townsend <blakkheim@archlinux.org>

pkgname="discord-canary-with-stable-dot-desktop"
_discordbuild=discord-canary
__discordbuildfancyname=DiscordCanary
pkgver=0.0.727
pkgrel=1
pkgdesc="All-in-one voice and text chat for gamers - Canary build with Discord stable \"discord.desktop\" file name, to fix notifications and unread message badges"
arch=('x86_64')
url='https://discord.com'
license=('custom')
options=(!debug !strip)
optdepends=('libpulse: PulseAudio support'
            'libappindicator-gtk3: Systray indicator support'
            'xdg-utils: For opening URLs and files'
            'libunity: For unread message badges')
source=("https://dl-canary.discordapp.net/apps/linux/$pkgver/$_discordbuild-$pkgver.tar.gz"
        "LICENSE-$pkgver.html::https://discordapp.com/terms"
        "OSS-LICENSES-$pkgver.html::https://discordapp.com/licenses")
sha512sums=('SKIP'
            'SKIP'
            'SKIP')
conflicts=("discord") # because it overrides the default discord.desktop file

prepare() {
  cd $__discordbuildfancyname
  sed -i "s|Exec=.*|Exec=/usr/bin/$_discordbuild|" $_discordbuild.desktop
}

package() {
  depends=('libnotify' 'libxss' 'nspr' 'nss' 'gtk3')
  install -d "$pkgdir"/opt/$_discordbuild
  cp -a $__discordbuildfancyname/. "$pkgdir"/opt/$_discordbuild

  chmod 755 "$pkgdir"/opt/$_discordbuild/$__discordbuildfancyname

  rm "$pkgdir"/opt/$_discordbuild/postinst.sh

  install -d "$pkgdir"/usr/bin
  ln -s /opt/$_discordbuild/$__discordbuildfancyname "$pkgdir"/usr/bin/$_discordbuild

  install -d "$pkgdir"/usr/share/applications
  # use "discord.desktop" instead of "discord-canary.desktop" to avoid issues with unread notification badges
  # and libunity not working with canary
  ln -s /opt/$_discordbuild/$_discordbuild.desktop "$pkgdir"/usr/share/applications/discord.desktop

  install -d "$pkgdir"/usr/share/icons/hicolor/256x256/apps
  ln -s /opt/$_discordbuild/discord.png "$pkgdir"/usr/share/icons/hicolor/256x256/apps/$_discordbuild.png

  # setuid on chrome-sandbox
  chmod u+s "$pkgdir"/opt/$_discordbuild/chrome-sandbox

  install -Dm644 LICENSE-$pkgver.html "$pkgdir"/usr/share/licenses/$_discordbuild/LICENSE.html
  install -Dm644 OSS-LICENSES-$pkgver.html "$pkgdir"/usr/share/licenses/$_discordbuild/OSS-LICENSES.html
}