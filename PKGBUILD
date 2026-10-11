# Maintainer: Chef <joshuaarmenta2008@gmail.com>
#
# Upstream: https://github.com/nat-carbonara/NYx-2-Emulator
#
# NOTE: Upstream publishes no tagged releases, so this is a -git package that
# tracks the 'main' branch.

pkgname=nyx2-emulator-git
pkgver=r16.6f501db
pkgrel=3
pkgdesc="Open-source Nintendo Switch 2 emulator frontend written in Python (PyQt5)"
arch=('any')
url="https://github.com/nat-carbonara/NYx-2-Emulator"
license=('GPL-3.0-or-later')
depends=('python' 'python-pyqt5' 'hicolor-icon-theme')
makedepends=('git' 'patch')
provides=('nyx2-emulator')
conflicts=('nyx2-emulator')
install="$pkgname.install"
source=("${pkgname}::git+https://github.com/nat-carbonara/NYx-2-Emulator.git"
        "nyx2"
        "nyx2-emulator.desktop"
        "nyx2-emulator.svg"
        "xdg-data-dir.patch")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
    cd "$pkgname"
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$pkgname"

    # Upstream resolves its game library (games.json) and cover art
    # (assets/covers) against the current working directory and writes to both
    # at runtime. Redirect those paths to a per-user, writable XDG data
    # directory so the emulator behaves identically however it is launched and
    # never writes into the read-only /usr/share install prefix.
    patch -Np1 -i "$srcdir/xdg-data-dir.patch"
}

package() {
    cd "$pkgname"

    # Application UI (launched as "python3 main.py", so no exec bit needed)
    install -Dm644 main.py "$pkgdir/usr/share/nyx2-emulator/main.py"

    # Empty game library shipped as a default (the user populates it at runtime)
    install -Dm644 games.json "$pkgdir/usr/share/nyx2-emulator/games.json"

    # Documentation / reference material from upstream
    install -Dm644 README.md "$pkgdir/usr/share/doc/nyx2-emulator/README.md"
    install -Dm644 "System Requirment" "$pkgdir/usr/share/doc/nyx2-emulator/System Requirment"
    install -Dm644 main.rs "$pkgdir/usr/share/doc/nyx2-emulator/main.rs"

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/nyx2-emulator/COPYING"

    cd "$srcdir"

    # Launcher
    install -Dm755 nyx2 "$pkgdir/usr/bin/nyx2"

    # Desktop integration
    install -Dm644 nyx2-emulator.desktop "$pkgdir/usr/share/applications/nyx2-emulator.desktop"
    install -Dm644 nyx2-emulator.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/nyx2-emulator.svg"
}
