# Maintainer: Simon Schubert <simon@librem.one>
#
# Chess as an app: the QML tree in /usr/share/moarchy-chess, started by
# /usr/bin/moarchy-chess. That launcher opens it in the running Omarchy shell
# when the plugin is installed there, and as its own Quickshell process
# everywhere else -- so this package needs Quickshell, not Omarchy.
#
# 0.1.0 was a GTK4/libadwaita app in Python. 0.2.0 is the same game in QML,
# reading and writing the same ~/.local/share/moarchy-chess/chess.json, so a
# game left in one is the game found in the other.
pkgname=moarchy-chess
pkgver=0.2.0
pkgrel=1
pkgdesc='Chess against the phone or across a table, for Quickshell'
arch=('any')
url='https://github.com/SimonSchubert/moarchy-apps'
license=('MIT')
# qt6-declarative (QtQuick, QtQuick.Shapes for the pieces, WorkerScript for
# the search) comes with quickshell. The kit's icons are Nerd Font glyphs,
# which namcap cannot see, so it calls that dependency unneeded.
depends=('quickshell' 'ttf-jetbrains-mono-nerd' 'hicolor-icon-theme')
# A release asset that packaging/release.sh builds from apps/chess at the tag,
# with shared/kit in place of the kit link -- not GitHub's generated archive,
# whose compression has moved under pinned checksums before.
source=("$url/releases/download/chess-v$pkgver/$pkgname-$pkgver.tar.gz")
# Pinned in the commit after the tag, as every app's here is.
sha256sums=('1bf3a0a326936a9442f26cc983c83ab7a04d661767f338b5819a8957cac64920')

check() {
  cd "$pkgname-$pkgver"
  # The rules (perft included), the opponent and the file. No display needed.
  QT_QPA_PLATFORM=offscreen /usr/lib/qt6/bin/qmltestrunner -input tests
}

package() {
  cd "$pkgname-$pkgver"

  install -d "$pkgdir/usr/share/$pkgname/kit"
  install -m644 manifest.json ./*.qml ./*.js icon.svg "$pkgdir/usr/share/$pkgname/"
  install -m644 kit/*.qml kit/*.js "$pkgdir/usr/share/$pkgname/kit/"

  install -Dm755 bin/moarchy-chess "$pkgdir/usr/bin/moarchy-chess"
  install -Dm644 org.moarchy.Chess.desktop \
    "$pkgdir/usr/share/applications/org.moarchy.Chess.desktop"
  install -Dm644 icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.moarchy.Chess.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
