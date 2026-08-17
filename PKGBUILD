# Maintainer: minerofthesoal <your-email@example.com>
pkgname=hyprland-revolver-git
_pkgname=hyprland-revolver
pkgver=r1.0000000
pkgrel=1
pkgdesc="Spinnable revolver desktop widget for illogical-impulse/Quickshell, loaded from Steam/PrismLauncher/MultiMC"
arch=('any')
url="https://github.com/minerofthesoal/hyprland-revolver"
license=('MIT')
depends=('python' 'bash')
optdepends=(
    'quickshell: required to actually run the widget'
    'quickshell-git: alternative build of quickshell, either works'
    'prismlauncher: to chamber PrismLauncher instances instead of Steam games'
    'multimc: to chamber MultiMC instances instead of Steam games (best-effort - see README)'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')
install=hyprland-revolver-git.install

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
    cp -r bin/revolver_lib "$pkgdir/usr/share/$_pkgname/bin/revolver_lib"
    find "$pkgdir/usr/share/$_pkgname/bin/revolver_lib" -type f -name '*.py' -exec chmod 644 {} \;
    install -m755 bin/revolver-scan "$pkgdir/usr/share/$_pkgname/bin/"
    install -m755 bin/revolver-configure "$pkgdir/usr/share/$_pkgname/bin/"
    install -m755 bin/_patch_background.py "$pkgdir/usr/share/$_pkgname/bin/"
    install -m644 qml/RevolverBarrel.qml "$pkgdir/usr/share/$_pkgname/qml/"
    install -m755 install.sh "$pkgdir/usr/share/$_pkgname/install.sh"

    install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

    # Enabled-by-default systemd --user unit: pacman/makepkg run as root
    # and can only ever stage files under /usr, so they can't run
    # install.sh themselves (it patches your own $HOME as you). This
    # unit is how that last step actually gets to run unattended anyway -
    # as *you*, in *your* systemd --user session, the next time you log
    # in - instead of just telling you to run a command by hand.
    install -Dm644 hyprland-revolver-setup.service \
        "$pkgdir/usr/lib/systemd/user/hyprland-revolver-setup.service"
    install -d "$pkgdir/usr/lib/systemd/user/default.target.wants"
    ln -s ../hyprland-revolver-setup.service \
        "$pkgdir/usr/lib/systemd/user/default.target.wants/hyprland-revolver-setup.service"

    # Thin wrapper so `hyprland-revolver-install` is on $PATH after pacman -S;
    # it just execs the real installer, which resolves bin/ and qml/
    # relative to its own path via BASH_SOURCE.
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/hyprland-revolver-install" <<'WRAPPER'
#!/usr/bin/env bash
exec "/usr/share/hyprland-revolver/install.sh" "$@"
WRAPPER
}
