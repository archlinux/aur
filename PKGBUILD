pkgbase=waywallen-display
pkgname=(waywallen-display plasma-wallpaper-waywallen gnome-shell-extension-waywallen)
pkgver=0.3.0
pkgrel=1
arch=(x86_64)
url=https://github.com/waywallen/waywallen-display
license=(MIT)
depends=(libgcc libstdc++ glibc)
makedepends=(cmake vulkan-headers vulkan-icd-loader libglvnd qt6-base qt6-declarative glib2 gobject-introspection
             gtk4 cargo)
options=(!lto)
source=("$pkgbase-$pkgver.tar.gz::https://github.com/waywallen/waywallen-display/archive/refs/tags/v$pkgver.tar.gz"
        "0001-cmake-Install-kde-wallpaper-to-correct-path.patch"
        "0002-cmake-Install-gnome-extensions-separately.patch")
sha256sums=('5a5f52ce0a8759d699783e453f1c94e7ccaac4faf94d434256084e98efbf7679'
            '1cfbc0f7388e2be1e9a4385d5d0310fabf28e930ad4c0fc8ff17d82795e98140'
            '5593469af684d71870cc6d41678ac2201879617f0538cc5c947fc990cb057c30')

prepare() {
    cd "$pkgbase-$pkgver"
    patch -Np1 -i ../0001-cmake-Install-kde-wallpaper-to-correct-path.patch
    patch -Np1 -i ../0002-cmake-Install-gnome-extensions-separately.patch
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
    install -Dm644 "$pkgbase-$pkgver/extensions/kde/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_gnome-shell-extension-waywallen() {
    pkgdesc="GNOME extension for waywallen."
    arch=(any)
    depends=(waywallen-display gtk4 graphene dconf gnome-shell)
    DESTDIR="$pkgdir" cmake --install build --component gnome_extension_packaging
    install -Dm644 "$pkgbase-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
