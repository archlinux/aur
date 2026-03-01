# Maintainer: ToRvaLDz <torvalds@github.com>
pkgname=monique
pkgver=0.5.0
pkgrel=1
pkgdesc='MONitor Integrated QUick Editor — graphical monitor configurator for Hyprland and Sway'
arch=('any')
url='https://github.com/ToRvaLDz/monique'
license=('GPL-3.0-or-later')
depends=(
    'python'
    'python-gobject'
    'gtk4'
    'libadwaita'
)
optdepends=(
    'hyprland: Hyprland compositor support'
    'sway: Sway compositor support'
    'sddm: login screen layout sync via Xsetup'
    'polkit: passwordless SDDM Xsetup writes'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/ToRvaLDz/monique/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0631b1c449de4b348ef3c4f44f4674ba9a592f8f6e60b772d2f80d8bf4d8302b')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Desktop entry
    install -Dm644 data/com.github.monique.desktop \
        "$pkgdir/usr/share/applications/com.github.monique.desktop"

    # Systemd user service
    install -Dm644 data/moniqued.service \
        "$pkgdir/usr/lib/systemd/user/moniqued.service"

    # Application icon
    install -Dm644 data/com.github.monique.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.github.monique.svg"

    # Polkit rule for passwordless SDDM Xsetup writes
    install -Dm644 data/com.github.monique.rules \
        "$pkgdir/usr/share/polkit-1/rules.d/60-com.github.monique.rules"

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
