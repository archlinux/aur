# Maintainer: username227 [gfrank227 [at] gmail [dot] com
# Stable release package built from the unified source archive.

pkgname=viper4linux-re
pkgver=1.1.1
pkgrel=1
pkgdesc='ViPERDSP audio effects for PipeWire with a Qt6 interface'
arch=('x86_64')
url='https://github.com/username227/viper4linux-re'
license=('MIT' 'LicenseRef-ViPERDSP')
depends=('glibc' 'gcc-libs' 'qt6-base' 'pipewire' 'ladspa' 'python')
makedepends=('cmake' 'pkgconf')
conflicts=('viper4linux-re-git' 'viper4linux' 'viper4linux-git')
source=("https://github.com/username227/viper4linux-re/releases/download/v${pkgver}/viper4linux-re-${pkgver}-unified-source.tar.xz")
sha256sums=('03eb8bfb99062de4f54563ebc91354a01cc1dfe8948f29ce57d5c634d059d4be')

build() {
    cmake -S "$srcdir/viper4linux-re-$pkgver" -B "$srcdir/viper4linux-build" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DVIPER_ENABLE_SYSTEM_INSTALL=ON \
        -DVIPER_SYSTEM_INSTALL_LAYOUT=arch

    cmake --build "$srcdir/viper4linux-build"
}

check() {
    cd "$srcdir/${pkgname}-${pkgver}"
    bash tests/check-package.sh
    nm -D "$srcdir/viper4linux-build/viper_dsp_ladspa.so" |
        grep -Eq ' [TW] ladspa_descriptor$'
}

package() {
    DESTDIR="$pkgdir" cmake --install "$srcdir/viper4linux-build"
}
