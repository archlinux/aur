# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Moon Sungjoon <sumoon at seoulsaram dot org>
# Contributor: Yurii Kolesnykov <root@yurikoles.com>

pkgname=slack-electron
pkgver=4.46.96
pkgrel=1
pkgdesc="Slack Desktop (Beta) for Linux, using the system Electron package"
arch=(x86_64)
url="https://slack.com/downloads/linux"
license=(LicenseRef-SlackProprietary)
_electronver=38
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
  '3c3528131efe6561b7f93fddfb3127dfdb0f17dc1807435bce584ac3a95797d8'
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

  install -vdm755 "$pkgdir/usr/lib/slack/resources/"
  cp -va -t "$pkgdir/usr/lib/slack/resources/" usr/lib/slack/resources/*

  install -vdm755 "$pkgdir/usr/lib/slack/locales/"
  cp -va -t "$pkgdir/usr/lib/slack/locales/" usr/lib/slack/locales/*

  install -vDm644 -t "$pkgdir/usr/lib/slack" \
    usr/lib/slack/LICENSE \
    usr/lib/slack/LICENSES-linux.json \
    usr/lib/slack/resources.pak \
    usr/lib/slack/version

  install -vDm755 "$srcdir/slack.sh" "$pkgdir/usr/bin/slack"

  install -vDm644 -t "$pkgdir/usr/share/applications" usr/share/applications/slack.desktop
  install -vDm644 -t "$pkgdir/usr/share/pixmaps" usr/share/pixmaps/slack.png
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" usr/lib/slack/LICENSE
}
