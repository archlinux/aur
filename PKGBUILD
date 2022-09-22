# Maintainer: Suavesito-Olimpiada <flyingspaghetti@airmail.cc>
# based on the PKGBUILD of dzen2-git

_pkgname=libtexprintf
pkgname=libtexprintf-git
pkgver=1.14
pkgrel=4
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
            '6ac2413fb15728692e8269fb9ebd68dd3c8c03956b3fb45b6835a554095b6caa2efc55fc028bca4193ddf2761b9a00b7e5d889fd01eeb4be1d7bb0f71889eb65')

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
