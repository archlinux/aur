# Maintainer: appvol contributors <noreply@github.com>
#
# Two packages from one source: the daemon and the CLI need neither Qt nor a
# display, while the window pulls PySide6 and (with it) a few hundred megabytes.
# Splitting them keeps a headless or minimal install small.
pkgbase=appvol
pkgname=('appvol' 'appvol-gui')
pkgver=0.7.2
pkgrel=1
arch=('any')
url="https://github.com/YaBulochka/appvol"
license=('MIT')

# The upstream release archive, built with `git archive` from the v$pkgver tag.
# The upstream tree also carries packaging/PKGBUILD, which is kept in sync with
# this file by hand.
source=("$url/releases/download/v$pkgver/$pkgbase-$pkgver.tar.gz")
sha256sums=('b8656a1328dfa8082850294263ddfef82efa4ada4cb8f84066d43243c98db710')

# $srcdir is only set once makepkg starts a package function, so the unpacked
# tree can not be named at the top of the file.
_site() {
    python -c 'import sys; print("lib/python{}.{}/site-packages".format(*sys.version_info[:2]))'
}

package_appvol() {
    pkgdesc="Volume control for the audio streams of the focused window (KDE Plasma 6 on Wayland)"
    depends=('python' 'python-dbus' 'python-gobject' 'python-pulsectl')
    optdepends=(
        'plasma-desktop: the Plasma session the daemon drives (KWin script, OSD, shortcuts)'
        'kwin: loads the script that reports the focused window'
        'kglobalacceld: binds the hotkeys in System Settings -> Shortcuts'
        'pipewire-pulse: the audio server the daemon talks to'
        'appvol-gui: the window for the profiles'
    )
    install=appvol.install

    cd "$srcdir/$pkgbase-$pkgver"

    local site
    site="$(_site)"

    install -d "$pkgdir/usr/$site/appvol"
    install -m644 appvol/*.py "$pkgdir/usr/$site/appvol/"

    # The daemon looks for the KWin script in the XDG data dirs as well, which is
    # where a package install keeps it.
    install -Dm644 kwin/appvol.js "$pkgdir/usr/share/appvol/appvol.js"

    # Launchers: the module is already importable, so no path discovery is needed.
    install -d "$pkgdir/usr/bin"
    printf '#!/bin/sh\nexec python3 -m appvol.cli "$@"\n' >"$pkgdir/usr/bin/appvol"
    printf '#!/bin/sh\nexec python3 -m appvol.daemon "$@"\n' >"$pkgdir/usr/bin/appvold"
    chmod 755 "$pkgdir/usr/bin/appvol" "$pkgdir/usr/bin/appvold"

    # The unit gets absolute paths: systemd does not read the user's PATH at all,
    # and the shortcut server only lives in the session.
    install -d "$pkgdir/usr/lib/systemd/user"
    sed 's|@APPVOLD@|/usr/bin/appvold|' systemd/appvold.service.in \
        >"$pkgdir/usr/lib/systemd/user/appvold.service"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -d "$pkgdir/usr/share/doc/$pkgname/docs"
    install -m644 docs/*.md "$pkgdir/usr/share/doc/$pkgname/docs/"
}

package_appvol-gui() {
    pkgdesc="Qt-based configurator for appvol (PySide6 and Kirigami)"
    depends=('appvol' 'pyside6' 'kirigami' 'qqc2-desktop-style' 'breeze-icons')
    optdepends=('plasma-desktop: the desktop whose shortcut dialog the window opens')

    cd "$srcdir/$pkgbase-$pkgver"

    local site
    site="$(_site)"

    # The QML files sit next to the Python ones: the window loads them from the
    # filesystem, so no Qt resource compilation is needed.
    install -d "$pkgdir/usr/$site/appvol/gui/qml"
    install -m644 appvol/gui/*.py "$pkgdir/usr/$site/appvol/gui/"
    install -m644 appvol/gui/qml/*.qml "$pkgdir/usr/$site/appvol/gui/qml/"

    install -d "$pkgdir/usr/bin"
    printf '#!/bin/sh\nexec python3 -m appvol.gui "$@"\n' >"$pkgdir/usr/bin/appvol-gui"
    chmod 755 "$pkgdir/usr/bin/appvol-gui"

    install -d "$pkgdir/usr/share/applications"
    sed 's|@APPVOL_GUI@|/usr/bin/appvol-gui|g' desktop/org.appvol.gui.desktop.in \
        >"$pkgdir/usr/share/applications/org.appvol.gui.desktop"

    # The app icon the entry names.  The hicolor cache is refreshed by the
    # gtk-update-icon-cache pacman hook, so nothing extra is needed here.
    install -Dm644 desktop/icons/hicolor/scalable/apps/appvol.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/appvol.svg"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
