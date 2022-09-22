# Maintainer: Suavesito-Olimpiada <flyingspaghetti@airmail.cc>
# based on the PKGBUILD of dzen2-git

_pkgname=libtexprintf
pkgname=libtexprintf-git
pkgver=1.14
pkgrel=2
pkgdesc="Formatted Output with tex-like syntax support"
arch=('i686' 'x86_64')
url='https://github.com/bartp5/libtexprintf'
license=('GPL3')
makedepends=(git make gcc)
source=("https://github.com/bartp5/libtexprintf/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz"
        'texfree.patch')
conflicts=(libtexprintf)
provides=('libtexprintf')
sha512sums=('4d2fc0d021749aab5ff7acc3cacb1f636ff9e3be8a275a07ca3c8f90cc6194df76c3ead5cd15b485498bd87f76216e53e91219bee9bae937c986b3c8783a98c9'
            '99d6143676037827122b6c33c565f9f7749050c8b61dcacb72a3b725e46b293b734804bd9f30dbee31752bee0735078750288d68a767a7dc2d5483d738bd3ef2')

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    patch -p1 < "${srcdir}/texfree.patch"
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    ./configure --prefix=/usr --enable-shared=yes --enable-static=no
    make CFLAGS="$(echo ${CFLAGS} | sed 's_-Werror=format-security__')" all -j${nprocs}
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make PREFIX=/usr DESTDIR=${pkgdir} install
    install -Dm644 AUTHORS "${pkgdir}/usr/share/doc/${pkgname}/AUTHORS"
    install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
