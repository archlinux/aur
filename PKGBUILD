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
source=("https://releases.pagure.org/$pkgname/$pkgname-$pkgver.tar.xz"
        "$pkgname-1.112-l10n-ftbfs.patch::$url/c/7cbc6441cd06e0c0bb51ac37c8f22b0fd51f12f2.patch"
        "glib-2.28-sysmacros-ftbfs.patch::$url/c/c5a0bfd174e4a88fcd49fe7a130b37b6779c1a18.patch")
md5sums=('a766a9f7600f573fb6de4655d4162196'
         'fff566f90a52ddc901d5e3dc6aff0e8d'
         '8dfad6535d05e9f78a1935c89634e515')

prepare() {
	cd "$pkgname-$pkgver"

	# FTBFS fixes:
	# tr.po:411: 'msgid' and 'msgstr' entries do not both end with '\n'
	# /usr/bin/msgfmt: found 1 fatal error
	patch -p1 -i "$srcdir/$pkgname-1.112-l10n-ftbfs.patch"

	# Inclusion of <sys/sysmacros.h> by <sys/types.h> is deprecated since
	# glibc-2.25 and has been removed in glibc-2.28
	patch -p1 -i "$srcdir/glib-2.28-sysmacros-ftbfs.patch"

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
