# Maintainer: Simon Schubert <simon@librem.one>
#
# Airwaves as an app: the QML tree in /usr/share/airwaves, started by
# /usr/bin/airwaves. That launcher opens it in the running Omarchy shell when
# the plugin is installed there, and as its own Quickshell process everywhere
# else -- so this package needs Quickshell, not Omarchy.
pkgname=airwaves
pkgver=1.0.0
pkgrel=1
pkgdesc='Internet radio from radio-browser.info: 50,000 stations by genre, country and language, for Quickshell'
arch=('any')
url='https://github.com/SimonSchubert/moarchy-apps'
license=('MIT')
# qt6-declarative (QtQuick) comes with quickshell. The icons are Nerd Font
# glyphs, which namcap cannot see, so it calls this dependency unneeded -- as
# it does quickshell, for the same reason. mpv is the player: the app starts
# it and talks to it over a socket, which namcap cannot see either.
# qt6-imageformats decodes the WebP logos many stations have (without it they
# fall back to the station's colour and initials); Qt loads it as a plugin at
# run time, so namcap calls it unneeded too.
# util-linux is setpriv, which ties mpv's life to the app's.
depends=('quickshell' 'mpv' 'util-linux' 'qt6-imageformats' 'ttf-jetbrains-mono-nerd' 'hicolor-icon-theme')
optdepends=('mpv-mpris: the station on media keys and the lock screen')
# A release asset that packaging/release.sh builds from apps/airwaves at the
# tag, not GitHub's generated archive of the whole repository.
source=("$url/releases/download/airwaves-v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('fb3c31a5cf018e662ca7f4e3b9807d392803a91f592b8ea5f4c1bb31e1d2a5e1')

package() {
  cd "$pkgname-$pkgver"

  install -d "$pkgdir/usr/share/$pkgname"
  install -m644 manifest.json ./*.qml ./*.js ./*.mjs icon.svg \
    "$pkgdir/usr/share/$pkgname/"

  install -Dm755 bin/airwaves "$pkgdir/usr/bin/airwaves"
  install -Dm644 airwaves.desktop "$pkgdir/usr/share/applications/airwaves.desktop"
  install -Dm644 icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/airwaves.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
