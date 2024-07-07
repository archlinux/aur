# Maintainer: Chris Mounce <christophermounce@gmail.com>

pkgname=decker
pkgver=1.46
pkgrel=1
pkgdesc="Multimedia platform for creating interactive documents"
arch=('x86_64')
url="http://beyondloom.com/decker/"
license=('MIT')
makedepends=('xxd')
depends=('glibc' 'sdl2' 'sdl2_image')
source=("$pkgname-$pkgver.tar.gz::https://github.com/JohnEarnest/Decker/archive/refs/tags/v$pkgver.tar.gz"
        'decker.desktop'
        'application-x-decker.xml')
sha256sums=('c418440fe76b26b1cd4fbe072f76ea2bfc82344a9bf021e4f1e3c4673ef8213a'
            'd03fc6cefd943d5220b187099f8318f79416b4eea757d26f07fcafb2e917202e'
            '8e73659f80d6aefab6bfde799aec504f4406ed279e3c1e2076cc3715f7ee7dfb')

build() {
    cd "$srcdir/Decker-$pkgver"
    make EXTRA_FLAGS='-Wl,-z,now,-z,shstk' decker lilt docs
}

package() {
    cd "$srcdir/Decker-$pkgver"
    DESTDIR="$pkgdir" PREFIX="/usr" make install
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"

    # Install desktop entry with icon
    install -Dm644 "$srcdir/decker.desktop" "$pkgdir/usr/share/applications/decker.desktop"
    install -Dm644 icon_32x32.png "$pkgdir/usr/share/pixmaps/decker.png"

    # Install MIME type
    install -Dm644 "$srcdir/application-x-decker.xml" "$pkgdir/usr/share/mime/packages/application-x-decker.xml"

    # Install docs
    install -Dm644 -t "${pkgdir}/usr/share/doc/decker" docs/*.html
    install -Dm644 -t "${pkgdir}/usr/share/doc/decker/images" docs/images/*
}
