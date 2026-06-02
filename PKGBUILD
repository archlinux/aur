# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=taskflow
pkgver=3.10.0
pkgrel=1
pkgdesc='Modern C++ parallel task programming library (header-only)'
arch=('any')
url='https://github.com/taskflow/taskflow'
license=('MIT')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/taskflow/taskflow/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fe86765da417f6ceaa2d232ffac70c9afaeb3dc0816337d39a7c93e39c2dee0b')

build() {
    # Header-only: configure to materialise install rules + the CMake package
    # config; no compilation step is required.
    cmake -S "$pkgname-$pkgver" -B build \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DTF_BUILD_TESTS=OFF \
        -DTF_BUILD_EXAMPLES=OFF \
        -DTF_BUILD_PROFILER=OFF
}

package() {
    DESTDIR="$pkgdir" cmake --install build

    # Taskflow ships a CMake package config but no pkg-config file; provide one so
    # pkgconf/meson-based consumers (e.g. nixl's dependency('taskflow')) discover it.
    install -dm755 "$pkgdir/usr/lib/pkgconfig"
    cat > "$pkgdir/usr/lib/pkgconfig/taskflow.pc" <<PC
prefix=/usr
includedir=\${prefix}/include
Name: taskflow
Description: Modern C++ parallel task programming library (header-only)
Version: $pkgver
Cflags: -I\${includedir}
PC

    install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
