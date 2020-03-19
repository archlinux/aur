# Maintainer: Zanny <lordzanny@gmail.com>
pkgname=vkquake2
_remote=vkQuake2
pkgver=1.4.4
pkgrel=1
pkgdesc="id Software's Quake 2 v3.21 with Vulkan support"
arch=(i686 x86_64)
url="https://github.com/kondrak/vkQuake2"
license=(GPL2)
depends=(alsa-lib libxxf86dga libxxf86vm xdg-utils vulkan-icd-loader)
makedepends=(vulkan-headers)
install="$pkgname.install"
source=("https://github.com/kondrak/$_remote/archive/$pkgver.tar.gz"
        'quake2.png'
        'vkquake2.desktop')
sha256sums=('47f588cf424e12a1ecaf7dccf1d8001eebc7d6b18a6916aa7f416bab75247999'
            'f7ca0b94414770903248c193a28e4c3e0d25faf31aab53e86001395f5526e4f6'
            '6c7a493f782e8bf4e9b79f0654054207f4d11c36f4cea217dd2295a1297ff27b')
_build=release #unset for debug

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
    install -D -m 644 "baseq2/game$_arch.so" "$pkgdir/opt/$pkgname/baseq2/game$_arch.so"
    install -m 755 quake2 "$pkgdir/opt/$pkgname/quake2"
    install -m 644 ref_glx.so "$pkgdir/opt/$pkgname/ref_glx.so"
    install -m 644 ref_vk.so "$pkgdir/opt/$pkgname/ref_vk.so"
    install -D -m 644 "$srcdir/$_remote-$pkgver/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -D -m 644 "$srcdir/quake2.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
    install -D -m 644 "$srcdir/vkquake2.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
