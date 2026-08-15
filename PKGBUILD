# Maintainer: minerofthesoal <your-email@example.com>
pkgname=revolver-widget-git
_pkgname=revolver-widget
pkgver=r1.0000000
pkgrel=1
pkgdesc="Spinnable 8-chamber revolver desktop widget for illogical-impulse/Quickshell, loaded from your Steam library"
arch=('any')
url="https://github.com/minerofthesoal/revolver-widget"
license=('MIT')
depends=('python' 'bash')
optdepends=(
    'quickshell: required to actually run the widget'
    'quickshell-git: alternative build of quickshell, either works'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$_pkgname"

    # Ship the widget source + installer under /usr/share; it patches a
    # per-user Quickshell config, so it can't be installed system-wide the
    # way a normal package would - the user has to run the installer
    # themselves, as themselves, against their own ~/.config.
    install -d "$pkgdir/usr/share/$_pkgname/bin"
    install -d "$pkgdir/usr/share/$_pkgname/qml"
    install -m755 bin/revolver_scan_steam.py "$pkgdir/usr/share/$_pkgname/bin/"
    install -m755 bin/_patch_background.py "$pkgdir/usr/share/$_pkgname/bin/"
    install -m644 qml/RevolverBarrel.qml "$pkgdir/usr/share/$_pkgname/qml/"
    install -m755 install.sh "$pkgdir/usr/share/$_pkgname/install.sh"

    install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

    # Thin wrapper so `revolver-widget-install` is on $PATH after pacman -S;
    # it just execs the real installer, which resolves bin/ and qml/
    # relative to its own path via BASH_SOURCE.
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/revolver-widget-install" <<'WRAPPER'
#!/usr/bin/env bash
exec "/usr/share/revolver-widget/install.sh" "$@"
WRAPPER
}
