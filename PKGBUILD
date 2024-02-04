# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Moon Sungjoon <sumoon at seoulsaram dot org>
# Contributor: Yurii Kolesnykov <root@yurikoles.com>

pkgname=slack-electron
pkgver=4.36.140
pkgrel=1
pkgdesc="Slack Desktop (Beta) for Linux, using the system Electron package"
arch=(x86_64)
url="https://slack.com/downloads/linux"
license=(LicenseRef-SlackProprietary)
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
  "slack.sh"
)
noextract=("$pkgname-$pkgver.deb")
sha256sums=(
  'b90f363faf735987231b653756d7bffa0e5e328e6254551d6cbd85c52e84507d'
  '7d3b40e668f27cc94eeb3789f4e6d30601946c3b475ab718d01a7008919357b8'
)

_archive="$pkgname-$pkgver"

prepare() {
  mkdir -p "$_archive"
  bsdtar -xf "$pkgname-$pkgver.deb" -C "$_archive"
  bsdtar -xf "$_archive/data.tar.xz" -C "$_archive"

  cd "$_archive"

  # Enable slack silent mode and fix icon
  sed -ri \
    -e 's|^(Exec=.+/slack)(.+)|\1 -s\2|' \
    -e 's/^Icon=.+slack\.png/Icon=slack/' \
    usr/share/applications/slack.desktop

  # Slack is hard-coded to disable screen sharing on Wayland - remove this
  # limitation.
  sed -i 's|,"WebRTCPipeWireCapturer"|,"xxxxxxxxxxxxxxxxxxxxxx"|' \
    usr/lib/slack/resources/app.asar
}

package() {
  cd "$_archive"

  install -dm755 "$pkgdir/usr/lib/slack/resources/"
  cp --archive -t "$pkgdir/usr/lib/slack/resources/" \
    usr/lib/slack/resources/*

  install -dm755 "$pkgdir/usr/lib/slack/locales/"
  cp --archive -t "$pkgdir/usr/lib/slack/locales/" \
    usr/lib/slack/locales/*

  install -Dm644 -t "$pkgdir/usr/lib/slack" \
    usr/lib/slack/LICENSE \
    usr/lib/slack/LICENSES-linux.json \
    usr/lib/slack/resources.pak \
    usr/lib/slack/version

  install -Dm755 "$srcdir/slack.sh" "$pkgdir/usr/bin/slack"

  install -Dm644 -t "$pkgdir/usr/share/applications" usr/share/applications/slack.desktop
  install -Dm644 -t "$pkgdir/usr/share/pixmaps" usr/share/pixmaps/slack.png
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" usr/lib/slack/LICENSE
}
