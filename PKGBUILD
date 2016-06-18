# Contributor: David Roheim <david.roheim@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >

pkgname=rpmlint
pkgver=1.6
pkgrel=1
pkgdesc='A tool for checking common errors in rpm packages.'
arch=('any')
url="http://$pkgname.sourceforge.net/"
license=('GPL2')
depends=('cpio' 'desktop-file-utils' 'python2>=2.6' 'rpm-org')
makedepends=('bash-completion')
checkdepends=('python2-pytest')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.xz")
sha256sums=('a0dae71a3fed413ee5c47bd04f393cd6598c68c0dcf1504fa020d62814ff674b')

prepare() {
	cd "$pkgname-$pkgver"

	for file in "$pkgname" rpmdiff tools/generate-isocodes.py; do
		sed -e 's_/usr/bin/python_&2_' -i "$file"
	done

	sed -e 's_py\.test_&2_' -i test.sh
}

build() {
	cd "$pkgname-$pkgver"

	make PYTHON=python2 COMPILE_PYC=1
}

# Tests need a non-empty RPM database on the system
# It may be created using "rpm --initdb"
#check() {
#	cd "$pkgname-$pkgver"
#	make check
#}

package() {
	cd "$pkgname-$pkgver"

	make PYTHON=python2 DESTDIR="$pkgdir/" install

	install -Dp -m644 README "$pkgdir/usr/share/doc/$pkgname/README"
}

# vim: set ft=sh ts=4 sw=4 noet:
