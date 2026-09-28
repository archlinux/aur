# Maintainer: Simon Schubert <simon@librem.one>
#
# Clock as an app: the QML tree in /usr/share/moarchy-clock, started by
# /usr/bin/moarchy-clock. That launcher opens it in the running Omarchy shell
# when the plugin is installed there -- where the shell keeps it loaded and an
# alarm rings with the window shut -- and as its own Quickshell process
# everywhere else, where it rings while its window is open.
#
# 0.1.0 was a shell plugin only, installed by copying it onto a phone. 0.2.0
# is the first package: the same clock, the same
# ~/.local/share/moarchy-clock/clock.json, and a desktop layout.
pkgname=moarchy-clock
pkgver=0.2.0
pkgrel=1
pkgdesc='The time, an alarm that says when it is late, a stopwatch and a timer, for Quickshell'
arch=('any')
url='https://github.com/SimonSchubert/moarchy-apps'
license=('MIT')
# qt6-declarative (QtQuick) comes with quickshell. The icons are Nerd Font
# glyphs, which namcap cannot see. The alarm tone is the freedesktop sound
# theme's, played by whichever of pw-play, paplay or canberra-gtk-play is
# there; with none, the ring is on the screen and says so.
depends=('quickshell' 'ttf-jetbrains-mono-nerd' 'hicolor-icon-theme')
optdepends=('sound-theme-freedesktop: the alarm tone'
            'pipewire: pw-play, to play it')
# A release asset that packaging/release.sh builds from apps/clock at the tag,
# with shared/kit in place of the kit link.
source=("$url/releases/download/clock-v$pkgver/$pkgname-$pkgver.tar.gz")
# Pinned in the commit after the tag, as every app's here is.
sha256sums=('8aa9fd815f08501f4dacda63aa0612dd0e2a0ea85a828b99a0bd22f1b091dbca')

check() {
  cd "$pkgname-$pkgver"
  # The alarms, the stopwatch and timer arithmetic, and the file. No display.
  QT_QPA_PLATFORM=offscreen /usr/lib/qt6/bin/qmltestrunner -input tests
}

package() {
  cd "$pkgname-$pkgver"

  install -d "$pkgdir/usr/share/$pkgname/kit"
  install -m644 manifest.json ./*.qml ./*.js ./*.svg "$pkgdir/usr/share/$pkgname/"
  install -m644 kit/*.qml kit/*.js "$pkgdir/usr/share/$pkgname/kit/"

  install -Dm755 bin/moarchy-clock "$pkgdir/usr/bin/moarchy-clock"
  install -Dm644 org.moarchy.Clock.desktop \
    "$pkgdir/usr/share/applications/org.moarchy.Clock.desktop"
  install -Dm644 icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.moarchy.Clock.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
