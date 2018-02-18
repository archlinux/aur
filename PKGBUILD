# Maintainer: ponsfoot <cabezon dot hashimoto at gmail dot com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=uim-debian
pkgver=1.8.6+gh20180114.64e3173
_debrel=2
pkgrel=2
pkgdesc='Multilingual input method library with Debian patches (supports gtk3 and qt5)'
url='https://packages.debian.org/sid/uim'
license=('custom:BSD')
arch=('i686' 'x86_64')
depends=('libxft' 'libedit' 'm17n-lib')
makedepends=('intltool' 'gettext' 'gtk2' 'gtk3' 'qt4' 'qt5-base' 'qt5-x11extras' 'anthy')
optdepends=('qt4: immodule and helper applications'
            'qt5-base: immodule and helper applications'
            'gtk2: immodule and helper applications'
            'gtk3: immodule and helper applications')
conflicts=('uim')
provides=('uim')
install=${pkgname}.install
source=("http://http.debian.net/debian/pool/main/u/uim/uim_${pkgver}.orig.tar.gz"
        "http://http.debian.net/debian/pool/main/u/uim/uim_${pkgver}-${_debrel}.debian.tar.xz"
       qt5-qt4-coexist.patch)
sha256sums=('23329075e897019dd326b3ece47723c2b158d79a5117be67c3ff3d00104084c5'
            '6cac3021df31453de62b288afa58b814086c4942c6a8870162aa86f28d319842'
            'a3511837b8fc827e3ff79defff6480fc6b3a4ac031bde478bfd5d6c1b77acfdd')

prepare() {
    cd "${srcdir}/uim-${pkgver}"

    while read p; do

      patch -p1 -i "${srcdir}/debian/patches/${p}"

    done < "${srcdir}/debian/patches/series"

    patch -p1 -i "${srcdir}/qt5-qt4-coexist.patch"

}

build() {
    cd "${srcdir}/uim-${pkgver}"

    export QT_SELECT=qt5

    ./configure \
        --disable-rpath \
        --prefix=/usr \
        --libexecdir=/usr/lib/uim \
        --with-anthy-utf8 \
        --with-gtk \
        --with-gtk3 \
        --with-qt4 \
        --with-qt4-immodule \
        --with-qt5 \
        --with-qt5-immodule

    make
}

package() {
    cd "${srcdir}/uim-${pkgver}"
    make DESTDIR="${pkgdir}" install -j1 # FS#41112
    install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
    install -Dm644 "${srcdir}/debian/copyright" \
            "${pkgdir}/usr/share/licenses/${pkgname}/debian/copyright"
}
