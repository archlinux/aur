# Maintainer: Ondřej Svoboda <ondrej@svobodasoft.cz>
_pkgname=manatee-open
pkgname=manatee
provides=(manatee)
conflicts=(manatee)
pkgver=2.151.5
pkgrel=1
arch=(x86_64)
url="https://nlp.fi.muni.cz/trac/noske"
pkgdesc="Corpus management tool including corpus building and indexing, fast querying and providing basic statistical measures"
license=(GPL)
depends=(finlib python2 pcre)
# TODO: include the Susanne corpus (in a split manatee-data package)?
source=("http://corpora.fi.muni.cz/noske/src/$_pkgname/$_pkgname-$pkgver.tar.gz"
        "pointer-fix.patch"
        "explicit-python2.patch")
sha256sums=('b7f799574217e6e1c0976105a63e02b03e043836952d1f88fc66961483abb1e0'
            '1b6e279df56873987181638530db2331084a941990d0d824dd3c89fe86892416'
            'f106bd9c65338d8565eb646d0a1b069a055d4cc92469b922d67c0a0d8c390983')

build()
{
    cd "$srcdir/$_pkgname-$pkgver"
    patch -p1 < ../pointer-fix.patch
    patch -p1 < ../explicit-python2.patch
    # TODO: use other ./configure options, such as --with-icu, as seen in the SRCRPM?
    # http://corpora.fi.muni.cz/noske/rpm/centos7/manatee-open/manatee-open-2.151.5-1.el7.centos.src.rpm
    ./configure --prefix=/usr PYTHON=/usr/bin/python2
    # TODO: remove rpaths (just like in finlib)?
    make
}

package()
{
    cd "$srcdir/$_pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
