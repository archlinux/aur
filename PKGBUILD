# Maintainer: AvianaCruz <gwencroft@proton.me>
# Contributor: Adrià Cereto i Massagué <ssorgatem@gmail.com>
# Contributor: giantdwarf <17hoehbr@gmail.com>

pkgbase=dxvk-async
pkgname=('dxvk-async')
pkgver=1.10.1
pkgrel=2
pkgdesc='A Vulkan-based compatibility layer for Direct3D 9/10/11 which allows running 3D applications on Linux using Wine (Windows DLL)'
url='https://github.com/Sporif/dxvk-async'
license=('zlib/libpng')
arch=('x86_64')
depends=('vulkan-icd-loader')
optdepends=('lib32-vulkan-icd-loader: 32-bit Windows application support')
makedepends=('ninja' 'meson>=0.49' 'glslang' 'mingw-w64-gcc' 'wine')
provides=('dxvk' 'd9vk')
conflicts=('dxvk' 'd9vk')
options=(!strip staticlibs)
source=("dxvk-$pkgver.tar.gz::https://codeload.github.com/doitsujin/dxvk/tar.gz/refs/tags/v$pkgver"
    "$url/raw/$pkgver/dxvk-async.patch")
sha256sums=('ae767e829f9528e889df943a76b34b11dea54f6706af8d625553a83e45a8e9cf'
    'e6f042cdfd1d20d3bad0e5732696d453efde0502beacc3788e2af3568eeacd68')

prepare() {
    rm -rf dxvk
    mv "dxvk-$pkgver" dxvk
    cd dxvk
    patch -p1 -i "${srcdir}/dxvk-async.patch"
}

build() {
    CFLAGS="${CFLAGS/ -fstack-clash-protection/}"
    CXXFLAGS="${CXXFLAGS/ -fstack-clash-protection/}"
    LDFLAGS="${LDFLAGS/,-z,now/}"
    LDFLAGS="${LDFLAGS/,-z,relro/}"
    [[ $CFLAGS == *'-D_FORTIFY_SOURCE=2'* || $CXXFLAGS == *'-D_FORTIFY_SOURCE=2'* ]] && LDFLAGS=' -lssp'

    meson dxvk build/x64 \
        --cross-file dxvk/build-win64.txt \
        --prefix /usr/share/dxvk/x64 \
        --buildtype release \
        --bindir '' --libdir '' \
        --strip \
        -D enable_tests=false
    ninja -C build/x64

    meson dxvk 'build/x32' \
        --cross-file dxvk/build-win32.txt \
        --prefix /usr/share/dxvk/x32 \
        --buildtype release \
        --bindir '' --libdir '' \
        --strip \
        -D enable_tests=false
    ninja -C build/x32
}

package() {
    DESTDIR="$pkgdir" ninja -C build/x32 install
    DESTDIR="$pkgdir" ninja -C build/x64 install
    rm "$pkgdir/usr/share/dxvk/x64"/*.dll.a "$pkgdir/usr/share/dxvk/x32"/*.dll.a
    install dxvk/setup_dxvk.sh -t "$pkgdir/usr/share/dxvk/"
    install -d "$pkgdir/usr/bin"
    ln -s /usr/share/dxvk/setup_dxvk.sh "$pkgdir/usr/bin/setup_dxvk"
}
