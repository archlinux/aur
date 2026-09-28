# Maintainer: Simon Schubert <simon@librem.one>
#
# The calculator as an app: the QML tree in /usr/share/moarchy-calculator,
# started by /usr/bin/moarchy-calculator. That launcher opens it in the running
# Omarchy shell when the plugin is installed there, and as its own Quickshell
# process everywhere else -- so this package needs Quickshell, not Omarchy.
#
# The first package of it: 0.1.0 was a shell plugin only, copied onto a phone
# by hand. 0.2.0 reads the calculator.json that plugin wrote.
pkgname=moarchy-calculator
pkgver=0.2.0
pkgrel=1
pkgdesc='The four operations, a tape you can tap, and arithmetic in tens, for Quickshell'
arch=('any')
url='https://github.com/SimonSchubert/moarchy-apps'
license=('MIT')
# qt6-declarative (QtQuick) comes with quickshell. The kit's icons are Nerd
# Font glyphs, which namcap cannot see, so it calls that dependency unneeded.
depends=('quickshell' 'ttf-jetbrains-mono-nerd' 'hicolor-icon-theme')
# A release asset that packaging/release.sh builds from apps/calculator at the
# tag, with shared/kit in place of the kit link.
source=("$url/releases/download/calculator-v$pkgver/$pkgname-$pkgver.tar.gz")
# Pinned in the commit after the tag, as every app's here is.
sha256sums=('3d108e96014974a9517e80d69d2172b10c3613a911a61ea78a9e4d11d38f8b7c')

check() {
  cd "$pkgname-$pkgver"
  # The arithmetic, the keys and the file. No display needed.
  QT_QPA_PLATFORM=offscreen /usr/lib/qt6/bin/qmltestrunner -input tests
}

package() {
  cd "$pkgname-$pkgver"

  install -d "$pkgdir/usr/share/$pkgname/kit"
  install -m644 manifest.json ./*.qml ./*.js icon.svg "$pkgdir/usr/share/$pkgname/"
  install -m644 kit/*.qml kit/*.js "$pkgdir/usr/share/$pkgname/kit/"

  install -Dm755 bin/moarchy-calculator "$pkgdir/usr/bin/moarchy-calculator"
  install -Dm644 org.moarchy.Calculator.desktop \
    "$pkgdir/usr/share/applications/org.moarchy.Calculator.desktop"
  install -Dm644 icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.moarchy.Calculator.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
