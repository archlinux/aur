# Maintainer: Suavesito-Olimpiada <flyingspaghetti@airmail.cc>
# based on the PKGBUILD of dzen2-git

pkgname=libtexprintf-git
pkgver=1.14.0
pkgrel=2
pkgdesc="Formatted Output with tex-like syntax support"
arch=('i686' 'x86_64')
url='https://github.com/bartp5/libtexprintf'
license=('GPL3')
makedepends=(git make gcc)
source=('https://github.com/bartp5/libtexprintf/releases/download/v1.14/libtexprintf-1.14.tar.gz'
        'texfree.patch')
conflicts=(libtexprintf)
provides=('libtexprintf')
sha256sums=('4d2fc0d021749aab5ff7acc3cacb1f636ff9e3be8a275a07ca3c8f90cc6194df76c3ead5cd15b485498bd87f76216e53e91219bee9bae937c986b3c8783a98c9'
            '9acf7f00413d42942dea21914e6e69e9fb0d08dfebc195239168fbbcf06f92dc057e83bba16218795dadf9a2c78db0be3e9fcb59a7789dcb93a18aaa26a74a97')

prepare() {
    cd "$srcdir/libtexprintf"
    patch -p1 < "$srcdir/texfree.patch"
}

build() {
    cd "$srcdir/libtexprintf"
    ./autogen.sh
    ./configure --prefix=/usr --enable-shared=yes --enable-static=no
    make CFLAGS="$(echo $CFLAGS | sed 's_-Werror=format-security__')" all -j${nprocs}
}

package() {
    cd "$srcdir/libtexprintf"
    make PREFIX=/usr DESTDIR=${pkgdir} install
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 AUTHORS "${pkgdir}/usr/share/doc/${pkgname}/AUTHORS"
    install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
