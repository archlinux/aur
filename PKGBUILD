pkgbase=waywallen-display
pkgname=(waywallen-display plasma-wallpaper-waywallen)
pkgver=0.1.2
pkgrel=1
arch=(x86_64)
url=https://github.com/waywallen/waywallen-display
license=(MIT)
depends=(libgcc libstdc++ glibc qt6-base qt6-declarative)
makedepends=(cmake vulkan-headers libglvnd)
source=("$pkgname-$pkgver.tar.gz::https://github.com/waywallen/waywallen-display/archive/refs/tags/v$pkgver.tar.gz"
        "0001-install-kde-wallpaper-to-correct-path.diff")
sha256sums=('fed010472d38c477d466a2138742ede90ebcc0ed57adb53e2a9e5cea55212ad2'
            '6485388b5c171f732a7add7f1453c05813a3436573610a93b59738973fa0ec30')

prepare() {
    cd "$pkgbase-$pkgver"
    patch -Np1 -i ../0001-install-kde-wallpaper-to-correct-path.diff
}

build() {
    cmake -B build -S "$pkgbase-$pkgver" \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DWAYWALLEN_DISPLAY_PLUGIN_QML=ON \
        -DWAYWALLEN_DISPLAY_PLUGIN_GOBJECT=OFF
    cmake --build build
}

package_waywallen-display() {
    pkgdesc="Desktop integration for the waywallen wallpaper daemon."
    depends+=(waywallen)
    optdepends=('libglvnd: EGL backend'
                'vulkan-icd-loader: Vulkan backend')
    DESTDIR="$pkgdir" cmake --install build
    install -Dm0644 "$pkgbase-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_plasma-wallpaper-waywallen() {
    pkgdesc="Plasma 6 Wallpaper plugin for waywallen."
    depends+=("waywallen-display=$pkgver" kdeclarative libplasma kirigami)
    DESTDIR="$pkgdir" cmake --install build --component kde_extension
    install -Dm644 "$pkgbase-$pkgver/extensions/kde/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
