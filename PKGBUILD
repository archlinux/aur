# Maintainer: Simon Schubert <simon@librem.one>
#
# Five Letters as an app: the QML tree in /usr/share/moarchy-fiveletters,
# started by /usr/bin/moarchy-fiveletters. That launcher opens it in the running
# Omarchy shell when the plugin is installed there, and as its own Quickshell
# process everywhere else -- so this package needs Quickshell, not Omarchy.
#
# 0.1.0 was a GTK4/libadwaita app in Python. 0.2.0 is the same game in QML: the
# same word on the same day, reading and writing the same
# ~/.local/share/moarchy-fiveletters/fiveletters.json, so a streak carries over.
pkgname=moarchy-fiveletters
pkgver=0.2.0
pkgrel=1
pkgdesc='A five-letter word a day, with a keyboard of its own, for Quickshell'
arch=('any')
url='https://github.com/SimonSchubert/moarchy-apps'
license=('MIT')
# qt6-declarative (QtQuick) comes with quickshell. The kit's icons are Nerd
# Font glyphs, which namcap cannot see, so it calls that dependency unneeded.
depends=('quickshell' 'ttf-jetbrains-mono-nerd' 'hicolor-icon-theme')
# A release asset that packaging/release.sh builds from apps/fiveletters at the
# tag, with shared/kit in place of the kit link.
source=("$url/releases/download/fiveletters-v$pkgver/$pkgname-$pkgver.tar.gz")
# Pinned in the commit after the tag, as every app's here is.
sha256sums=('d2904296cb7d6cfa7a24506786bf446b54e1dbf5ee8531a41e5088ac1da1a9ee')

check() {
  cd "$pkgname-$pkgver"
  # The rules, the word lists, the day's word and the file. No display needed.
  QT_QPA_PLATFORM=offscreen /usr/lib/qt6/bin/qmltestrunner -input tests
}

package() {
  cd "$pkgname-$pkgver"

  # The word lists are Lists.js, with the rest of the JavaScript.
  install -d "$pkgdir/usr/share/$pkgname/kit"
  install -m644 manifest.json ./*.qml ./*.js icon.svg "$pkgdir/usr/share/$pkgname/"
  install -m644 kit/*.qml kit/*.js "$pkgdir/usr/share/$pkgname/kit/"

  install -Dm755 bin/moarchy-fiveletters "$pkgdir/usr/bin/moarchy-fiveletters"
  install -Dm644 org.moarchy.FiveLetters.desktop \
    "$pkgdir/usr/share/applications/org.moarchy.FiveLetters.desktop"
  install -Dm644 icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.moarchy.FiveLetters.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 NOTICE.md "$pkgdir/usr/share/doc/$pkgname/NOTICE.md"
}
