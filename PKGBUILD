# Maintainer: Simon Schubert <simon@librem.one>
#
# Minesweeper as an app: the QML tree in /usr/share/moarchy-minesweeper,
# started by /usr/bin/moarchy-minesweeper. That launcher opens it in the running
# Omarchy shell when the plugin is installed there, and as its own Quickshell
# process everywhere else -- so this package needs Quickshell, not Omarchy.
#
# 0.1.0 was a GTK4/libadwaita app in Python. 0.2.0 is the same game in QML,
# reading and writing the same ~/.local/share/moarchy-minesweeper/
# minesweeper.json, and laying the same mines from the same seed.
pkgname=moarchy-minesweeper
pkgver=0.2.0
pkgrel=1
pkgdesc='Minesweeper with portrait boards, a latching flag and a clock that stops, for Quickshell'
arch=('any')
url='https://github.com/SimonSchubert/moarchy-apps'
license=('MIT')
# qt6-declarative (QtQuick) comes with quickshell. The kit's icons are Nerd
# Font glyphs, which namcap cannot see, so it calls that dependency unneeded.
depends=('quickshell' 'ttf-jetbrains-mono-nerd' 'hicolor-icon-theme')
# A release asset that packaging/release.sh builds from apps/minesweeper at the
# tag, with shared/kit in place of the kit link -- not GitHub's generated
# archive, whose compression has moved under pinned checksums before.
source=("$url/releases/download/minesweeper-v$pkgver/$pkgname-$pkgver.tar.gz")
# Pinned in the commit after the tag, as every app's here is.
sha256sums=('c71f35e4ec641c578c2edfc7f4fefe355186c81ab8cb4ebb80600dda5ea964ee')

check() {
  cd "$pkgname-$pkgver"
  # The rules, CPython's random stream, and the file. No display needed.
  QT_QPA_PLATFORM=offscreen /usr/lib/qt6/bin/qmltestrunner -input tests
}

package() {
  cd "$pkgname-$pkgver"

  install -d "$pkgdir/usr/share/$pkgname/kit"
  install -m644 manifest.json ./*.qml ./*.js icon.svg "$pkgdir/usr/share/$pkgname/"
  install -m644 kit/*.qml kit/*.js "$pkgdir/usr/share/$pkgname/kit/"

  install -Dm755 bin/moarchy-minesweeper "$pkgdir/usr/bin/moarchy-minesweeper"
  install -Dm644 org.moarchy.Minesweeper.desktop \
    "$pkgdir/usr/share/applications/org.moarchy.Minesweeper.desktop"
  install -Dm644 icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.moarchy.Minesweeper.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
