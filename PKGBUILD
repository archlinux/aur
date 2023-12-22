# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Moon Sungjoon <sumoon at seoulsaram dot org>
# Contributor: Yurii Kolesnykov <root@yurikoles.com>

pkgname=slack-electron
pkgver=4.36.136
pkgrel=1
pkgdesc="Slack Desktop (Beta) for Linux, using the system Electron package"
arch=(x86_64)
url="https://slack.com/downloads/linux"
license=(custom:proprietary)
depends=(
  electron
  gcc-libs
  glibc
  libx11
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
  'e3cddb6c80a0e22eaaadcb38625277f349915df3374e3ef102c632e7ad40a18f'
  '4db11d083626a561129ca40e9cce7cc613c42223f138bb0136c62064c57471fd'
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
