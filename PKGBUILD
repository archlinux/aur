pkgname=hpr
pkgver=0.69
pkgrel=2
pkgdesc="Offline zero-account activity tracker"
arch=('x86_64')
url="https://github.com/plexescor/HPR"
license=('GPL')

_slint_ver="1.16.1"

depends=('glibc' 'dbus' 'curl')
makedepends=('cmake' 'curl' 'tar' 'pkgconf')
install=hpr.install

source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    "Slint-cpp-${_slint_ver}-Linux-x86_64.tar.gz::https://github.com/slint-ui/slint/releases/download/v${_slint_ver}/Slint-cpp-${_slint_ver}-Linux-x86_64.tar.gz"
)
sha256sums=('SKIP' 'SKIP')

prepare() {
    tar -xzf "$srcdir/Slint-cpp-${_slint_ver}-Linux-x86_64.tar.gz" -C "$srcdir/"
}

build() {
    cd "HPR-$pkgver"

    cmake -B build -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_PREFIX_PATH="$srcdir/Slint-cpp-${_slint_ver}-Linux-x86_64"

    cmake --build build -j$(nproc)
}

package() {
    cd "HPR-$pkgver/build"

    install -Dm755 HPR \
        "$pkgdir/usr/bin/hpr"

    install -Dm644 ../assets/logo_256png.png \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/hpr.png"

    install -Dm644 ../LICENSE.txt \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm755 "$srcdir/Slint-cpp-${_slint_ver}-Linux-x86_64/lib/libslint_cpp.so" \
        "$pkgdir/usr/lib/libslint_cpp.so"

    # Default config files
    install -Dm644 ../shippedWithBinary/aliases.csv \
        "$pkgdir/usr/share/hpr/aliases.csv"

    install -Dm644 ../shippedWithBinary/tabAliases.csv \
        "$pkgdir/usr/share/hpr/tabAliases.csv"

    install -Dm644 ../shippedWithBinary/projectAliases.csv \
        "$pkgdir/usr/share/hpr/projectAliases.csv"

    install -Dm644 ../shippedWithBinary/config.csv \
        "$pkgdir/usr/share/hpr/config.csv"

    install -Dm644 ../shippedWithBinary/installWindowCallsExtension.sh \
        "$pkgdir/usr/share/hpr/installWindowCallsExtension.sh"

    # UI + assets
    cp -r ../build/ui \
        "$pkgdir/usr/share/hpr/ui"

    cp -r ../build/assets \
        "$pkgdir/usr/share/hpr/assets"

    install -Dm755 /dev/stdin \
    "$pkgdir/usr/bin/hpr-launcher" << 'EOF'
#!/bin/bash
export HYPRLAND_INSTANCE_SIGNATURE=$(ls /run/user/$(id -u)/hypr/ 2>/dev/null | grep -v lock | head -1)
export XDG_RUNTIME_DIR=/run/user/$(id -u)
export WAYLAND_DISPLAY=wayland-1
exec /usr/bin/hpr-launcher
EOF
}