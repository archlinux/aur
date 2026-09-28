# Maintainer: Simon Schubert <simon@librem.one>
#
# Video Library as an app: the QML tree in /usr/share/moarchy-video-library,
# started by /usr/bin/moarchy-video-library. That launcher opens it in the
# running Omarchy shell when the plugin is installed there, and as its own
# Quickshell process everywhere else -- so this package needs Quickshell, not
# Omarchy.
pkgname=moarchy-video-library
pkgver=0.1.0
pkgrel=1
pkgdesc="LBRY's videos through Odysee: browse, search, follow channels, watch"
arch=('any')
url='https://github.com/SimonSchubert/moarchy-apps'
license=('MIT')
# qt6-declarative (QtQuick) comes with quickshell. curl asks the questions;
# Qt Multimedia and its FFmpeg backend play the answers in the page. The
# kit's icons are Nerd Font glyphs, which namcap cannot see, so it calls that
# dependency unneeded.
depends=('quickshell' 'curl' 'qt6-multimedia' 'qt6-multimedia-ffmpeg' 'ttf-jetbrains-mono-nerd' 'hicolor-icon-theme')
optdepends=('mpv: the mpv button, for a video in its own window')
# A release asset that packaging/release.sh builds from apps/video-library at the
# tag, with shared/kit in place of the kit link.
source=("$url/releases/download/video-library-v$pkgver/$pkgname-$pkgver.tar.gz")
# Pinned in the commit after the tag, as every app's here is.
sha256sums=('9aced91b9086f431d6609f6ebb37869f67ea97667e9230c704c867acd6bb4138')

check() {
  cd "$pkgname-$pkgver"
  # Somebody else's JSON, and every figure on screen. No display, no network.
  QT_QPA_PLATFORM=offscreen /usr/lib/qt6/bin/qmltestrunner -input tests
}

package() {
  cd "$pkgname-$pkgver"

  install -d "$pkgdir/usr/share/$pkgname/kit"
  install -m644 manifest.json ./*.qml ./*.js icon.svg "$pkgdir/usr/share/$pkgname/"
  install -m644 kit/*.qml kit/*.js "$pkgdir/usr/share/$pkgname/kit/"

  install -Dm755 bin/moarchy-video-library "$pkgdir/usr/bin/moarchy-video-library"
  install -Dm644 org.moarchy.VideoLibrary.desktop \
    "$pkgdir/usr/share/applications/org.moarchy.VideoLibrary.desktop"
  install -Dm644 icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.moarchy.VideoLibrary.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
