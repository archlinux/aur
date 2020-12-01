# Maintainer: WhiredPlanck
# Maintainer: Vyacheslav Konovalov <vyachkonovalov@protonmail.com>

pkgname=slack-electron
pkgver=4.11.1
pkgrel=2
pkgdesc="Slack Desktop (Beta) for Linux, modified to use the system 'electron' package instead of its own"
arch=('x86_64')
url="https://slack.com/downloads"
license=('custom: Slack')
depends=('electron')
optdepends=('libappindicator-gtk3: needed for notification indicator in the status bar on Gnome')
provides=('slack' 'slack-desktop')
conflicts=('slack-desktop')
source=("https://downloads.slack-edge.com/linux_releases/slack-desktop-$pkgver-amd64.deb"
        'slack.sh')
sha256sums=('cf549741b6477cca74be04e56b96a8a9bfb02452ebd641d1c0aa286afb7883e4'
            'ee973ec37027e96e140499cb85dd9587c9dab59bea5a240112c3792bd61a5846')

prepare() {
  bsdtar -xf data.tar.xz

  # Enable slack silent mode and fix icon
  sed -ri 's|^(Exec=.+/slack)(.+)|\1 -s\2|' $srcdir/usr/share/applications/slack.desktop
  sed -ri 's/^Icon=.+slack\.png/Icon=slack/' $srcdir/usr/share/applications/slack.desktop
}

package() {
  install -Dm755 slack.sh "$pkgdir/usr/bin/slack"
  install -Dm644 usr/lib/slack/resources/app.asar -t "$pkgdir/usr/share/slack"
  cp -r usr/lib/slack/resources/app.asar.unpacked "$pkgdir/usr/share/slack"
  install -Dm644 usr/share/applications/slack.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 usr/share/pixmaps/slack.png -t "$pkgdir/usr/share/pixmaps"
  install -Dm644 "$srcdir/usr/lib/slack/LICENSE" "$pkgdir/usr/share/licenses/slack/LICENSE"
}
