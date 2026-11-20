# Maintainer: username227 [gfrank227 [at] gmail [dot] com

pkgname=viper4linux-re
pkgver=1.2.1
pkgrel=1
pkgdesc='ViPERDSP audio effects for PipeWire with a Qt6 interface'
arch=('x86_64')
url='https://github.com/username227/viper4linux-re'
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs' 'qt6-base' 'pipewire' 'ladspa' 'python' 'libx11')
makedepends=('cmake' 'pkgconf' 'git')
conflicts=('viper4linux-re-git' 'viper4linux' 'viper4linux-git')
options=('!debug')
source=("https://github.com/username227/viper4linux-re/releases/download/v${pkgver}/viper4linux-re-${pkgver}-unified-source.tar.xz")
sha256sums=('7b171beec05cf56c0674ab784a8b98c49ee588669aa10508adf949dfbb4ddfe1')

build() {
    local tree="$srcdir/viper4linux-re-$pkgver"
    local built="$srcdir/viper4linux-build"
    cmake -S "$tree" -B "$built" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DVIPER_ENABLE_SYSTEM_INSTALL=ON \
        -DVIPER_SYSTEM_INSTALL_LAYOUT=arch \
        -DVIPER_SYSTEM_PACKAGE_NAME="$pkgname"
    cmake --build "$built"
}

check() {
    ctest --test-dir "$srcdir/viper4linux-build" --output-on-failure --no-tests=error
    nm -D "$srcdir/viper4linux-build/viper_dsp_ladspa.so" | grep -Eq ' [TW] ladspa_descriptor$'
}

package() {
    DESTDIR="$pkgdir" cmake --install "$srcdir/viper4linux-build"
}
