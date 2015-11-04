# Contributor: Aaron Lindsay <aaron@aclindsay.com>
# Maintainer: Edvinas Valatka <edacval@gmail.com>

pkgname=ccnet
pkgver=4.3.4
pkgrel=16
pkgdesc="A framework for writing networked applications in C."
arch=('i686' 'x86_64' 'armv7h' 'armv6h')
url="https://github.com/haiwen/ccnet/"
license=('custom')
depends=('libevent' 'libzdb' 'libsearpc>=3.0.7' 'jansson' 'libldap' 'python2')
makedepends=('vala' 'pacman>=4.1')
options=('!makeflags')

source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/haiwen/${pkgname}/archive/v${pkgver}.tar.gz"
	"https://raw.githubusercontent.com/haiwen/ccnet/master/COPYRIGHT"
	"libccnet.pc.patch"
	"autoconfiguration-for-libjansson.patch")

prepare () {
	cd "$srcdir/$pkgname-$pkgver"
	patch -p1 -i $srcdir/libccnet.pc.patch
	patch -p1 -i $srcdir/autoconfiguration-for-libjansson.patch
}

build () {
	cd "$srcdir/$pkgname-$pkgver"
	./autogen.sh
	CFLAGS="$CFLAGS -lpthread" ./configure --enable-server --enable-ldap --prefix=/usr PYTHON=/usr/bin/python2
	make -j1
}

package () {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
    mkdir -p $pkgdir/usr/share/licenses/$pkgname
    cp COPYRIGHT $pkgdir/usr/share/licenses/$pkgname/
}
sha256sums=('138d6de92388440ce378fc923c50674b80f823e3d2396254dc6c60da5daf2a09'
            'c07aeccf581c255e60acbddcc6af90290e0d6354e6ec0ee1987b82845d3d57ac'
            '66c3b02c3981db6a80819e0ae103bedadf8dfdf81405a7f75a9cba714acf973f'
            '382b1da33e2b6c0ebab8d3921d92b7417fa11d969ad822cd43aee499fd7b3d94')
