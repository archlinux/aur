# Maintainer: Piero Biagini <biagini93@ik.me>
#
# Arch package for the desktop window only. The HTTP service is deliberately not
# installed here: it is meant to run as a long-lived daemon on a NAS, where the
# container image is the right shape, and shipping a systemd unit nobody asked
# for would be maintenance without a user.
#
# pkgver and sha256sums are rewritten by .github/workflows/release.yml when a tag
# is pushed, which is also when it publishes to the AUR. Editing them by hand is
# only for trying the package out locally - see packaging/aur/README.md.

pkgname=kramer-vs44-remote-control
pkgver=0.2.1
pkgrel=1
pkgdesc="Control a Kramer VS-44HN HDMI matrix switcher over TCP/IP or RS-232"
arch=('any')
url="https://github.com/Piero-93/kramer-vs44-remote-control"
license=('GPL-3.0-or-later')
# Nothing is compiled: the package is a handful of modules and a launcher.
# hicolor-icon-theme is required because this installs into that theme's
# hierarchy; namcap reports its absence as an error, and it is right to.
depends=('python' 'tk' 'hicolor-icon-theme')
optdepends=('python-pyserial: RS-232 support, for a serial cable instead of the network')

# namcap reports no errors on this package, and six warnings that are all
# expected. They are listed here so nobody "fixes" them into something worse:
#
#   - 'serial' and 'serial.tools.list_ports' as uninstalled dependencies.
#     pyserial is imported inside a function, behind try/except, and only when a
#     serial port is actually opened. It is an optdepend on purpose; promoting it
#     to depends would pull a package that network users never load.
#   - 'kramer_paths' and 'kramer_vs44' as uninstalled dependencies. They are this
#     package's own modules, sitting next to kramer_gui.py. namcap has no way to
#     know that, and there is nothing to add.
#   - tk "included, but may not be needed". Tkinter loads libtk at runtime rather
#     than linking it, so no static analysis can see the need. Remove tk and the
#     window does not open.
#   - 'python3' and 'sh' as uninstalled dependencies. They come from python and
#     from bash, which is in base; Arch does not list base members explicitly.
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('392006f8288195e6fa39b21800bce9f893716fb4c279f5545af56c0105abb989')

_appid=io.github.piero_93.KramerVS44
_libdir=usr/lib/kramer-vs44

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # The three modules the window needs, side by side. kramer_gui.py imports
    # its siblings by plain name and relies on Python putting the script's own
    # directory first on sys.path, so they must stay in one directory - this is
    # not a Python distribution and there is no package to install.
    install -Dm644 kramer_gui.py   "$pkgdir/$_libdir/kramer_gui.py"
    install -Dm644 kramer_vs44.py  "$pkgdir/$_libdir/kramer_vs44.py"
    install -Dm644 kramer_paths.py "$pkgdir/$_libdir/kramer_paths.py"

    # Read back at runtime through kramer_paths.resource_path() for the window
    # icon, so it has to keep its position relative to the modules.
    install -Dm644 packaging/kramer.png "$pkgdir/$_libdir/packaging/kramer.png"

    # A launcher rather than a shebang on kramer_gui.py: the file stays a plain
    # module that the other two can be imported alongside, and the command a
    # user types is not the same string as the file it happens to run.
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/kramer-gui" <<EOF
#!/bin/sh
exec /usr/bin/python /$_libdir/kramer_gui.py "\$@"
EOF
    chmod 755 "$pkgdir/usr/bin/kramer-gui"

    install -Dm644 "packaging/$_appid.desktop" \
        "$pkgdir/usr/share/applications/$_appid.desktop"

    # Scalable first, because the mark is five rounded rectangles and the SVG is
    # exact at any size. The 256 px raster is there for the environments that
    # still do not read SVG from the icon theme.
    install -Dm644 packaging/kramer.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_appid.svg"
    install -Dm644 packaging/kramer.png \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/$_appid.png"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
