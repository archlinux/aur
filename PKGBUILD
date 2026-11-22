# Maintainer: Taxin <taxin404@duck.com>

pkgname=bongo
pkgver=1.2.1
pkgrel=2
pkgdesc="Bangla phonetic input method with native fcitx5 and IBus frontends"
arch=('x86_64' 'aarch64')
url="https://github.com/mehedishakeel/Bongo"
license=('MPL-2.0')
depends=('fcitx5' 'fcitx5-configtool' 'gtk4' 'hicolor-icon-theme' 'python' 'python-gobject')
makedepends=('cargo' 'cmake' 'fcitx5' 'ninja' 'pkgconf')
optdepends=(
    'ibus: IBus engine (GNOME)'
)
provides=('fcitx5-bongo' 'ibus-bongo')
conflicts=('bongo-bin' 'bongo-git')
options=('!debug')
install=bongo.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        'bongo-input-settings.patch'
        'bongo-converter-path.patch'
        'bongo-gtk4-label-wrap.patch')
sha256sums=('8c22962e391d60d071bf7b4976ec28495b2d302b2566b5ddde68faf2c4596c89'
            '23c44411c726978bbd56626df1295c9e7cb00069fb204d1029fcdb48992a443d'
            '12bd34e75816b03264effeee2dfc9acbecfa600b55291a73d4cd080462c43417'
            'c6627a673d41f93a26cf4a3b7c704aafa126a3b62b547fbfdd2a9ee93dd6439e')

prepare() {
    cd "Bongo-$pkgver"
    # Downstream fix for "Open Input Settings..." opening the file manager on
    # Omarchy/Hyprland. Drop this patch once upstream ships it.
    # Upstream: https://github.com/mehedishakeel/Bongo/pull/19
    patch -Np1 -i "$srcdir/bongo-input-settings.patch"
    # Upstream's installer never ships platforms/common/converter.py, so the
    # settings app's Bijoy/Unicode converters and the IBus engine's sandhi
    # handling silently fall back to no-op stubs. Look in /usr/share/bongo
    # as well. Drop this patch once upstream installs the module itself.
    patch -Np1 -i "$srcdir/bongo-converter-path.patch"
    # Upstream 1.2.1 calls the GTK3-only Gtk.Label.set_line_wrap() in the new
    # converters tab, so bongo-settings dies on startup with GTK4:
    #   AttributeError: 'Label' object has no attribute 'set_line_wrap'
    # Use set_wrap() on GTK4. Drop this patch once upstream ships it.
    patch -Np1 -i "$srcdir/bongo-gtk4-label-wrap.patch"
}

build() {
    cd "Bongo-$pkgver/platforms/linux/engine"
    export RUSTUP_TOOLCHAIN=stable
    cargo build --release --frozen
}

package() {
    cd "Bongo-$pkgver"

    DESTDIR="$pkgdir" PREFIX=/usr BONGO_FCITX5=1 \
        bash platforms/linux/scripts/install.sh

    # See bongo-converter-path.patch.
    install -Dm644 platforms/common/converter.py \
        "$pkgdir/usr/share/bongo/converter.py"

    install -Dm644 LICENSE THIRD_PARTY_NOTICES.md licenses/MPL-2.0.txt \
        -t "$pkgdir/usr/share/licenses/$pkgname/"
}
