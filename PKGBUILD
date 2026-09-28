# Maintainer: Simon Schubert <simon@librem.one>
#
# Calendar as an app: the QML tree in /usr/share/moarchy-calendar, started by
# /usr/bin/moarchy-calendar. That launcher opens it in the running Omarchy
# shell when the plugin is installed there, and as its own Quickshell process
# everywhere else -- so this package needs Quickshell, not Omarchy.
#
# 0.1.0 was a shell plugin only, copied onto a phone by hand and never
# packaged. 0.2.0 is the first package, reading the same
# ~/.local/share/moarchy-calendar/calendar.json.
pkgname=moarchy-calendar
pkgver=0.2.0
pkgrel=1
pkgdesc='A calendar in one file: the month, the day under it, and what is next, for Quickshell'
arch=('any')
url='https://github.com/SimonSchubert/moarchy-apps'
license=('MIT')
# qt6-declarative (QtQuick) comes with quickshell. The icons are Nerd Font
# glyphs, which namcap cannot see, so it calls that dependency unneeded.
depends=('quickshell' 'ttf-jetbrains-mono-nerd' 'hicolor-icon-theme')
# A release asset that packaging/release.sh builds from apps/calendar at the
# tag, with shared/kit in place of the kit link.
source=("$url/releases/download/calendar-v$pkgver/$pkgname-$pkgver.tar.gz")
# Pinned in the commit after the tag, as every app's here is.
sha256sums=('2209dc9f0f6cda6d6db38a2a96d31da8c2d19870c2d5625a9c4cda8ce1c73e00')

check() {
  cd "$pkgname-$pkgver"
  # The dates, the events and the file. No display needed.
  QT_QPA_PLATFORM=offscreen /usr/lib/qt6/bin/qmltestrunner -input tests
}

package() {
  cd "$pkgname-$pkgver"

  install -d "$pkgdir/usr/share/$pkgname/kit"
  install -m644 manifest.json ./*.qml ./*.js icon.svg "$pkgdir/usr/share/$pkgname/"
  install -m644 kit/*.qml kit/*.js "$pkgdir/usr/share/$pkgname/kit/"

  install -Dm755 bin/moarchy-calendar "$pkgdir/usr/bin/moarchy-calendar"
  install -Dm644 org.moarchy.Calendar.desktop \
    "$pkgdir/usr/share/applications/org.moarchy.Calendar.desktop"
  install -Dm644 icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.moarchy.Calendar.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
