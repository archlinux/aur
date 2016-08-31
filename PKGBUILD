# Maintainer: David Schury <dasc at posteo de>
pkgname=inadyn-fork-git
_pkgname=inadyn
pkgver=2.0.rc1.32.ge91da87
pkgrel=1
pkgdesc='Simple dynamic DNS client - fork of the original INADYN implementation from Narcis Ilisei'
url='http://troglobit.com/inadyn.html'
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
license=('GPL')
depends=('libite' 'confuse>=3.0' 'openssl' 'ca-certificates')
makedepends=('git')
backup=('etc/inadyn.conf')
conflicts=('inadyn-opendns' 'inadyn' 'inadyn-mt' 'inadyn-fork')
provides=('inadyn')
source=("${_pkgname}::git+https://github.com/troglobit/${_pkgname}.git"
        "inadyn.conf"
        "inadyn.service")
sha256sums=('SKIP'
            '1add79028daf20a7f615f5b9d1e17a8850035168c0b14ecf3291d976a106cd2c'
            '58b92152a3133e3a9e236ec915085eef0fbbc4410bca9ac34cae08de761fc7a5')

pkgver() {
	cd "${_pkgname}"
	git describe --tags | sed -e 's|-|.|g' -e 's|^v||'
}

build() {
	cd "${_pkgname}"
	./autogen.sh
	./configure --prefix=/usr --sbindir=/usr/bin --enable-openssl
	make
}

package() {
	cd "${_pkgname}"
	make DESTDIR=$pkgdir install

	install -Dm600 $srcdir/${_pkgname}/examples/dyndns.conf $pkgdir/usr/share/inadyn/examples/dyndns.conf
	install -Dm600 $srcdir/${_pkgname}/examples/freedns.conf $pkgdir/usr/share/inadyn/examples/freedns.conf
	install -Dm600 $srcdir/${_pkgname}/examples/custom.conf $pkgdir/usr/share/inadyn/examples/custom.conf

	install -Dm644 ../inadyn.service $pkgdir/usr/lib/systemd/system/inadyn.service
	install -Dm600 ../inadyn.conf $pkgdir/etc/inadyn.conf
}
