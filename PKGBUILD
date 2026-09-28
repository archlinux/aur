# Maintainer: Simon Schubert <simon@librem.one>
#
# Files as an app: the QML tree in /usr/share/moarchy-files, started by
# /usr/bin/moarchy-files. That launcher opens it in the running Omarchy shell
# when the plugin is installed there, and as its own Quickshell process
# everywhere else -- so this package needs Quickshell, not Omarchy.
#
# The first package of it: 0.1.0 was a shell plugin copied onto the phone by
# hand. 0.2.0 reads and writes the same ~/.local/share/moarchy-files/view.json.
pkgname=moarchy-files
pkgver=0.2.0
pkgrel=1
pkgdesc='A file manager, one folder at a time, with the trash every other app reads, for Quickshell'
arch=('any')
url='https://github.com/SimonSchubert/moarchy-apps'
license=('MIT')
# qt6-declarative (QtQuick) comes with quickshell. Every disk operation is a
# short sh script over coreutils and findutils (find -printf, df --output),
# and xdg-utils is what opens a file. The icons are Nerd Font glyphs, which
# namcap cannot see.
depends=('quickshell' 'ttf-jetbrains-mono-nerd' 'hicolor-icon-theme' 'findutils' 'coreutils' 'xdg-utils')
# A release asset that packaging/release.sh builds from apps/files at the tag,
# with shared/kit in place of the kit link.
source=("$url/releases/download/files-v$pkgver/$pkgname-$pkgver.tar.gz")
# Pinned in the commit after the tag, as every app's here is.
sha256sums=('940824b4856785c8878bf225c2e4f7563e145b70d36ea1ff89edfce28f2d88bd')

check() {
  cd "$pkgname-$pkgver"
  # Paths, listings, places, the trash's rules and the view file. No display.
  QT_QPA_PLATFORM=offscreen /usr/lib/qt6/bin/qmltestrunner -input tests
}

package() {
  cd "$pkgname-$pkgver"

  install -d "$pkgdir/usr/share/$pkgname/kit"
  install -m644 manifest.json ./*.qml ./*.js icon.svg "$pkgdir/usr/share/$pkgname/"
  install -m644 kit/*.qml kit/*.js "$pkgdir/usr/share/$pkgname/kit/"

  install -Dm755 bin/moarchy-files "$pkgdir/usr/bin/moarchy-files"
  install -Dm644 org.moarchy.Files.desktop \
    "$pkgdir/usr/share/applications/org.moarchy.Files.desktop"
  install -Dm644 icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.moarchy.Files.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
