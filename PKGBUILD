pkgbase=waywallen-display
pkgname=(waywallen-display plasma-wallpaper-waywallen)
pkgver=0.1.3
pkgrel=1
arch=(x86_64)
url=https://github.com/waywallen/waywallen-display
license=(MIT)
depends=(libgcc libstdc++ glibc qt6-base qt6-declarative)
makedepends=(cmake vulkan-headers vulkan-icd-loader libglvnd glib2 gobject-introspection)
source=("$pkgbase-$pkgver.tar.gz::https://github.com/waywallen/waywallen-display/archive/refs/tags/v$pkgver.tar.gz"
        "0001-install-kde-wallpaper-to-correct-path.diff")
sha256sums=('d1e5cef3b43c82f78317c383848fe8ae6fa8541772cd80621a58c8b5504df953'
            'cce633071ed8aa4fc2f50317dd61a20610a8a25b4160c558f02b7986f8eb2a0f')

prepare() {
    cd "$pkgbase-$pkgver"
    patch -Np1 -i ../0001-install-kde-wallpaper-to-correct-path.diff
}

build() {
    cmake -B build -S "$pkgbase-$pkgver" \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DWAYWALLEN_DISPLAY_PLUGIN_QML=ON \
        -DWAYWALLEN_DISPLAY_PLUGIN_GOBJECT=ON \
        -DWAYWALLEN_DISPLAY_PLUGIN_GNOME=ON
    cmake --build build
}

package_waywallen-display() {
    pkgdesc="Desktop integration for the waywallen wallpaper daemon."
    depends+=(waywallen glib2)
    optdepends=('libglvnd: EGL backend'
                'vulkan-icd-loader: Vulkan backend'
                'gjs: GNOME extension')
    DESTDIR="$pkgdir" cmake --install build
    install -Dm0644 "$pkgbase-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_plasma-wallpaper-waywallen() {
    pkgdesc="Plasma 6 Wallpaper plugin for waywallen."
    depends+=(waywallen kdeclarative libplasma kirigami)
    optdepends=('waywallen-display: System rendering backend')
    DESTDIR="$pkgdir" cmake --install build --component kde_extension
    install -Dm644 "$pkgbase-$pkgver/extensions/kde/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
