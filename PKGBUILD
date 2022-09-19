# Maintainer: Suavesito-Olimpiada <flyingspaghetti@airmail.cc>
# based on the PKGBUILD of dzen2-git

pkgname=libtexprintf-git
pkgver=1.12dev
pkgrel=1
pkgdesc="Formatted Output with tex-like syntax support"
arch=('i686' 'x86_64')
url='https://github.com/bartp5/libtexprintf'
license=('GPL3')
makedepends=(git)
source=('libtexprintf::git+https://github.com/bartp5/libtexprintf',
'texfree.diff')
sha512sums=('SKIP'
         'f9e83ad44f48afd271ee081820cb46e246d81f64aae35c7c40f57d50104f1f548c1ad20fde4bd4700465d8c78c6358ca3c6e1ca05a3283b29f83b48b2f584f63')
conflicts=(libtexprintf)
provides=('libtexprintf')

prepare() {
    cd "${srcdir}/libtexprintf"
    patch -p1 < ${srcdir}/texfree.patch
}

build() {
    cd "$srcdir/libtexprintf"
    ./autogen.sh
    ./configure --prefix=/usr --enable-shared=yes --enable-static=yes
    make CFLAGS="$(echo $CFLAGS | sed 's_-Werror=format-security__')" all
}

package() {
    cd "$srcdir/libtexprintf"
    make PREFIX=/usr DESTDIR=${pkgdir} install
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 AUTHORS "${pkgdir}/usr/share/doc/${pkgname}/AUTHORS"
    install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
