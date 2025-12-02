# Maintainer: Chris Mounce <christophermounce@gmail.com>

pkgname=decker
pkgver=1.62
# HACK: Version 1.62 was mis-tagged in Git. Remove this variable once versions match tags again.
_pkgver=1.63
pkgrel=1
pkgdesc="Multimedia platform for creating interactive documents"
arch=('x86_64')
url="http://beyondloom.com/decker/"
license=('MIT')
makedepends=('xxd')
depends=('glibc' 'hicolor-icon-theme' 'sdl2' 'sdl2_image')
source=("$pkgname-$pkgver.tar.gz::https://github.com/JohnEarnest/Decker/archive/refs/tags/v$_pkgver.tar.gz")
sha256sums=('b27fa1eac53b3355551b75bc83e012b6240493a7a47ce5e113600d210c76d5f6')

build() {
    cd "$srcdir/Decker-$_pkgver"
    make -j1 EXTRA_FLAGS='-Wl,-z,now,-z,shstk' lilt decker docs
}

package() {
    # Install app itself
    cd "$srcdir/Decker-$_pkgver"
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
