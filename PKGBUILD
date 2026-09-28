# Maintainer: Simon Schubert <simon@librem.one>
#
# Peg Solitaire as an app: the QML tree in /usr/share/moarchy-pegsolitaire,
# started by /usr/bin/moarchy-pegsolitaire. That launcher opens it in the
# running Omarchy shell when the plugin is installed there, and as its own
# Quickshell process everywhere else -- so this package needs Quickshell, not
# Omarchy.
#
# 0.1.0 was a GTK4/libadwaita app in Python. 0.2.0 is the same puzzle in QML,
# the solver on a worker thread, reading and writing the same
# ~/.local/share/moarchy-pegsolitaire/pegsolitaire.json.
pkgname=moarchy-pegsolitaire
pkgver=0.2.0
pkgrel=1
pkgdesc='Peg solitaire on nine solvable figures, with a hint that is a proof, for Quickshell'
arch=('any')
url='https://github.com/SimonSchubert/moarchy-apps'
license=('MIT')
# qt6-declarative (QtQuick, and WorkerScript) comes with quickshell. The icons
# are Nerd Font glyphs, which namcap cannot see, so it calls that unneeded.
depends=('quickshell' 'ttf-jetbrains-mono-nerd' 'hicolor-icon-theme')
# A release asset that packaging/release.sh builds from apps/pegsolitaire at the
# tag, with shared/kit in place of the kit link -- not GitHub's generated
# archive, whose compression has moved under pinned checksums before.
source=("$url/releases/download/pegsolitaire-v$pkgver/$pkgname-$pkgver.tar.gz")
# Pinned in the commit after the tag, as every app's here is.
sha256sums=('0b24059588c49e16049c10ece2443306339cb23a40f4d60af6173aa7621a2368')

check() {
  cd "$pkgname-$pkgver"
  # The rules, the solver on every figure, and the file. No display needed.
  QT_QPA_PLATFORM=offscreen /usr/lib/qt6/bin/qmltestrunner -input tests
}

package() {
  cd "$pkgname-$pkgver"

  install -d "$pkgdir/usr/share/$pkgname/kit"
  install -m644 manifest.json ./*.qml ./*.js icon.svg "$pkgdir/usr/share/$pkgname/"
  install -m644 kit/*.qml kit/*.js "$pkgdir/usr/share/$pkgname/kit/"

  install -Dm755 bin/moarchy-pegsolitaire "$pkgdir/usr/bin/moarchy-pegsolitaire"
  install -Dm644 org.moarchy.PegSolitaire.desktop \
    "$pkgdir/usr/share/applications/org.moarchy.PegSolitaire.desktop"
  install -Dm644 icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.moarchy.PegSolitaire.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
