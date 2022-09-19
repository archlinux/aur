# Maintainer: Suavesito-Olimpiada <flyingspaghetti@airmail.cc>
# based on the PKGBUILD of dzen2-git

pkgname=libtexprintf-git
pkgver=1.14.0
pkgrel=1
pkgdesc="Formatted Output with tex-like syntax support"
arch=('i686' 'x86_64')
url='https://github.com/bartp5/libtexprintf'
license=('GPL3')
makedepends=(git make gcc)
source=('libtexprintf::git+https://github.com/bartp5/libtexprintf'
        'texfree.patch')
conflicts=(libtexprintf)
provides=('libtexprintf')
sha256sums=('SKIP'
            '31914dab8c162d07d76dea5117c9495e4594059669945a8dd9fbc8c6bf998cf0')

prepare() {
    cd "$srcdir/libtexprintf"
    patch -p1 < "$srcdir/texfree.patch"
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
