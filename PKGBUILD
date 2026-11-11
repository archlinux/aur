# Maintainer: Taxin <taxin404@duck.com>

pkgname=bongo
pkgver=1.2.0
pkgrel=1
pkgdesc="Bangla phonetic input method with native fcitx5 and IBus frontends"
arch=('x86_64' 'aarch64')
url="https://github.com/mehedishakeel/Bongo"
license=('MPL-2.0')
depends=('gtk4' 'hicolor-icon-theme' 'python' 'python-gobject')
makedepends=('cargo' 'cmake' 'fcitx5' 'ninja' 'pkgconf')
optdepends=(
    'fcitx5: native fcitx5 addon (KDE Plasma, Hyprland, Omarchy, Sway)'
    'fcitx5-configtool: add Bongo to the fcitx5 input method list'
    'ibus: IBus engine (GNOME)'
)
provides=('fcitx5-bongo' 'ibus-bongo')
conflicts=('bongo-bin' 'bongo-git')
options=('!debug')
install=bongo.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1ee78bd0a2f26a2a8523359446d74228b422bede2cb0fe2f6b1be59ba624f342')

build() {
    cd "Bongo-$pkgver/platforms/linux/engine"
    export RUSTUP_TOOLCHAIN=stable
    cargo build --release --frozen
}

package() {
    cd "Bongo-$pkgver"

    DESTDIR="$pkgdir" PREFIX=/usr BONGO_FCITX5=1 \
        bash platforms/linux/scripts/install.sh

    install -Dm644 LICENSE THIRD_PARTY_NOTICES.md licenses/MPL-2.0.txt \
        -t "$pkgdir/usr/share/licenses/$pkgname/"
}
