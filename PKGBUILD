# Maintainer: nightuser <nightuser.android@gmail.com>
# Contributor: Antoine Pierlot-Garcin <antoine@bokbox.com>

pkgname=debsig-verify-git
pkgver=0.22.r0.8872a14
pkgrel=1
pkgdesc="Debian package signature verification tool"
arch=('x86_64')
url="https://git.dpkg.org/git/dpkg/debsig-verify.git"
license=('GPL2')
depends=('dpkg' 'expat')
makedepends=('git')
source=("${pkgname%-git}::git+https://git.dpkg.org/git/dpkg/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	./autogen
	./configure --prefix=/usr \
	            --sysconfdir=/etc
	make
}

check() {
	cd "$srcdir/${pkgname%-git}/test"
	make check-local
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir" install
	install -m 0755 -d "$pkgdir/usr/share/doc/$pkgname"
	install -m 0644 doc/policy-syntax.txt doc/policy.dtd "$pkgdir/usr/share/doc/$pkgname"
}

# vim: set noet sw=8 ts=8 tw=79:
