# Maintainer: Simon Schubert <simon@librem.one>
#
# App Finder as an app: the QML tree in /usr/share/app-finder, started by
# /usr/bin/app-finder as its own Quickshell process, and the helper that
# fetches the list and runs the installs in /usr/lib/app-finder.
pkgname=app-finder
pkgver=1.0.1
pkgrel=1
pkgdesc='Find AUR apps that were tested on a phone-sized screen, and install them, for Quickshell'
arch=('any')
url='https://github.com/SimonSchubert/app-finder'
license=('MIT')
# qt6-declarative (QtQuick) comes with quickshell. The icons are Nerd Font
# glyphs, which namcap cannot see, so it calls that dependency unneeded -- as
# it does quickshell, for the same reason. pkexec is polkit's.
depends=('quickshell' 'ttf-jetbrains-mono-nerd' 'hicolor-icon-theme' 'bash' 'curl' 'jq' 'polkit')
optdepends=('yay: install and remove apps from the AUR'
            'xdg-utils: open an app'\''s AUR page')
# A release asset that packaging/release.sh builds from the tag, not GitHub's
# generated archive of the repository.
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('1a5a7c84880fc14a821150aca03022c0d00416a36a4d70b6fe90028e3e01cc14')

package() {
  cd "$pkgname-$pkgver"

  install -d "$pkgdir/usr/share/$pkgname"
  install -m644 ./*.qml ./*.js icon.svg "$pkgdir/usr/share/$pkgname/"

  install -Dm755 bin/app-finder "$pkgdir/usr/bin/app-finder"
  install -Dm755 libexec/app-finder-helper "$pkgdir/usr/lib/$pkgname/app-finder-helper"
  install -Dm755 libexec/app-finder-sudo "$pkgdir/usr/lib/$pkgname/app-finder-sudo"
  install -Dm755 libexec/app-finder-pacman "$pkgdir/usr/lib/$pkgname/app-finder-pacman"
  install -Dm644 polkit/io.github.simonschubert.app-finder.policy \
    "$pkgdir/usr/share/polkit-1/actions/io.github.simonschubert.app-finder.policy"
  install -Dm644 app-finder.desktop "$pkgdir/usr/share/applications/app-finder.desktop"
  install -Dm644 icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/app-finder.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
