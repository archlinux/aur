# Maintainer: WhiredPlanck
# Maintainer: Vyacheslav Konovalov <vyachkonovalov@protonmail.com>

pkgname=slack-electron
pkgver=4.10.3
pkgrel=1
pkgdesc="Slack Desktop (Beta) for Linux, modified to use the system 'electron' package instead of its own"
arch=('x86_64')
url="https://slack.com/downloads"
license=('custom: Slack')
depends=('electron')
provides=('slack' 'slack-desktop')
conflicts=('slack-desktop')
source=("https://downloads.slack-edge.com/linux_releases/slack-desktop-$pkgver-amd64.deb"
        'slack.sh')
sha256sums=('2eb79127ff0e17f2344338b22fbbc44482d07fbd3841f4a4929ca1e9a390d2be'
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
