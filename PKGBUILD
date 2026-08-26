# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: zan <zan@nie.rs>

pkgname=vkquake2
_remote=vkQuake2
pkgver=1.5.10
pkgrel=1
pkgdesc="id Software's Quake 2 v3.21 with Vulkan support"
arch=(i686 x86_64)
url="https://github.com/kondrak/vkQuake2"
license=(GPL-2.0-only)
depends=(alsa-lib libxxf86dga xdg-utils opengl-driver vulkan-icd-loader)
makedepends=(vulkan-headers glu) #  cmake ninja
install="$pkgname.install"
source=("https://github.com/kondrak/$_remote/archive/$pkgver.tar.gz"
        'quake2.png'
        'vkquake2.desktop'
        'ref_vk.patch'
        'vkquake2-fix-config-dir.patch')
sha256sums=('0d31dab871684f18dbe0d899d68c9f94133292924aa5bac52c39c38c3488fea0'
            'f7ca0b94414770903248c193a28e4c3e0d25faf31aab53e86001395f5526e4f6'
            '40eadfa9e776531b2d4ca8ba28fa3fd38d04e8bbcc23ac5cc56ebe90ff7ad656'
            '5c373b6cb4a605ccd9357105145780b1507ffc268061e25c22e86afa9690f7c8'
            '094d2d809bd8c681548e9075c11cd4ac6279df7ca2b7511c5dfc5d2c4dfecd7f')
_build=release #unset for debug

_srcdir="$_remote-$pkgver"

prepare() {
    cd "$_srcdir"
    patch -Np1 -i ../ref_vk.patch
    patch -p1 -i ../vkquake2-fix-config-dir.patch
    sed -i \
        -e '/XCFLAGS=/a RELEASE_CFLAGS=$(BASE_CFLAGS) $(CFLAGS) $(LDFLAGS)' \
        -e '/DEBUG_CFLAGS=/d' \
        -e '/XCFLAGS=/a DEBUG_CFLAGS:=$(BASE_CFLAGS) $(DEBUG_CFLAGS) $(DEBUG_LDFLAGS)' \
        -e 's/c++11/c++23/' \
        'linux/Makefile'
}

build() {
    export DEBUG_CFLAGS+=' -D_DEBUG -std=c17'
    export CFLAGS+=' -std=c17'

    cd "$_srcdir/linux"
    make $_build
    #cmake -G Ninja -S "${_srcdir}" -B build -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX=/usr
    #cmake --build build
}

package() {
    if [ "$CARCH" = 'x86_64' ]; then
        _arch=x64
    else
        _arch=i386
    fi

    #DESTDIR="${pkgdir}" cmake --install build

    #cd 'build'
    cd "$srcdir/$_remote-$pkgver/linux/$_build$_arch-glibc"
    for game in baseq2 ctf rogue smd xatrix zaero; do
        install -Dm644 "$game/game$_arch.so" "$pkgdir/opt/$pkgname/$game/game$_arch.so"
    done
    install -dm755 "$pkgdir/usr/bin"
    ln -sf "/opt/$pkgname/quake2" "$pkgdir/usr/bin/$pkgname"
    install -m755 quake2 "$pkgdir/opt/$pkgname/quake2"
    install -m644 ref_glx.so "$pkgdir/opt/$pkgname/ref_glx.so"
    install -m644 ref_vk.so "$pkgdir/opt/$pkgname/ref_vk.so"
    install -Dm644 "$srcdir/$_srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "$srcdir/quake2.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
    install -Dm644 "$srcdir/vkquake2.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
