# Maintainer: Simon Schubert <simon@librem.one>
#
# Tic-tac-toe as an app: the QML tree in /usr/share/moarchy-tictactoe, started
# by /usr/bin/moarchy-tictactoe. That launcher opens it in the running Omarchy
# shell when the plugin is installed there, and as its own Quickshell process
# everywhere else -- so this package needs Quickshell, not Omarchy.
#
# 0.1.0 was a GTK4/libadwaita app in Python. 0.2.0 is the same game in QML,
# reading and writing the same ~/.local/share/moarchy-tictactoe/tictactoe.json,
# so a game left in one is the game found in the other.
pkgname=moarchy-tictactoe
pkgver=0.2.0
pkgrel=1
pkgdesc='Noughts and crosses, solved and told to err, for Quickshell'
arch=('any')
url='https://github.com/SimonSchubert/moarchy-apps'
license=('MIT')
# qt6-declarative (QtQuick) comes with quickshell. The kit's icons are Nerd
# Font glyphs, which namcap cannot see, so it calls that dependency unneeded.
depends=('quickshell' 'ttf-jetbrains-mono-nerd' 'hicolor-icon-theme')
# A release asset that packaging/release.sh builds from apps/tictactoe at the
# tag, with shared/kit in place of the kit link -- not GitHub's generated
# archive, whose compression has moved under pinned checksums before.
source=("$url/releases/download/tictactoe-v$pkgver/$pkgname-$pkgver.tar.gz")
# Pinned in the commit after the tag, as every app's here is.
sha256sums=('6e6443653b3be42acb9cd30c0b94dfa32ede183c6922c969b92be5502d287443')

check() {
  cd "$pkgname-$pkgver"
  # The rules, the solver and the file. No display needed.
  QT_QPA_PLATFORM=offscreen /usr/lib/qt6/bin/qmltestrunner -input tests
}

package() {
  cd "$pkgname-$pkgver"

  install -d "$pkgdir/usr/share/$pkgname/kit"
  install -m644 manifest.json ./*.qml ./*.js icon.svg "$pkgdir/usr/share/$pkgname/"
  install -m644 kit/*.qml kit/*.js "$pkgdir/usr/share/$pkgname/kit/"

  install -Dm755 bin/moarchy-tictactoe "$pkgdir/usr/bin/moarchy-tictactoe"
  install -Dm644 org.moarchy.TicTacToe.desktop \
    "$pkgdir/usr/share/applications/org.moarchy.TicTacToe.desktop"
  install -Dm644 icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.moarchy.TicTacToe.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
