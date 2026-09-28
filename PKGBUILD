# Maintainer: Simon Schubert <simon@librem.one>
#
# Text Editor as an app: the QML tree in /usr/share/moarchy-editor, started by
# /usr/bin/moarchy-editor. That launcher opens a file in the running Omarchy
# shell when the plugin is installed there, and in its own Quickshell process
# everywhere else -- so this package needs Quickshell, not Omarchy. With
# --wait it is an $EDITOR: it returns when the file is closed.
#
# The first package of it: 0.1.0 was a shell plugin only, copied onto a phone
# by hand. 0.2.0 reads the state.json that plugin wrote.
pkgname=moarchy-editor
pkgver=0.2.0
pkgrel=1
pkgdesc='One text file at a time, and an $EDITOR that waits, for Quickshell'
arch=('any')
url='https://github.com/SimonSchubert/moarchy-apps'
license=('MIT')
# qt6-declarative (QtQuick) comes with quickshell. The kit's icons are Nerd
# Font glyphs, which namcap cannot see, so it calls that dependency unneeded.
# bash for the launcher's wait loop; coreutils' stat, touch and realpath for
# the rest, which every base install has.
depends=('quickshell' 'bash' 'ttf-jetbrains-mono-nerd' 'hicolor-icon-theme')
# A release asset that packaging/release.sh builds from apps/editor at the
# tag, with shared/kit in place of the kit link -- not GitHub's generated
# archive, whose compression has moved under pinned checksums before.
source=("$url/releases/download/editor-v$pkgver/$pkgname-$pkgver.tar.gz")
# Pinned in the commit after the tag, as every app's here is.
sha256sums=('2caa73e129f0bd88d6266391aff8a2a8bf5b22a9e2e91cabb68ac6974eff12f3')

check() {
  cd "$pkgname-$pkgver"
  # What a file has to be to be written back exactly, and the list of files.
  # No display needed.
  QT_QPA_PLATFORM=offscreen /usr/lib/qt6/bin/qmltestrunner -input tests
}

package() {
  cd "$pkgname-$pkgver"

  install -d "$pkgdir/usr/share/$pkgname/kit"
  install -m644 manifest.json ./*.qml ./*.js icon.svg "$pkgdir/usr/share/$pkgname/"
  install -m644 kit/*.qml kit/*.js "$pkgdir/usr/share/$pkgname/kit/"

  install -Dm755 bin/moarchy-editor "$pkgdir/usr/bin/moarchy-editor"
  install -Dm644 org.moarchy.Editor.desktop \
    "$pkgdir/usr/share/applications/org.moarchy.Editor.desktop"
  install -Dm644 org.moarchy.Editor.open.desktop \
    "$pkgdir/usr/share/applications/org.moarchy.Editor.open.desktop"
  install -Dm644 icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.moarchy.Editor.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
