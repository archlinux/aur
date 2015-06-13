# Contributor: Nathan Owe. <ndowens.aur at gmail dot com>

# Heavily inspired from Peter Pramberger's RHEL RPM
# http://www.pramberger.at/peter/services/repository/

pkgname=frox
pkgver=0.7.18
pkgrel=5
pkgdesc="A transparent ftp proxy that optionally supports caching"
arch=('i686' 'x86_64')
url="http://$pkgname.sourceforge.net/"
license=('GPL2')
backup=("etc/$pkgname.conf")
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz"
        "$pkgname.service"
        "$pkgname-$pkgver-clientdata_socket.patch"
        "$pkgname.conf.patch")
md5sums=('d4ba3a22db472922c71b0e63ca64b10b'
         '022f05592f19e05895fa36541fb9b514'
         '4f69c821c75d870837baa7f4d0af75a7'
         '774646b5c80f1b22be6c3f48e130c5df')

build() {
	cd "$pkgname-$pkgver"

	# Client active mode source address fix
	patch -p1 < "$srcdir/$pkgname-$pkgver-clientdata_socket.patch"
	# Default config file fixes
	patch -p1 < "$srcdir/$pkgname.conf.patch"

	./configure --prefix=/usr                              \
	            --sbindir=/usr/bin                         \
	            --enable-ipfilter                          \
	            --enable-http-cache                        \
	            --enable-local-cache                       \
	            --enable-virus-scan                        \
	            --enable-ssl                               \
	            --enable-ccp                               \
	            --enable-procname                          \
	            --enable-configfile="/etc/$pkgname.conf"

	make
}

package() {
	cd "$pkgname-$pkgver"

	make install DESTDIR="$pkgdir"

	local _cachedir="/var/cache/$pkgname"
	install -dm755 -odaemon -gdaemon       "$pkgdir$_cachedir"

	local _mandir='/usr/share/man'
	install -Dm644 "doc/$pkgname.conf.man" "$pkgdir$_mandir/man5/$pkgname.conf.5"
	install -Dm644 "doc/$pkgname.man"      "$pkgdir$_mandir/man8/$pkgname.8"
	install -Dm644 "src/$pkgname.conf"     "$pkgdir/etc/$pkgname.conf"

	local _unitdir='/usr/lib/systemd/system'
	install -Dm644 {"$srcdir","$pkgdir/$_unitdir"}/$pkgname.service
}

# vim: set ft=sh ts=4 sw=4 noet:
