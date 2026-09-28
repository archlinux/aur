# Maintainer: Simon Schubert <simon@librem.one>
#
# Solitaire as an app: the QML tree in /usr/share/moarchy-solitaire, started
# by /usr/bin/moarchy-solitaire. That launcher opens it in the running Omarchy
# shell when the plugin is installed there, and as its own Quickshell process
# everywhere else -- so this package needs Quickshell, not Omarchy.
#
# 0.1.0 was a GTK4/libadwaita app in Python. 0.2.0 is the same game in QML,
# reading and writing the same ~/.local/share/moarchy-solitaire/solitaire.json,
# so a deal left in one is the deal found in the other.
pkgname=moarchy-solitaire
pkgver=0.2.0
pkgrel=1
pkgdesc='Klondike patience, one tap a move, for Quickshell'
arch=('any')
url='https://github.com/SimonSchubert/moarchy-apps'
license=('MIT')
# qt6-declarative (QtQuick) comes with quickshell. The kit's icons are Nerd
# Font glyphs, which namcap cannot see, so it calls that dependency unneeded.
depends=('quickshell' 'ttf-jetbrains-mono-nerd' 'hicolor-icon-theme')
# A release asset that packaging/release.sh builds from apps/solitaire at the
# tag, with shared/kit in place of the kit link -- not GitHub's generated
# archive, whose compression has moved under pinned checksums before.
source=("$url/releases/download/solitaire-v$pkgver/$pkgname-$pkgver.tar.gz")
# Pinned in the commit after the tag, as every app's here is.
sha256sums=('e1dc97106e448434f828104de0f72dff0f8b11c436cd957bf46bbc9d7d897e88')

check() {
  cd "$pkgname-$pkgver"
  # The rules, the file and the layout, and parity with 0.1.0. No display.
  QT_QPA_PLATFORM=offscreen /usr/lib/qt6/bin/qmltestrunner -input tests
}

package() {
  cd "$pkgname-$pkgver"

  install -d "$pkgdir/usr/share/$pkgname/kit"
  install -m644 manifest.json ./*.qml ./*.js icon.svg "$pkgdir/usr/share/$pkgname/"
  install -m644 kit/*.qml kit/*.js "$pkgdir/usr/share/$pkgname/kit/"

  install -Dm755 bin/moarchy-solitaire "$pkgdir/usr/bin/moarchy-solitaire"
  install -Dm644 org.moarchy.Solitaire.desktop \
    "$pkgdir/usr/share/applications/org.moarchy.Solitaire.desktop"
  install -Dm644 icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.moarchy.Solitaire.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
