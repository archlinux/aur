# Contributor: Nathan Owe. <ndowens.aur at gmail dot com>

# Heavily inspired from Peter Pramberger's RHEL RPM
# http://www.pramberger.at/peter/services/repository/

pkgname=frox
pkgver=0.7.18
pkgrel=6
pkgdesc="A transparent ftp proxy that optionally supports caching"
arch=('i686' 'x86_64')
url="http://$pkgname.sourceforge.net/"
license=('GPL2')
depends=('openssl')
backup=("etc/$pkgname.conf")
source=("https://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz"
        "$pkgname.service"
        "$pkgname.sysusers"
        "$pkgname.tmpfiles"
        "$pkgname-$pkgver-clientdata_socket.patch"
        "$pkgname.conf.patch")
sha256sums=('7586b96cc044df75013ddb31d084340c2fab5d92794a47c916ea90ef23ace3c4'
            '617a1b5fe9fd52993ed66a4ac79b5eb42467226434feff6568a993001f004e57'
            'c7ee34198f1918e2f01ebdeb9043c92c1f1aa243714bf2883220814e18b865ee'
            'd6c96f3dd6c4ef7dc084f68449d49b02045057e0dca93b51f42aa2a967622e85'
            '59a64dc276428656d558ac80a5cd552699182845a29cbafd6563e39c6afc7a0d'
            '7154ce74d8131aa0e78a893b3899f091225a433e4b77836661ec549e9fbdf7fd')

build() {
	cd "$pkgname-$pkgver"

	# Client active mode source address fix
	patch -p1 < "$srcdir/$pkgname-$pkgver-clientdata_socket.patch"
	# Default config file fixes
	patch -p1 < "$srcdir/$pkgname.conf.patch"

	CFLAGS+=' -fcommon'
	./configure \
		--prefix='/usr' \
		--sbindir='/usr/bin' \
		--enable-ipfilter \
		--enable-http-cache \
		--enable-local-cache \
		--enable-virus-scan \
		--enable-ssl \
		--enable-ccp \
		--enable-procname \
		--enable-configfile="/etc/$pkgname.conf"

	make
}

package() {
	cd "$pkgname-$pkgver"

	make install DESTDIR="$pkgdir"

	local _mandir='/usr/share/man'
	install -Dp -m644 "doc/$pkgname.conf.man" "$pkgdir$_mandir/man5/$pkgname.conf.5"
	install -Dp -m644 "doc/$pkgname.man"      "$pkgdir$_mandir/man8/$pkgname.8"
	install -Dp -m644 "src/$pkgname.conf"     "$pkgdir/etc/$pkgname.conf"

	local _unitdir='/usr/lib/systemd/system'
	install -Dp -m644 {"$srcdir","$pkgdir/$_unitdir"}/$pkgname.service

	install -Dp -m644 "$srcdir/$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
	install -Dp -m644 "$srcdir/$pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}

# vim: set ft=sh ts=4 sw=4 noet:
