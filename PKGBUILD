# Maintainer: Marius Orcsik <marius@habarnam.ro>
pkgname=hitch-git
pkgver=1.4.8.r1.7d60229
pkgrel=1
pkgdesc="Hitch is a libev-based high performance SSL/TLS proxy."
arch=('x86_64' 'i686')
url="https://hitch-tls.org/"
license=('GPL')
depends=('libev' 'openssl' 'python-docutils')
makedepends=('git' 'lsof')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=
source=('git+https://github.com/varnish/hitch.git')
noextract=()
md5sums=('SKIP')


pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	./bootstrap
	./configure \
        --prefix=/usr \
        --sbindir=/usr/bin
	make
}

check() {
	cd "$srcdir/${pkgname%-git}"
	make -k check
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
    mkdir -p "$pkgdir/usr/lib/systemd/system/"
    cp ../../hitch.service "$pkgdir/usr/lib/systemd/system/"
}
