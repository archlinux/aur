# Maintainer: Chris Mounce <christophermounce@gmail.com>

pkgname=decker
pkgver=1.60
pkgrel=1
pkgdesc="Multimedia platform for creating interactive documents"
arch=('x86_64')
url="http://beyondloom.com/decker/"
license=('MIT')
makedepends=('xxd')
depends=('glibc' 'hicolor-icon-theme' 'sdl2' 'sdl2_image')
source=("$pkgname-$pkgver.tar.gz::https://github.com/JohnEarnest/Decker/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3c18ac98128eba9571ae8d416ed07fde84778aaa9bbb7a21aa94a5b303eaba3e')

build() {
    cd "$srcdir/Decker-$pkgver"
    make -j1 EXTRA_FLAGS='-Wl,-z,now,-z,shstk' lilt decker docs
}

package() {
    # Install app itself
    cd "$srcdir/Decker-$pkgver"
    DESTDIR="$pkgdir" PREFIX="/usr" make install
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"

    # Install desktop entry and icons
    install -Dm644 Decker.desktop "$pkgdir/usr/share/applications/Decker.desktop"
    for DIM in 32 64 128 192 256 512; do
        install -Dm644 "icon_${DIM}x${DIM}.png" "$pkgdir/usr/share/icons/hicolor/${DIM}x${DIM}/apps/decker.png"
    done

    # Install MIME type
    install -Dm644 x-decker.xml "$pkgdir/usr/share/mime/packages/application-x-decker.xml"

    # Install docs
    install -Dm644 -t "${pkgdir}/usr/share/doc/decker" docs/*.html
    install -Dm644 -t "${pkgdir}/usr/share/doc/decker/images" docs/images/*
}
