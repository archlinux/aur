# Maintainer: Simon Schubert <simon@librem.one>
#
# Breakout as an app: the QML tree in /usr/share/moarchy-breakout, started by
# /usr/bin/moarchy-breakout. That launcher opens it in the running Omarchy
# shell when the plugin is installed there, and as its own Quickshell process
# everywhere else -- so this package needs Quickshell, not Omarchy.
#
# 0.1.0 was a GTK4/libadwaita app in Python. 0.2.0 is the same game in QML,
# reading and writing the same ~/.local/share/moarchy-breakout/breakout.json,
# so a wall left half-broken in one is the wall found in the other.
pkgname=moarchy-breakout
pkgver=0.2.0
pkgrel=1
pkgdesc='Breakout with a bat that follows your thumb, for Quickshell'
arch=('any')
url='https://github.com/SimonSchubert/moarchy-apps'
license=('MIT')
# qt6-declarative (QtQuick) comes with quickshell. The kit's icons are Nerd
# Font glyphs, which namcap cannot see, so it calls that dependency unneeded.
depends=('quickshell' 'ttf-jetbrains-mono-nerd' 'hicolor-icon-theme')
# A release asset that packaging/release.sh builds from apps/breakout at the
# tag, with shared/kit in place of the kit link -- not GitHub's generated
# archive, whose compression has moved under pinned checksums before.
source=("$url/releases/download/breakout-v$pkgver/$pkgname-$pkgver.tar.gz")
# Pinned in the commit after the tag, as every app's here is.
sha256sums=('40aaf5cb35bf715827fef481a07b5cd27c4b01aa383a9613eefa9276a6aef67d')

check() {
  cd "$pkgname-$pkgver"
  # The physics, the walls and the file. No display needed.
  QT_QPA_PLATFORM=offscreen /usr/lib/qt6/bin/qmltestrunner -input tests
}

package() {
  cd "$pkgname-$pkgver"

  install -d "$pkgdir/usr/share/$pkgname/kit"
  install -m644 manifest.json ./*.qml ./*.js icon.svg "$pkgdir/usr/share/$pkgname/"
  install -m644 kit/*.qml kit/*.js "$pkgdir/usr/share/$pkgname/kit/"

  install -Dm755 bin/moarchy-breakout "$pkgdir/usr/bin/moarchy-breakout"
  install -Dm644 org.moarchy.Breakout.desktop \
    "$pkgdir/usr/share/applications/org.moarchy.Breakout.desktop"
  install -Dm644 icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.moarchy.Breakout.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
