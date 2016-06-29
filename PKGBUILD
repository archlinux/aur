# Contributor: David Roheim <david.roheim@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >

pkgname=rpmlint
pkgver=1.9
pkgrel=1
pkgdesc='A tool for checking common errors in rpm packages.'
arch=('any')
url="https://github.com/rpm-software-management/$pkgname"
license=('GPL2')
depends=('cpio' 'desktop-file-utils' 'python' 'rpm-org')
makedepends=('bash-completion')
checkdepends=('flake8' 'python-pytest')
source=("$url/archive/$pkgname-$pkgver.tar.gz")
md5sums=('810d7fd565d389fec305ff80af53ba40')

prepare() {
	mv "$pkgname-$pkgname-$pkgver" "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"

	make COMPILE_PYC=1
}

# Tests work better with a non-empty RPM database on the system
# It may be created using "rpm --initdb"
check() {
	cd "$pkgname-$pkgver"
	# Tests fail with non UTF-8 locales
	make LC_ALL=en_US.UTF-8 check
}

package() {
	cd "$pkgname-$pkgver"

	make DESTDIR="$pkgdir/" install

	install -Dp -m644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ft=sh ts=4 sw=4 noet:
