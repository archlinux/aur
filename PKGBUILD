# Maintainer: Simon Schubert <simon@librem.one>
#
# Atlas as an app: the QML tree in /usr/share/moarchy-atlas, started by
# /usr/bin/moarchy-atlas. That launcher opens it in the running Omarchy shell
# when the plugin is installed there, and as its own Quickshell process
# everywhere else -- so this package needs Quickshell, not Omarchy.
pkgname=moarchy-atlas
pkgver=0.1.0
pkgrel=1
pkgdesc='Flags, capitals and facts for every country, and a flag quiz, for Quickshell'
arch=('any')
url='https://github.com/SimonSchubert/moarchy-apps'
license=('MIT')
# qt6-declarative (QtQuick) comes with quickshell. curl makes the three
# requests to REST Countries and fetches the flags. The kit's icons are Nerd
# Font glyphs, which namcap cannot see, so it calls that dependency unneeded.
depends=('quickshell' 'curl' 'ttf-jetbrains-mono-nerd' 'hicolor-icon-theme')
# A release asset that packaging/release.sh builds from apps/atlas at the tag,
# with shared/kit in place of the kit link -- not GitHub's generated archive,
# whose compression has moved under pinned checksums before.
source=("$url/releases/download/atlas-v$pkgver/$pkgname-$pkgver.tar.gz")
# Pinned in the commit after the tag, as every app's here is.
sha256sums=('53a3f332a80fb0c74294038aeb140521086b71da78dd5bcb4160e2d948d4c89e')

check() {
  cd "$pkgname-$pkgver"
  # REST Countries' JSON, our three files, the quiz's rules and every figure
  # on screen, against a fixture. No display and no network needed.
  QT_QPA_PLATFORM=offscreen /usr/lib/qt6/bin/qmltestrunner -input tests
}

package() {
  cd "$pkgname-$pkgver"

  install -d "$pkgdir/usr/share/$pkgname/kit"
  install -m644 manifest.json ./*.qml ./*.js icon.svg "$pkgdir/usr/share/$pkgname/"
  install -m644 kit/*.qml kit/*.js "$pkgdir/usr/share/$pkgname/kit/"

  install -Dm755 bin/moarchy-atlas "$pkgdir/usr/bin/moarchy-atlas"
  install -Dm644 org.moarchy.Atlas.desktop \
    "$pkgdir/usr/share/applications/org.moarchy.Atlas.desktop"
  install -Dm644 icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.moarchy.Atlas.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
