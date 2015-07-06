# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Ivan Agarkov <ivan.agarkov@gmail.com>
pkgname=jabberd14-git
pkgver=1.6
pkgrel=1
pkgdesc="Jabberd1 package"
arch=('x86_64' 'x86')
url="https://github.com/mawis/jabberd"
license=('GPL2')
depends=('gnutls' 'libtasn1' 'expat' 'pth')
makedepends=('autoconf' 'automake' 'libtool' 'git' 'gcc')
checkdepends=()
optdepends=('libmariadbclient: MySQL support'
'postgresql-libs: PostgreSQL support')
install=("jabberd14.install")
source=("make.patch"
"jabberd14.install"
"jabberd14.service")
md5sums=('47f17906bf2745e83fd184b917d64ae9'
         '60195a06328a1be13b74b7fa920efdd4'
         '8440d95469d3f072c526b934816cc4f8')

prepare() {
	[ -d jabberd ] && rm -rf "$srcdir/jabberd"
	git clone https://github.com/mawis/jabberd
	cd "$srcdir/jabberd/jabberd14"
	git apply "$srcdir/make.patch"
	libtoolize
	aclocal
	autoheader
	automake -a
	autoconf
}

build() {
	cd "$srcdir/jabberd/jabberd14"
	./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
	make
}


package() {
    cd "$srcdir/jabberd/jabberd14"
    make install DESTDIR="$pkgdir"
    mkdir -p "$pkgdir/usr/share/doc/jabberd"
    install -m 0644 -t "$pkgdir/usr/share/doc/jabberd"  UPGRADE jabber.xml.dist.in README.* mysql.sql pgsql_createdb.sql xdb_postgresql.xml cacerts.pem
    mkdir -p "$pkgdir/usr/lib/systemd/system/"
    install -m 0644 "$srcdir/jabberd14.service" "$pkgdir/usr/lib/systemd/system/jabberd14.service"
}
