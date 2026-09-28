# Maintainer: Simon Schubert <simon@librem.one>
#
# Keep as an app: the QML tree in /usr/share/moarchy-keep, started by
# /usr/bin/moarchy-keep. That launcher opens it in the running Omarchy shell
# when the plugin is installed there, and as its own Quickshell process
# everywhere else -- so this package needs Quickshell, not Omarchy.
#
# 0.1.1 was a GTK4/libadwaita app in Python. 0.2.0 is the same notes in QML,
# reading and writing the same ~/.local/share/moarchy-keep/notes.json, so every
# note typed in one is in the other.
pkgname=moarchy-keep
pkgver=0.2.0
pkgrel=1
pkgdesc='Notes and checklists in the shape of Google Keep, for Quickshell'
arch=('any')
url='https://github.com/SimonSchubert/moarchy-apps'
license=('MIT')
# qt6-declarative (QtQuick) comes with quickshell. The icons are Nerd Font
# glyphs, which namcap cannot see, so it calls that dependency unneeded.
depends=('quickshell' 'ttf-jetbrains-mono-nerd' 'hicolor-icon-theme')
# A release asset that packaging/release.sh builds from apps/keep at the tag,
# with shared/kit in place of the kit link -- not GitHub's generated archive,
# whose compression has moved under pinned checksums before.
source=("$url/releases/download/keep-v$pkgver/$pkgname-$pkgver.tar.gz")
# Pinned in the commit after the tag, as every app's here is.
sha256sums=('7ab269cc9a1af3cb186e87eea0f48728eb02e53ba777d727815aef4fb48f9141')

check() {
  cd "$pkgname-$pkgver"
  # The notes and their file. No display needed.
  QT_QPA_PLATFORM=offscreen /usr/lib/qt6/bin/qmltestrunner -input tests
}

package() {
  cd "$pkgname-$pkgver"

  install -d "$pkgdir/usr/share/$pkgname/kit"
  install -m644 manifest.json ./*.qml ./*.js icon.svg "$pkgdir/usr/share/$pkgname/"
  install -m644 kit/*.qml kit/*.js "$pkgdir/usr/share/$pkgname/kit/"

  install -Dm755 bin/moarchy-keep "$pkgdir/usr/bin/moarchy-keep"
  install -Dm644 org.moarchy.Keep.desktop \
    "$pkgdir/usr/share/applications/org.moarchy.Keep.desktop"
  install -Dm644 icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.moarchy.Keep.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
