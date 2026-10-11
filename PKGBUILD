# Maintainer: Chef <joshuaarmenta2008@gmail.com>
#
# Upstream: https://github.com/nat-carbonara/NYx-2-Emulator
#
# NOTE: Upstream publishes no tagged releases, so this is a -git package that
# tracks the 'main' branch.

pkgname=nyx2-emulator-git
pkgver=r16.6f501db
pkgrel=2
pkgdesc="Open-source Nintendo Switch 2 emulator frontend written in Python (PyQt5)"
arch=('any')
url="https://github.com/nat-carbonara/NYx-2-Emulator"
license=('GPL-3.0-or-later')
depends=('python' 'python-pyqt5' 'hicolor-icon-theme')
makedepends=('git')
provides=('nyx2-emulator')
conflicts=('nyx2-emulator')
install="$pkgname.install"
source=("${pkgname}::git+https://github.com/nat-carbonara/NYx-2-Emulator.git"
        "nyx2"
        "nyx2-emulator.desktop"
        "nyx2-emulator.svg")
sha256sums=('SKIP'
            '6a6b48d318cdd40d7e1cd8f4ec173baca552fbaa157ca46d0b8be12e98275c11'
            'a33b4dc8cfb77850693ab15e067da8ce84cda849565bb6ae3476b2f66a95665c'
            '230135188aad33f31c04fb4e285c6d6305d84d0d196318b8ceb76f8baf9ca3fc')

pkgver() {
    cd "$pkgname"
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$pkgname"

    # Application UI
    install -Dm755 main.py "$pkgdir/usr/share/nyx2-emulator/main.py"

    # Empty game library shipped as a default (the user populates it at runtime)
    install -Dm644 games.json "$pkgdir/usr/share/nyx2-emulator/games.json"

    # Documentation / reference material from upstream
    install -Dm644 README.md "$pkgdir/usr/share/doc/nyx2-emulator/README.md"
    install -Dm644 "System Requirment" "$pkgdir/usr/share/doc/nyx2-emulator/System Requirment"
    install -Dm644 main.rs "$pkgdir/usr/share/doc/nyx2-emulator/main.rs"

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/nyx2-emulator/COPYING"

    cd "$srcdir"

    # Launcher (provisions a per-user writable data dir, then runs the UI)
    install -Dm755 nyx2 "$pkgdir/usr/bin/nyx2"

    # Desktop integration
    install -Dm644 nyx2-emulator.desktop "$pkgdir/usr/share/applications/nyx2-emulator.desktop"
    install -Dm644 nyx2-emulator.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/nyx2-emulator.svg"
}
