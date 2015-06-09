# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
pkgname=varnish-vmod-dbrw
_archpkgname=${pkgname#varnish-}
pkgver=2.0
_varnishver=$(pacman -Qi varnish|sed -n 's/^Version[ :]*\([0-9].*[0-9]\)-[0-9]$/\1/p')
pkgrel=1
pkgdesc="Database-driven rewrites for Varnish Cache"
arch=('i686' 'x86_64')
url=http://www.gnu.org.ua/software/vmod-dbrw/
license=('GPL3')
depends=('varnish')
makedepends=('varnish' 'libtool' 'pcre')
source=("ftp://download.gnu.org.ua/pub/release/$_archpkgname/$_archpkgname-$pkgver.tar.gz"
#        "ftp://download.gnu.org.ua/pub/release/$_archpkgname/$_archpkgname-$pkgver.tar.gz.sig"
        "http://repo.varnish-cache.org/source/varnish-$_varnishver.tar.gz"
        'configure.ac.patch'

        )
md5sums=('1f7a3dfdf7d8ab3473f7c1b7b22b5564'
#         'SKIP'
         'bf86f3630605c273b1bbadbbe518237a'
         '3138ba8ffafc7d0295aa340c59003a40')

build() {
    cd "$srcdir/$_archpkgname-$pkgver"

    # patch build files to support latest autotools
    patch -p0 -i "$srcdir"/configure.ac.patch

    autoreconf
    ./configure VMODDIR=/usr/lib/varnish/vmods VARNISHSRC=`pwd`/../varnish-$_varnishver --prefix=/usr

    make
}

check() {
    cd "$srcdir/$_archpkgname-$pkgver"

#    varnishtest -D vmod_topbuild=`pwd` tests/*.vtc
    make -k check
}

package() {
    cd "$srcdir/$_archpkgname-$pkgver"

    make DESTDIR="$pkgdir/" install
}
