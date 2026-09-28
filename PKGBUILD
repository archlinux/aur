# Maintainer: Simon Schubert <simon@librem.one>
#
# Trivia as an app: the QML tree in /usr/share/moarchy-trivia, started by
# /usr/bin/moarchy-trivia. That launcher opens it in the running Omarchy shell
# when the plugin is installed there, and as its own Quickshell process
# everywhere else -- so this package needs Quickshell, not Omarchy.
pkgname=moarchy-trivia
pkgver=0.1.0
pkgrel=1
pkgdesc='Multiple-choice quizzes by category and difficulty, from Open Trivia DB, for Quickshell'
arch=('any')
url='https://github.com/SimonSchubert/moarchy-apps'
license=('MIT')
# qt6-declarative (QtQuick) comes with quickshell. curl asks Open Trivia DB for
# the questions. The kit's icons are Nerd Font glyphs, which namcap cannot see,
# so it calls that dependency unneeded.
depends=('quickshell' 'curl' 'ttf-jetbrains-mono-nerd' 'hicolor-icon-theme')
# A release asset that packaging/release.sh builds from apps/trivia at the tag,
# with shared/kit in place of the kit link -- not GitHub's generated archive,
# whose compression has moved under pinned checksums before.
source=("$url/releases/download/trivia-v$pkgver/$pkgname-$pkgver.tar.gz")
# Pinned in the commit after the tag, as every app's here is.
sha256sums=('34315009582a5e3506f10d7e3a2a730237ac161fa55a53d9f138bfa47647095c')

check() {
  cd "$pkgname-$pkgver"
  # The parsing, the rounds and the file. No display and no network needed.
  QT_QPA_PLATFORM=offscreen /usr/lib/qt6/bin/qmltestrunner -input tests
}

package() {
  cd "$pkgname-$pkgver"

  install -d "$pkgdir/usr/share/$pkgname/kit"
  install -m644 manifest.json ./*.qml ./*.js icon.svg "$pkgdir/usr/share/$pkgname/"
  install -m644 kit/*.qml kit/*.js "$pkgdir/usr/share/$pkgname/kit/"

  install -Dm755 bin/moarchy-trivia "$pkgdir/usr/bin/moarchy-trivia"
  install -Dm644 org.moarchy.Trivia.desktop \
    "$pkgdir/usr/share/applications/org.moarchy.Trivia.desktop"
  install -Dm644 icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.moarchy.Trivia.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
