# Maintainer: skint007 <archlinux.repose742@passmail.net>
#
# The desktop app from a GitHub Release, as CI built and tested it
# (docs/releasing.md). The release workflow sets the maintainer's email,
# _version, pkgrel and the checksum when it publishes this to the AUR; the
# values here are the release this copy was last checked against.

# pacman sorts a prerelease such as 0.3.0rc.1 before 0.3.0 only without the `-`.
_version=0.14.0
pkgname=wikistow-desktop-bin
pkgver=${_version//-/}
pkgrel=1
pkgdesc="Desktop app for your family's encrypted wiki"
# The app itself is JavaScript; the system Electron it runs on is x86_64 only.
arch=('x86_64')
url="https://github.com/skint007/wikistow"
license=('MIT')
# desktop-file-utils' pacman hook registers the wikistow:// handler, which
# desktops other than GNOME and KDE need for the browser to open the app.
# Signing in opens the browser with xdg-open, optional for electron44.
depends=('electron44' 'desktop-file-utils' 'hicolor-icon-theme' 'xdg-utils')
optdepends=('gnome-keyring: keep the sign-in and a remembered unlock between launches'
            'kwallet: keep the sign-in and a remembered unlock between launches')
provides=('wikistow-desktop')
conflicts=('wikistow-desktop')
source=("https://github.com/skint007/wikistow/releases/download/v$_version/wikistow-desktop-$_version.tar.gz")
sha256sums=('5a4cd2c344e47aca0791e3bdf25a8f7f0c83e7a1d5d155830a3fad1054268b30')

package() {
    cd "wikistow-desktop-$_version"
    install -Dm644 app.asar "$pkgdir/usr/lib/wikistow-desktop/app.asar"
    # How the app was installed, for the app to read (docs/desktop.md).
    echo aur > "$pkgdir/usr/lib/wikistow-desktop/install-source"
    install -Dm755 wikistow-desktop "$pkgdir/usr/bin/wikistow-desktop"
    install -Dm644 wikistow-desktop.desktop "$pkgdir/usr/share/applications/wikistow-desktop.desktop"
    install -Dm644 wikistow-desktop.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/wikistow-desktop.svg"
    install -Dm644 wikistow-desktop.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/wikistow-desktop.png"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
