# Maintainer: Georg Nagel <g.schlmm at gmail dot com>

pkgname=lighttpd2-git
pkgver=1544.b37d95f
pkgrel=1
pkgdesc="The new Lighty: A small, secure, scalable, flexible webserver"
arch=(i686 x86_64)
url="http://redmine.lighttpd.net/wiki/lighttpd2/"
license=('MIT')
provides=('lighttpd2')
conflicts=('lighttpd2')
depends=("libev" "ragel" "lua51" "zlib" "bzip2" "openssl" "glib2")
optdepends=("valgrind: for deep debuggins")
makedepends=("pkg-config" "git")
backup=('etc/lighttpd2/lighttpd.conf' 'etc/lighttpd2/angel.conf' 'etc/lighttpd2/mimetypes.conf')
install=lighttpd2.install
source=("${pkgname}"::"git+https://git.lighttpd.net/lighttpd/lighttpd2.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
	cd "${srcdir}/${pkgname}"
	
	export LUA_LIBS=$(pkg-config --libs lua5.1)
	export LUA_CFLAGS=$(pkg-config --cflags lua5.1)
	
	./autogen.sh
	./configure \
		--prefix=/usr  \
		--sbindir=/usr/bin \
		--libexecdir=/usr/lib/lighttpd-2.0.0 \
		--with-pid-dir=/run \
		--with-lua \
		--with-openssl \
		--with-kerberos5 \
		--with-zlib \
		--with-bzip2 \
		--includedir=/usr/include/lighttpd-2.0.0
	
	make
	sed -i -e 's/^docroot "\/var\/www";/docroot "\/srv\/http";/' contrib/lighttpd.conf
}

package() {
	cd "${srcdir}/${pkgname}"
	make DESTDIR="$pkgdir/" install
	install -D -d "$pkgdir/etc/sv/lighttpd2"
	install -D -d "$pkgdir/var/log/lighttpd2"

	install -D -m0644 contrib/lighttpd.conf "$pkgdir/etc/lighttpd2/lighttpd.conf"
	install -D -m0644 contrib/angel.conf "$pkgdir/etc/lighttpd2/angel.conf"
	install -D -m0644 contrib/mimetypes.conf "$pkgdir/etc/lighttpd2/mimetypes.conf"
	install -D -m0644 contrib/systemd/lighttpd2.service "$pkgdir/usr/lib/systemd/system/lighttpd2.service"
}
