# Maintainer: zan <zan@nie.rs>

pkgname=vkquake2
_remote=vkQuake2
pkgver=1.5.9
pkgrel=1
pkgdesc="id Software's Quake 2 v3.21 with Vulkan support"
arch=(i686 x86_64)
url="https://github.com/kondrak/vkQuake2"
license=(GPL2)
depends=(alsa-lib libxxf86dga xdg-utils opengl-driver)
makedepends=(vulkan-headers)
install="$pkgname.install"
source=("https://github.com/kondrak/$_remote/archive/$pkgver.tar.gz"
        'quake2.png'
        'vkquake2.desktop'
        'ref_vk.patch')
sha256sums=('14faa07bc5b0fe2084d4515220e138a47e23b69ea6b8aa73ba5ea01be14a8588'
            'f7ca0b94414770903248c193a28e4c3e0d25faf31aab53e86001395f5526e4f6'
            '6c7a493f782e8bf4e9b79f0654054207f4d11c36f4cea217dd2295a1297ff27b'
            '5c373b6cb4a605ccd9357105145780b1507ffc268061e25c22e86afa9690f7c8')
_build=release #unset for debug

prepare() {
    cd "$srcdir/$_remote-$pkgver"
    patch -Np1 -i ../ref_vk.patch
}

build() {
    cd "$srcdir/$_remote-$pkgver/linux"
    make $_build
}

package() {
    if [ "$CARCH" = 'x86_64' ]; then
        _arch=x64
    else
        _arch=i386
    fi

    cd "$srcdir/$_remote-$pkgver/linux/$_build$_arch-glibc"
    install -Dm644 "baseq2/game$_arch.so" "$pkgdir/opt/$pkgname/baseq2/game$_arch.so"
    install -m755 quake2 "$pkgdir/opt/$pkgname/quake2"
    install -m644 ref_glx.so "$pkgdir/opt/$pkgname/ref_glx.so"
    install -m644 ref_vk.so "$pkgdir/opt/$pkgname/ref_vk.so"
    install -Dm644 "$srcdir/$_remote-$pkgver/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "$srcdir/quake2.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
    install -Dm644 "$srcdir/vkquake2.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
