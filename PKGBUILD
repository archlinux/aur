# Contributor: koneu
# Contributor: Thomas Dziedzic

pkgname=usermode
pkgver=1.112
pkgrel=1
pkgdesc="Allow configured programs to be run with superuser privileges by ordinary users"
arch=('i686' 'x86_64')
url="https://pagure.io/$pkgname"
license=('GPL2')
depends=('gtk2' 'libice' 'libsm' 'libuser' 'startup-notification')
makedepends=('desktop-file-utils' 'intltool')
source=("https://releases.pagure.org/$pkgname/$pkgname-$pkgver.tar.xz")
md5sums=('a766a9f7600f573fb6de4655d4162196')

prepare() {
	cd "$pkgname-$pkgver"

	# FTBFS fix:
	# tr.po:411: 'msgid' and 'msgstr' entries do not both end with '\n'
	# /usr/bin/msgfmt: found 1 fatal error
	sed -e '411 s/"$/\\n"/' \
	    -i po/tr.po

	./autogen.sh
}

build() {
	cd "$pkgname-$pkgver"

	./configure --prefix=/usr      \
	            --sbindir=/usr/bin \
	            --sysconfdir=/etc
	make
}

package() {
	cd "$pkgname-$pkgver"

	make "DESTDIR=$pkgdir/" install

	chmod 04711 "$pkgdir"/usr/bin/userhelper
}

# vim: set ft=sh ts=4 sw=4 noet:
