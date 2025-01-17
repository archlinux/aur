# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Moon Sungjoon <sumoon at seoulsaram dot org>
# Contributor: Yurii Kolesnykov <root@yurikoles.com>

pkgname=slack-electron
pkgver=4.41.105
pkgrel=2
pkgdesc="Slack Desktop (Beta) for Linux, using the system Electron package"
arch=(x86_64)
url="https://slack.com/downloads/linux"
license=(LicenseRef-SlackProprietary)
_electronver=33
depends=(
  "electron$_electronver"
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
  '47696e49067a427e2db9b25157519abe1f61711c61050756d3c6b1232687803d'
  '1b2229fa419ede9858fb0af5351add8f65ddc573abb043d44b4ef979a8bbd996'
)

_archive="$pkgname-$pkgver"

prepare() {
  sed -i "s/@ELECTRON_VERSION@/$_electronver/" slack.sh

  mkdir -p "$_archive"
  bsdtar -xf "$pkgname-$pkgver.deb" -C "$_archive"
  bsdtar -xf "$_archive/data.tar.xz" -C "$_archive"

  cd "$_archive"

  grep -q "^$_electronver" usr/lib/slack/version \
    || (
      echo "Electron version mismatch"
      exit 1
    )

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
