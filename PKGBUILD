# Maintainer: Marius Orcsik <marius@habarnam.ro>
pkgname=hitch-git
pkgver=1.4.8.r9.beff3d4
pkgrel=1
pkgdesc="Hitch is a libev-based high performance SSL/TLS proxy."
arch=('x86_64' 'i686')
url="https://hitch-tls.org/"
license=('GPL')
depends=('libev' 'openssl')
makedepends=('git' 'lsof' 'python-docutils')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
    'git+http://git.1wt.eu/git/ebtree.git/'
    'git+https://github.com/varnish/hitch.git'
)
noextract=()
md5sums=(
    'SKIP'
    'SKIP'
)

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
    test -L $srcdir/${pkgname%-git}/src/ebtree || ln -s $srcdir/ebtree/ $srcdir/${pkgname%-git}/src
    cd $srcdir/${pkgname%-git}/src/ebtree && make
	cd "$srcdir/${pkgname%-git}"
	./bootstrap
	./configure \
        --prefix=/usr \
        --sbindir=/usr/bin \
        --enable-sessioncache
    make CFLAGS=-Wno-error=discarded-qualifiers 
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
