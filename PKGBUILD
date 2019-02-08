# Maintainer: Ainola <ainola@archlinux.org>
# Contributor: Ner0
# Contributor: quantax
# Contributor: xyproto

pkgname=ags
pkgver=3.4.3.0
pkgrel=2
pkgdesc='A development tool that is primarily used to create graphical adventure games'
arch=('x86_64')
url='https://github.com/adventuregamestudio/ags'
license=('Artistic2.0')
depends=('dumb-a4' 'libtheora' 'freetype2')
makedepends=('wxgtk')
source=("$pkgname-$pkgver.tar.gz::https://github.com/adventuregamestudio/ags/archive/v.$pkgver.tar.gz"
        'https://github.com/adventuregamestudio/ags/commit/44d954493bb5f3e95a11a4eddbb62bd6110b1b63.patch')
sha256sums=('b32917fda6db9478f6a09c12d9cdb19f0586a9cf21b0f7a98e27b5061cec48a3'
            '6b7092e5794ae532f79c5c6ad5f5761c217b3ec874da43537152fb8e60b20019')

prepare() {
    mv "ags-v.$pkgver" "$pkgname-$pkgver"

    # Copious use of auto_ptr spams the compilation output. Until they're
    # replaced, just suppress the message.
    sed -i 's/-Wfatal-errors/-Wfatal-errors\ -Wno-deprecated-declarations/' \
        "$pkgname-$pkgver/Engine/Makefile-defs.linux"

    # avoid conflicts with glibc functions with the same names
    patch -d "$pkgname-$pkgver" -p1 < "$srcdir/44d954493bb5f3e95a11a4eddbb62bd6110b1b63.patch"
}

build() {
    cd "$pkgname-$pkgver"
    make -C Engine
}

package() {
    install -Dm755 "$pkgname-$pkgver/Engine/ags" -t "$pkgdir/usr/bin/"
}
