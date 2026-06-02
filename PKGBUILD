# Maintainer: Piotr Balwierz <github.com/balwierz>
# Upstream: Bartosz Taudul <wolf@nereid.pl>  https://github.com/wolfpld/moderncore
#
# Rehomes the abandoned, mis-named AUR `vv` package: upstream renamed the
# project to "moderncore" and now ships TWO viewers — `vv` (terminal, with
# the Kitty graphics / sixel protocols) and `iv` (Wayland, HDR). Carries a
# small patch adding missing <unistd.h>/<mutex> includes so it builds on
# current toolchains (gcc 16 no longer pulls them in transitively).
pkgname=moderncore
pkgver=20260308
pkgrel=1
pkgdesc="Terminal (vv) and Wayland/HDR (mcore-iv) image viewers with broad codec support"
arch=('x86_64')   # requires AVX2 + FMA (x86-64-v3)
url="https://github.com/wolfpld/moderncore"
license=('BSD-3-Clause')
depends=('cairo' 'lcms2' 'libexif' 'libheif' 'libjpeg-turbo' 'libjxl' 'lz4'
         'libpng' 'libraw' 'librsvg' 'libsixel' 'libtiff' 'libwebp' 'openexr'
         'pugixml' 'zlib' 'vulkan-icd-loader' 'wayland' 'libxkbcommon')
makedepends=('cmake' 'ninja' 'python' 'shaderc' 'vulkan-headers' 'wayland-protocols' 'catch2')
optdepends=('poppler-glib: PDF viewing')
# Both this package and our data viewer (AUR `vv`) install /usr/bin/vv; they
# can't be co-installed. Declared so pacman reports it cleanly.
conflicts=('vv')
source=("$pkgname-$pkgver.tar.gz::https://github.com/wolfpld/moderncore/archive/refs/tags/$pkgver.tar.gz"
        "gcc16-missing-includes.patch")
sha256sums=('625ec1bdcf060aca95d3adc66ac13c09de7c5882589b5c8b0c4eb8b873529f73'
            'a57987f8c4fa2d5ef307f435f6ca8c9d75a26250d651bee452b80c1aa56e2d0b')

prepare() {
    cd "$pkgname-$pkgver"
    patch -p1 < "$srcdir/gcc16-missing-includes.patch"
}

build() {
    cd "$pkgname-$pkgver"
    # MARCH_NATIVE=OFF for a portable package; x86-64-v3 satisfies the
    # project's AVX2 + FMA requirement.
    cmake -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DMARCH_NATIVE=OFF \
        -DCMAKE_CXX_FLAGS="-march=x86-64-v3" \
        -DBUILD_IV=ON \
        -DBUILD_MCORE=OFF
    # The 20260308 tag builds its Catch2 unit tests unconditionally (the
    # BUILD_TESTS toggle came later); they compile but aren't installed.
    cmake --build build
}

package() {
    cd "$pkgname-$pkgver"
    DESTDIR="$pkgdir" cmake --install build

    # OpenImageIO (pulled in by blender / usd / OSL) already owns
    # /usr/bin/iv. Install moderncore's Wayland viewer as `mcore-iv` so the
    # two coexist, and point its desktop entry at the renamed binary.
    mv "$pkgdir/usr/bin/iv" "$pkgdir/usr/bin/mcore-iv"
    if [ -f "$pkgdir/usr/share/applications/iv.desktop" ]; then
        sed -i 's/^Exec=iv\b/Exec=mcore-iv/' \
            "$pkgdir/usr/share/applications/iv.desktop"
        mv "$pkgdir/usr/share/applications/iv.desktop" \
           "$pkgdir/usr/share/applications/mcore-iv.desktop"
    fi

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
