# Maintainer: skint007 <archlinux.repose742@passmail.net>
#
# The desktop app from a GitHub Release, as CI built and tested it
# (docs/releasing.md). The release workflow sets the maintainer's email,
# _version, pkgrel and the checksum when it publishes this to the AUR; the
# values here are the release this copy was last checked against.

# pacman sorts a prerelease such as 0.3.0rc.1 before 0.3.0 only without the `-`.
_version=0.25.0-beta.1
# The beta channel's wikistow-desktop-beta-bin is this package, renamed and
# with _channel=beta, which the app reads to offer betas (docs/releasing.md).
_channel=beta
# The beta installs beside the stable app under names of its own, so a
# computer can have both: its folder, launcher, launcher entry and icon.
if [[ $_channel == beta ]]; then
    _app=wikistow-desktop-beta
else
    _app=wikistow-desktop
fi
pkgname=wikistow-desktop-beta-bin
pkgver=${_version//-/}
pkgrel=1
pkgdesc="Desktop app for your family's encrypted wiki (beta channel)"
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
provides=("$_app")
conflicts=("$_app")
source=("https://github.com/skint007/wikistow/releases/download/v$_version/wikistow-desktop-$_version.tar.gz")
sha256sums=('6cf0a5c64f4982e3b0bfbebb70b6ddaaa4c927ade26cbbffbe88c98a33e45e67')

package() {
    cd "wikistow-desktop-$_version"
    # The app knows it is the beta from its folder (apps/desktop/src/install.ts).
    install -Dm644 app.asar "$pkgdir/usr/lib/$_app/app.asar"
    # How the app was installed, for the app to read (docs/desktop.md).
    echo aur > "$pkgdir/usr/lib/$_app/install-source"
    echo "$_channel" > "$pkgdir/usr/lib/$_app/channel"
    # One launcher for both, which starts the app its name says.
    install -Dm755 wikistow-desktop "$pkgdir/usr/bin/$_app"
    install -Dm644 "$_app.desktop" "$pkgdir/usr/share/applications/$_app.desktop"
    install -Dm644 "$_app.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_app.svg"
    install -Dm644 "$_app.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$_app.png"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
