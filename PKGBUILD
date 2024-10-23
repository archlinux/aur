# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Moon Sungjoon <sumoon at seoulsaram dot org>
# Contributor: Yurii Kolesnykov <root@yurikoles.com>

pkgname=slack-electron
pkgver=4.41.96
pkgrel=1
pkgdesc="Slack Desktop (Beta) for Linux, using the system Electron package"
arch=(x86_64)
url="https://slack.com/downloads/linux"
license=(LicenseRef-SlackProprietary)
_electron_version=31
depends=(
  "electron$_electron_version"
  gcc-libs
  glibc
  libx11
  libxkbfile
)
optdepends=('libappindicator-gtk3: for notification indicator in the status bar on GNOME')
provides=(slack-desktop)
conflicts=(slack-desktop)
source=(
  "$pkgname-$pkgver.deb::https://downloads.slack-edge.com/desktop-releases/linux/x64/$pkgver/slack-desktop-$pkgver-amd64.deb"
  "slack.sh"
)
noextract=("$pkgname-$pkgver.deb")
sha256sums=(
  '85b5915d6230ad4f5686b857390bf086205a81ff9f7cc18415cec07156c738fe'
  '1b2229fa419ede9858fb0af5351add8f65ddc573abb043d44b4ef979a8bbd996'
)

_archive="$pkgname-$pkgver"

prepare() {
  sed -i "s/@ELECTRON_VERSION@/$_electron_version/" slack.sh

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
  cp -a -t "$pkgdir/usr/lib/slack/resources/" usr/lib/slack/resources/*

  install -dm755 "$pkgdir/usr/lib/slack/locales/"
  cp -a -t "$pkgdir/usr/lib/slack/locales/" usr/lib/slack/locales/*

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
