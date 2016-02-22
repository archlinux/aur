# Contributor: Alexej Magura <agm2819*gmail*>
# Contributor: Brit Butler <redline6561@gmail.com>
# Maintainer: Arthur Zamarin <arthurzam@gmail.com>

pkgname=ecl-unicode
_pkgname=ecl
pkgver=15.3.7
_pkgver=15.3
pkgrel=1
pkgdesc="Embeddable Common Lisp (with unicode support)"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/ecls/"
license=('LGPL')
depends=('bash' 'gmp')
makedepends=('texinfo')
provides=('common-lisp' 'ecl' 'cl-asdf')
conflicts=('ecl')
options=('!makeflags')
source=("http://downloads.sourceforge.net/project/${_pkgname}s/${_pkgname}s/${_pkgver}/$_pkgname-${pkgver}.tgz")
sha256sums=('2dc6ffbbf1e0a7b1323d49a991ba1f005127ca3e153651d91ba9e65bdaec948f')
prepare() {
    cd "$srcdir/$_pkgname-$pkgver"
    ./configure --build=$CHOST \
	--prefix=/usr \
	--with-tcp \
	--with-clos-streams \
	--with-serve-event \
	--enable-shared \
	--enable-boehm=included \
	--with-system-gmp \
	--without-x \
	--enable-threads \
	--without-clx \
	--with-asdf \
	--enable-unicode \
	|| rm -rf "$srcdir" # in case configure fails--may not be necessary, though--so that the next time you run 'makepkg' configure won't fail because of 'c/*'.  (Configure fails the 2nd time you run 'makepkg', this will prevent it from failing the 3rd time you run 'makepkg'.)
}

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    sed -i 's|-Wl,--rpath,~A|-Wl,--rpath,/usr/lib/ecl|' "src/configure"
    make
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    make DESTDIR=$pkgdir install
    rm -rf "$srcdir"
}
