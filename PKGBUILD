# Maintainer: Simon Schubert <simon@librem.one>
#
# Mill as an app: the QML tree in /usr/share/moarchy-mill, started by
# /usr/bin/moarchy-mill. That launcher opens it in the running Omarchy shell
# when the plugin is installed there, and as its own Quickshell process
# everywhere else -- so this package needs Quickshell, not Omarchy.
#
# 0.1.0 was a GTK4/libadwaita app in Python. 0.2.0 is the same game in QML,
# reading and writing the same ~/.local/share/moarchy-mill/mill.json, so a
# game left in one is the game found in the other.
pkgname=moarchy-mill
pkgver=0.2.0
pkgrel=1
pkgdesc="Nine Men's Morris against the phone or across a table, for Quickshell"
arch=('any')
url='https://github.com/SimonSchubert/moarchy-apps'
license=('MIT')
# qt6-declarative (QtQuick, WorkerScript) comes with quickshell. The kit's
# icons are Nerd Font glyphs, which namcap cannot see, so it calls that
# dependency unneeded.
depends=('quickshell' 'ttf-jetbrains-mono-nerd' 'hicolor-icon-theme')
# A release asset that packaging/release.sh builds from apps/mill at the tag,
# with shared/kit in place of the kit link -- not GitHub's generated archive,
# whose compression has moved under pinned checksums before.
source=("$url/releases/download/mill-v$pkgver/$pkgname-$pkgver.tar.gz")
# Pinned in the commit after the tag, as every app's here is.
sha256sums=('c5d9317d0e8135d5b253f56b1c4b89019ee5fd357746d72e8b3d4f583bda4429')

check() {
  cd "$pkgname-$pkgver"
  # The rules, the opponent and the file. No display needed.
  QT_QPA_PLATFORM=offscreen /usr/lib/qt6/bin/qmltestrunner -input tests
}

package() {
  cd "$pkgname-$pkgver"

  install -d "$pkgdir/usr/share/$pkgname/kit"
  install -m644 manifest.json ./*.qml ./*.js icon.svg "$pkgdir/usr/share/$pkgname/"
  install -m644 kit/*.qml kit/*.js "$pkgdir/usr/share/$pkgname/kit/"

  install -Dm755 bin/moarchy-mill "$pkgdir/usr/bin/moarchy-mill"
  install -Dm644 org.moarchy.Mill.desktop \
    "$pkgdir/usr/share/applications/org.moarchy.Mill.desktop"
  install -Dm644 icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.moarchy.Mill.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
