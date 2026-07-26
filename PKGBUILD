pkgbase=waywallen-display
pkgname=(waywallen-display plasma-wallpaper-waywallen gnome-shell-extension-waywallen)
pkgver=0.2.9
pkgrel=1
arch=(x86_64)
url=https://github.com/waywallen/waywallen-display
license=(MIT)
depends=(libgcc libstdc++ glibc)
makedepends=(cmake vulkan-headers vulkan-icd-loader libglvnd qt6-base qt6-declarative glib2 gobject-introspection
             gtk4 cargo)
options=(!lto)
source=("$pkgbase-$pkgver.tar.gz::https://github.com/waywallen/waywallen-display/archive/refs/tags/v$pkgver.tar.gz"
        "0001-install-kde-wallpaper-to-correct-path.diff"
        "0002-install-gnome-extension-to-correct-path.diff")
sha256sums=('da96113c81de98090f062881c291067d1b8534951f06e13501cb74c68405b8fa'
            'bb766cd888b1f004c98127b6b74715958ac38a059c3a8c0c5827dc1fd4965e43'
            '785c3e354f8922e12fbb15b655b0a7e3f8c834a1fbba0e18f19e4643329796fd')

prepare() {
    cd "$pkgbase-$pkgver"
    patch -Np1 -i ../0001-install-kde-wallpaper-to-correct-path.diff
    patch -Np1 -i ../0002-install-gnome-extension-to-correct-path.diff
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}

build() {
    cmake -B build -S "$pkgbase-$pkgver" \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DWAYWALLEN_DISPLAY_PLUGIN_QML=ON \
        -DWAYWALLEN_DISPLAY_PLUGIN_GOBJECT=ON \
        -DWAYWALLEN_DISPLAY_PLUGIN_GNOME=ON
    cmake --build build
    cd "$pkgbase-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features \
        --package waywallen-display \
        --bin waywallen-layer-shell
}

package_waywallen-display() {
    pkgdesc="Desktop integration for the waywallen wallpaper daemon."
    optdepends=('libglvnd: EGL backend'
                'vulkan-icd-loader: Vulkan backend'
                'qt6-base: The qml plugin'
                'qt6-declarative: The qml plugin'
                'gtk4: The gobject plugin'
                'graphene: The gobject plugin')
    DESTDIR="$pkgdir" cmake --install build
    find "$pkgbase-$pkgver/target/release" -type f -executable -maxdepth 1 \
        -printf "Installing %p...\n" \
        -exec install -Dm0755 -t "$pkgdir/usr/bin" {} +
    install -Dm0644 "$pkgbase-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_plasma-wallpaper-waywallen() {
    pkgdesc="Plasma 6 Wallpaper plugin for waywallen."
    arch=(any)
    depends=(waywallen-display qt6-base qt6-declarative libplasma kirigami plasma-workspace)
    DESTDIR="$pkgdir" cmake --install build --component kde_extension
    rm -r "$pkgdir/usr/share/plasma/wallpapers/org.waywallen.kde/contents/ui/WaywallenDisplayEmbed"
    install -Dm644 "$pkgbase-$pkgver/extensions/kde/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_gnome-shell-extension-waywallen() {
    pkgdesc="GNOME extension for waywallen."
    arch=(any)
    depends=(waywallen-display gtk4 graphene dconf gnome-shell)
    DESTDIR="$pkgdir" cmake --install build --component gnome_extension_packaging
    install -Dm644 "$pkgbase-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
