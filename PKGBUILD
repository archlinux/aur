# Maintainer: Adrian Grzeca <adrian@grzeca.me>

pkgname=data2g
pkgver=0.4.3
pkgrel=1
pkgdesc='HF data modem on the SSTVAE OFDM waveform (VARA-compatible host ports, KISS): host, GUI and tools'
arch=(x86_64 aarch64)
url='https://github.com/arodland/Data2G'
license=(Artistic-2.0 Apache-2.0)
depends=(glibc libgcc libstdc++ hamlib qt6-base qt6-multimedia qt6-websockets zlib)
makedepends=(cmake ninja)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7769338c6c7f6229e3635b4ad96639b9108e42614e52cbe2df91de0146b1e75b')

build() {
    # System Hamlib (the same version upstream pins in native/cmake/hamlib.cmake),
    # no pybind11 module.
    cmake -S Data2G-$pkgver/native -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DDATA2G_BUILD_PYMODULE=OFF \
        -DDATA2G_BUILD_TESTS=OFF \
        -DDATA2G_HAMLIB_SYSTEM=ON \
        -DDATA2G_BUILD_QTAUDIO=ON \
        -DDATA2G_BUILD_HOST=ON \
        -DDATA2G_BUILD_GUI=ON
    cmake --build build
}

package() {
    local p=Data2G-$pkgver/native/packaging png size b

    for b in data2g-host data2g-gui data2g-web data2g-monitor data2g-audio-check data2g-replay data2g-bench-rx; do
        install -Dm755 "build/$b" "$pkgdir/usr/bin/$b"
    done
    # `data2g`, as in upstream's AppImage: the .desktop file's Exec= and the
    # metainfo's <binary> name it. `data2g host ARGS` runs data2g-host.
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/data2g" <<'EOF'
#!/bin/sh
if [ "${1:-}" = host ]; then
    shift
    exec /usr/bin/data2g-host "$@"
fi
exec /usr/bin/data2g-gui "$@"
EOF

    install -Dm644 "$p/org.cleverdomain.data2g.desktop" -t "$pkgdir/usr/share/applications"
    install -Dm644 "$p/org.cleverdomain.data2g.metainfo.xml" -t "$pkgdir/usr/share/metainfo"
    for png in "$p"/icons/data2g-*.png; do
        size=${png##*-}; size=${size%.png}
        install -Dm644 "$png" "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/org.cleverdomain.data2g.png"
    done
    install -Dm644 "$p/data2g.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.cleverdomain.data2g.svg"

    install -Dm644 Data2G-$pkgver/LICENSE Data2G-$pkgver/LICENSE_ion -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 Data2G-$pkgver/README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
