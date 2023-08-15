# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Moon Sungjoon <sumoon at seoulsaram dot org>
# Contributor: Yurii Kolesnykov <root@yurikoles.com>

pkgname=slack-electron
pkgver=4.33.90
pkgrel=1
pkgdesc="Slack Desktop (Beta) for Linux, using the system Electron package"
arch=(x86_64)
url="https://slack.com/downloads/linux"
license=(custom:proprietary)
depends=(
  electron24
  gcc-libs
  glibc
  libxkbfile
)
optdepends=('libappindicator-gtk3: for notification indicator in the status bar on GNOME')
provides=(slack-desktop)
conflicts=(slack-desktop)

source=(
  "$pkgname-$pkgver.deb::https://downloads.slack-edge.com/releases/linux/$pkgver/prod/x64/slack-desktop-$pkgver-amd64.deb"
  'slack.sh'
)
sha256sums=(
  '54a73d1f85d65c900b2973e7d737a00149d3dad37d9960f9dadff097a2e854dc'
  '8b16b282a7304a86072ee84e95e0f685c7cc7f1689282de2b9c9475cb7be0a5a'
)

prepare() {
  bsdtar -xf data.tar.xz

  # Enable slack silent mode and fix icon
  sed -ri \
  -e 's|^(Exec=.+/slack)(.+)|\1 -s\2|' \
  -e 's/^Icon=.+slack\.png/Icon=slack/' \
  "usr/share/applications/slack.desktop"
}

package() {
  install -Dv "slack.sh" "$pkgdir/usr/bin/slack"
  install -dv "$pkgdir/usr/lib/slack/"
  cp -av --no-preserve=ownership usr/lib/slack/resources/* "$pkgdir/usr/lib/slack/"
  install -Dvm644 "usr/share/applications/slack.desktop" -t "$pkgdir/usr/share/applications"
  install -Dvm644 "usr/share/pixmaps/slack.png" -t "$pkgdir/usr/share/pixmaps"
  install -Dvm644 "usr/lib/slack/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
