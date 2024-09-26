# Maintainer: Kef Schecter <furrykef@gmail.com>
# Contributor: Josip Ponjavic <josipponjavic at gmail dot com>
# Uses patches from the Debian Project

pkgname=lincity
pkgver=1.13.1
pkgrel=3
pkgdesc='A free construction and management simulation game'
arch=('x86_64')
url='https://lincity.sourceforge.net/'
license=('GPL-2.0-only')
# namcap will report that libxext may not be needed. It is.
depends=('glibc' 'libpng' 'libx11' 'libxext')
source=("https://deb.debian.org/debian/pool/main/l/$pkgname/${pkgname}_${pkgver}.orig.tar.gz"
        "https://deb.debian.org/debian/pool/main/l/$pkgname/${pkgname}_${pkgver}-16.debian.tar.xz")
sha256sums=('7b4cbd11ffd4cbed79a0aadb25f2b1c34e25a8201182fbb259ce2f450fe5015d'
            '1986e9c7fc2654522e138661fbd4179b5a0ea77e8d84dbd9560799e63eb0dc31')

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

