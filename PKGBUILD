# Maintainer: Simon Schubert <simon@librem.one>
#
# Contacts as an app: the QML tree in /usr/share/moarchy-contacts, started by
# /usr/bin/moarchy-contacts. That launcher opens it in the running Omarchy
# shell when the plugin is installed there, and as its own Quickshell process
# everywhere else -- so this package needs Quickshell, not Omarchy.
#
# 0.1.0 was a shell plugin, copied onto the phone by a script and never
# packaged; 0.2.0 is the first package, reading and writing the same
# ~/.local/share/moarchy-contacts/contacts.json.
pkgname=moarchy-contacts
pkgver=0.2.0
pkgrel=1
pkgdesc='A name, a number, an email and a note, in one file, for Quickshell'
arch=('any')
url='https://github.com/SimonSchubert/moarchy-apps'
license=('MIT')
# qt6-declarative (QtQuick) comes with quickshell. The kit's icons are Nerd
# Font glyphs, which namcap cannot see, so it calls that dependency unneeded.
depends=('quickshell' 'ttf-jetbrains-mono-nerd' 'hicolor-icon-theme')
# A release asset that packaging/release.sh builds from apps/contacts at the
# tag, with shared/kit in place of the kit link.
source=("$url/releases/download/contacts-v$pkgver/$pkgname-$pkgver.tar.gz")
# Pinned in the commit after the tag, as every app's here is.
sha256sums=('be7430d958a32db2a8af98c3c6b6248e30ccd99acc252cde8b157b2484d5583d')

check() {
  cd "$pkgname-$pkgver"
  # The book and the file. No display needed.
  QT_QPA_PLATFORM=offscreen /usr/lib/qt6/bin/qmltestrunner -input tests
}

package() {
  cd "$pkgname-$pkgver"

  install -d "$pkgdir/usr/share/$pkgname/kit"
  install -m644 manifest.json ./*.qml ./*.js icon.svg "$pkgdir/usr/share/$pkgname/"
  install -m644 kit/*.qml kit/*.js "$pkgdir/usr/share/$pkgname/kit/"

  install -Dm755 bin/moarchy-contacts "$pkgdir/usr/bin/moarchy-contacts"
  install -Dm644 org.moarchy.Contacts.desktop \
    "$pkgdir/usr/share/applications/org.moarchy.Contacts.desktop"
  install -Dm644 icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.moarchy.Contacts.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
