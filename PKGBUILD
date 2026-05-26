pkgbase=waywallen-display
pkgname=(waywallen-display plasma-wallpaper-waywallen)
pkgver=0.2.2
pkgrel=1
arch=(x86_64)
url=https://github.com/waywallen/waywallen-display
license=(MIT)
depends=(libgcc libstdc++ glibc qt6-base qt6-declarative)
makedepends=(cmake vulkan-headers vulkan-icd-loader libglvnd glib2 gobject-introspection)
source=("$pkgbase-$pkgver.tar.gz::https://github.com/waywallen/waywallen-display/archive/refs/tags/v$pkgver.tar.gz"
        "0001-install-kde-wallpaper-to-correct-path.diff")
sha256sums=('eb3796a8a749a192e566c1432b69f2e3ee04452e8bb0bfbc0bcc5550f3a17883'
            'bb766cd888b1f004c98127b6b74715958ac38a059c3a8c0c5827dc1fd4965e43')

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
        -DWAYWALLEN_DISPLAY_PLUGIN_GNOME=ON \
        -DWAYWALLEN_DISPLAY_QML_URI=Waywallen.DisplayEmbed
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
    depends+=(waywallen libplasma kirigami plasma-workspace)
    optdepends=('waywallen-display: System rendering backend')
    DESTDIR="$pkgdir" cmake --install build --component kde_extension
    install -Dm644 "$pkgbase-$pkgver/extensions/kde/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
