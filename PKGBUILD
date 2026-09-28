# Maintainer: Simon Schubert <simon@librem.one>
#
# Weather as an app: the QML tree in /usr/share/moarchy-weather, started by
# /usr/bin/moarchy-weather. That launcher opens it in the running Omarchy shell
# when the plugin is installed there, and as its own Quickshell process
# everywhere else -- so this package needs Quickshell, not Omarchy.
#
# The first package of it: until 0.2.0 it was a shell plugin copied onto the
# phone by hand.
pkgname=moarchy-weather
pkgver=0.2.0
pkgrel=1
pkgdesc='Now, the next day and the week, from Open-Meteo, for Quickshell'
arch=('any')
url='https://github.com/SimonSchubert/moarchy-apps'
license=('MIT')
# qt6-declarative (QtQuick) comes with quickshell. curl asks Open-Meteo and
# GeoJS. The kit's icons are Nerd Font glyphs, which namcap cannot see.
depends=('quickshell' 'curl' 'ttf-jetbrains-mono-nerd' 'hicolor-icon-theme')
# A release asset that packaging/release.sh builds from apps/weather at the
# tag, with shared/kit in place of the kit link.
source=("$url/releases/download/weather-v$pkgver/$pkgname-$pkgver.tar.gz")
# Pinned in the commit after the tag, as every app's here is.
sha256sums=('1a645d73cb641d1557026f357fdbc39a4f1418211b66106057d9f1b5c2fc40c1')

check() {
  cd "$pkgname-$pkgver"
  # The answers Open-Meteo and GeoJS give, read, and the two files. No
  # display and no network needed.
  QT_QPA_PLATFORM=offscreen /usr/lib/qt6/bin/qmltestrunner -input tests
}

package() {
  cd "$pkgname-$pkgver"

  install -d "$pkgdir/usr/share/$pkgname/kit"
  install -m644 manifest.json ./*.qml ./*.js icon.svg "$pkgdir/usr/share/$pkgname/"
  install -m644 kit/*.qml kit/*.js "$pkgdir/usr/share/$pkgname/kit/"

  install -Dm755 bin/moarchy-weather "$pkgdir/usr/bin/moarchy-weather"
  install -Dm644 org.moarchy.Weather.desktop \
    "$pkgdir/usr/share/applications/org.moarchy.Weather.desktop"
  install -Dm644 icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.moarchy.Weather.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
