# Maintainer: Simon Schubert <simon@librem.one>
#
# Books as an app: the QML tree in /usr/share/moarchy-books, started by
# /usr/bin/moarchy-books. That launcher opens it in the running Omarchy shell
# when the plugin is installed there, and as its own Quickshell process
# everywhere else -- so this package needs Quickshell, not Omarchy.
pkgname=moarchy-books
pkgver=0.1.0
pkgrel=1
pkgdesc='Open Library and a reading list of your own: discover, search, shelve, track pages'
arch=('any')
url='https://github.com/SimonSchubert/moarchy-apps'
license=('MIT')
# qt6-declarative (QtQuick) comes with quickshell. curl asks Open Library the
# questions. The kit's icons are Nerd Font glyphs, which namcap cannot see,
# so it calls that dependency unneeded.
depends=('quickshell' 'curl' 'ttf-jetbrains-mono-nerd' 'hicolor-icon-theme')
# A release asset that packaging/release.sh builds from apps/books at the
# tag, with shared/kit in place of the kit link.
source=("$url/releases/download/books-v$pkgver/$pkgname-$pkgver.tar.gz")
# Pinned in the commit after the tag, as every app's here is.
sha256sums=('6e67abb80559fb7d4096bf7e232ab015712487c02ef9f0a2501aff1519070ec7')

check() {
  cd "$pkgname-$pkgver"
  # Somebody else's JSON, our own file, and every figure on screen. No
  # display, no network.
  QT_QPA_PLATFORM=offscreen /usr/lib/qt6/bin/qmltestrunner -input tests
}

package() {
  cd "$pkgname-$pkgver"

  install -d "$pkgdir/usr/share/$pkgname/kit"
  install -m644 manifest.json ./*.qml ./*.js icon.svg "$pkgdir/usr/share/$pkgname/"
  install -m644 kit/*.qml kit/*.js "$pkgdir/usr/share/$pkgname/kit/"

  install -Dm755 bin/moarchy-books "$pkgdir/usr/bin/moarchy-books"
  install -Dm644 org.moarchy.Books.desktop \
    "$pkgdir/usr/share/applications/org.moarchy.Books.desktop"
  install -Dm644 icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.moarchy.Books.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
