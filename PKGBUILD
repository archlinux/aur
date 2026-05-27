pkgbase=waywallen-display
pkgname=(waywallen-display plasma-wallpaper-waywallen)
pkgver=0.2.3
pkgrel=1
arch=(x86_64)
url=https://github.com/waywallen/waywallen-display
license=(MIT)
depends=(libgcc libstdc++ glibc)
makedepends=(cmake vulkan-headers vulkan-icd-loader libglvnd qt6-base qt6-declarative)
source=("$pkgbase-$pkgver.tar.gz::https://github.com/waywallen/waywallen-display/archive/refs/tags/v$pkgver.tar.gz"
        "0001-install-kde-wallpaper-to-correct-path.diff")
sha256sums=('14aec7e5bd54cd600263fe3aa2362bd04cce8b4791b1ec170cb7012dde25da17'
            'bb766cd888b1f004c98127b6b74715958ac38a059c3a8c0c5827dc1fd4965e43')

prepare() {
    cd "$pkgbase-$pkgver"
    patch -Np1 -i ../0001-install-kde-wallpaper-to-correct-path.diff
}

build() {
    cmake -B build -S "$pkgbase-$pkgver" \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DWAYWALLEN_DISPLAY_PLUGIN_QML=ON
    cmake --build build
}

package_waywallen-display() {
    pkgdesc="Desktop integration for the waywallen wallpaper daemon."
    optdepends=('libglvnd: EGL backend'
                'vulkan-icd-loader: Vulkan backend'
                'qt6-base: The qml plugin'
                'qt6-declarative: The qml plugin')
    DESTDIR="$pkgdir" cmake --install build
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
