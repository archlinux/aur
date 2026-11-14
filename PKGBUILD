# Maintainer: Tarek <tarekdshli@gmail.com>
# Based on the quickshell-git AUR recipe maintained by Entailz.
pkgname=quickshell-dusk-git
pkgver=0.3.2.r16.gd4bb6a3
pkgrel=1
pkgdesc='Quickshell with faster startup through QML scanning and disk-cache optimizations'
arch=(x86_64)
url='https://github.com/totti786/quickshell-dusk'
license=(LGPL-3.0-only GPL-3.0-only)
options=('!strip' '!debug')
depends=(qt6-declarative qt6-base jemalloc qt6-svg libpipewire libxcb wayland libdrm mesa cpptrace polkit)
makedepends=(vulkan-headers spirv-tools qt6-shadertools wayland-protocols cli11 ninja cmake git)
provides=("quickshell=${pkgver%%.r*}")
conflicts=(quickshell)
source=("quickshell::git+$url.git#branch=dusk" quickshell-check.hook)
sha256sums=('SKIP' '8543e21aeaaa5441b73a679160e7601a957f16c433e8d6bd9257e80bd0e94083')

pkgver() {
    cd "$srcdir/quickshell"
    git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
        | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cmake -S "$srcdir/quickshell" -B "$srcdir/build" -G Ninja \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DCMAKE_INSTALL_PREFIX=/usr \
        '-DDISTRIBUTOR=AUR (quickshell-dusk-git)' \
        -DINSTALL_QML_PREFIX=lib/qt6/qml
    cmake --build "$srcdir/build" --parallel "${CMAKE_BUILD_PARALLEL_LEVEL:-2}"
}

package() {
    DESTDIR="$pkgdir" cmake --install "$srcdir/build"
    install -Dm644 "$srcdir/quickshell/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/quickshell/LICENSE-GPL" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-GPL"
    install -Dm644 "$srcdir/quickshell-check.hook" "$pkgdir/usr/share/libalpm/hooks/quickshell-check.hook"
}
