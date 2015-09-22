# Maintainer: Kristóf Jakab <jaksi@jaksi.io>
pkgname=zorp-git
pkgver=6.0.7
pkgrel=1
pkgdesc="An advanced protocol analyzing firewall"
arch=('x86_64')
url="https://github.com/balabit/zorp"
license=('GPL2')
depends=('libzorpll-git' 'python2' 'python2-pyopenssl' 'python2-dnspython' 'python2-py-radix')
makedepends=('git' 'gperf')
install=zorp-git.install
source=(
	'zorp::git+https://github.com/balabit/zorp.git#branch=6.0.7'
	'0001-Add-placeholder-files-required-by-automake.patch'
	'0002-Consider-only-python2-and-python2.7.patch'
	'0003-Fix-python-shebangs.patch'
)
md5sums=(
	'SKIP'
	'8e8bc49f1177858215572a359b98f88a'
	'f9b828ed00f5c2e8e71ae9f965736e2b'
	'b3bbae46900d21c7ac1d1334227563e5'
)

pkgver() {
	cd "$srcdir/zorp"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/zorp"
	git apply ../../0001-Add-placeholder-files-required-by-automake.patch || /bin/true
	git apply ../../0002-Consider-only-python2-and-python2.7.patch || /bin/true
	git apply ../../0003-Fix-python-shebangs.patch || /bin/true
	autoreconf -i
	./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var/lib/zorp --with-pidfiledir=/run/zorp/
	make
}

package() {
	cd "$srcdir/zorp"
	make DESTDIR="$pkgdir/" install
	mv "$pkgdir/usr/sbin" "$pkgdir/usr/bin"
	chmod o-rx "$pkgdir/etc/sudoers.d"
}
