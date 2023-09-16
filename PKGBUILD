# Maintainer: Georg Nagel <g.schlmm at gmail dot com>

pkgname=lighttpd2-git
pkgver=1668.c673e5b
pkgrel=1
pkgdesc="The new Lighty: A small, secure, scalable, flexible webserver"
arch=(i686 x86_64)
url="http://redmine.lighttpd.net/wiki/lighttpd2/"
license=('MIT')
provides=('lighttpd2')
conflicts=('lighttpd2')
depends=("libev" "ragel" "lua51" "zlib" "bzip2" "openssl" "glib2" "libidn" "libunwind")
optdepends=("valgrind: for deep debuggins")
makedepends=("meson" "git")
backup=('etc/lighttpd2/lighttpd.conf' 'etc/lighttpd2/angel.conf' 'etc/lighttpd2/mimetypes.conf')
install=lighttpd2.install
source=("${pkgname}"::"git+https://git.lighttpd.net/lighttpd/lighttpd2.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
	cd $pkgname
}

build() {
	export LUA_LIBS=$(pkg-config --libs lua51)
	export LUA_CFLAGS=$(pkg-config --cflags lua51)
	
	arch-meson build $pkgname --libexecdir=lib/lighttpd-2.0.0 
	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
	install -D -d "$pkgdir/etc/sv/lighttpd2"
	install -D -d "$pkgdir/var/log/lighttpd2"

	cd "${srcdir}/${pkgname}"
	install -D -m0644 contrib/lighttpd.conf "$pkgdir/etc/lighttpd2/lighttpd.conf"
	sed -i -e 's/^docroot "\/var\/www";/docroot "\/srv\/http";/' $pkgdir/etc/lighttpd2/lighttpd.conf
	install -D -m0644 contrib/angel.conf "$pkgdir/etc/lighttpd2/angel.conf"
	install -D -m0644 contrib/mimetypes.conf "$pkgdir/etc/lighttpd2/mimetypes.conf"
	install -D -m0644 contrib/systemd/lighttpd2.service "$pkgdir/usr/lib/systemd/system/lighttpd2.service"
}
