# Maintainer: Simon Schubert <simon@librem.one>
#
# Launches as an app: the QML tree in /usr/share/moarchy-launches, started by
# /usr/bin/moarchy-launches. That launcher opens it in the running Omarchy
# shell when the plugin is installed there, and as its own Quickshell process
# everywhere else -- so this package needs Quickshell, not Omarchy.
#
# 0.1.0 was a GTK4/libadwaita app in Python. 0.2.0 is the same launch tracker
# in QML, over the same ~/.local/share/moarchy-launches/favourites.json and
# upcoming.json, so a launch starred in one is starred in the other.
pkgname=moarchy-launches
pkgver=0.2.0
pkgrel=1
pkgdesc='The next twenty rocket launches, and the ones you star, for Quickshell'
arch=('any')
url='https://github.com/SimonSchubert/moarchy-apps'
license=('MIT')
# qt6-declarative (QtQuick) comes with quickshell. curl is the one request
# this app makes, to Launch Library 2. The kit's icons are Nerd Font glyphs,
# which namcap cannot see, so it calls that dependency unneeded.
depends=('quickshell' 'curl' 'ttf-jetbrains-mono-nerd' 'hicolor-icon-theme')
# A release asset that packaging/release.sh builds from apps/launches at the
# tag, with shared/kit in place of the kit link -- not GitHub's generated
# archive, whose compression has moved under pinned checksums before.
source=("$url/releases/download/launches-v$pkgver/$pkgname-$pkgver.tar.gz")
# Pinned in the commit after the tag, as every app's here is.
sha256sums=('33e4a98edd73aba6e6ddedfefd01420852976054b56818f2b8bfad681f89d674')

check() {
  cd "$pkgname-$pkgver"
  # Launch Library's JSON, our two files, and every figure on screen, against
  # a fixture. No display and no network needed.
  QT_QPA_PLATFORM=offscreen /usr/lib/qt6/bin/qmltestrunner -input tests
}

package() {
  cd "$pkgname-$pkgver"

  install -d "$pkgdir/usr/share/$pkgname/kit"
  install -m644 manifest.json ./*.qml ./*.js icon.svg "$pkgdir/usr/share/$pkgname/"
  install -m644 kit/*.qml kit/*.js "$pkgdir/usr/share/$pkgname/kit/"

  install -Dm755 bin/moarchy-launches "$pkgdir/usr/bin/moarchy-launches"
  install -Dm644 org.moarchy.Launches.desktop \
    "$pkgdir/usr/share/applications/org.moarchy.Launches.desktop"
  install -Dm644 icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.moarchy.Launches.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
