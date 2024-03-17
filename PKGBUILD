# Maintainer: Kef Schecter <furrykef@gmail.com>
# Contributor: Josip Ponjavic <josipponjavic at gmail dot com>
# Uses patches from the Debian Project

pkgname=lincity
pkgver=1.13.1
pkgrel=2
pkgdesc='A free construction and management simulation game'
arch=('x86_64')
url='https://lincity.sourceforge.net/'
license=('GPL-2.0-only')
depends=('glibc' 'libpng' 'libx11' 'libxext')
source=("https://deb.debian.org/debian/pool/main/l/$pkgname/${pkgname}_${pkgver}.orig.tar.gz"
        "https://deb.debian.org/debian/pool/main/l/$pkgname/${pkgname}_${pkgver}-15.debian.tar.xz")
sha256sums=('7b4cbd11ffd4cbed79a0aadb25f2b1c34e25a8201182fbb259ce2f450fe5015d'
            'b7af3eb3bdcc8ad5402237c5f629c74a6d0c5e7c0e98cfb527e7a23436287f25')

prepare() {
    cd "$pkgname-$pkgver"
    for i in $(grep -v '#' $srcdir/debian/patches/series); do
        patch -p1 -i "$srcdir/debian/patches/${i}"
    done
}

build() {
    cd "${pkgname}-${pkgver}"
    autoreconf -fi
    ./configure \
        --prefix=/usr \
        --bindir=/usr/bin \
        --mandir=/usr/share/man \
        --with-gzip \
        --with-x- \
        --without-svga \
        --disable-rpath
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make install DESTDIR="${pkgdir}"
    install -Dm755 xlincity "$pkgdir/usr/bin/xlincity"
    ln -sf /usr/bin/xlincity "$pkgdir/usr/bin/lincity"
    ln -sf /usr/share/man/man6/lincity.6.gz "$pkgdir/usr/share/man/man6/xlincity.6.gz"
    install -Dm644 ../debian/lincity.xpm "$pkgdir/usr/share/pixmaps/lincity.xpm"
    install -Dm644 ../debian/lincity.desktop "$pkgdir/usr/share/applications/lincity.desktop"
    sed -i 's|usr/games|usr/bin|' "$pkgdir/usr/share/applications/lincity.desktop"
}

