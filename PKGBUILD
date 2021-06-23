# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Jacob Alexander <haata at kiibohd com>

pkgbase=germinate
pkgname=('germinate' 'python-germinate' 'python2-germinate')
_pkgname=${pkgname[0]}
pkgver=2.37
pkgrel=2
pkgdesc='Expands dependencies in a list of seed packages'
arch=('x86_64')
url="https://tracker.debian.org/pkg/germinate"
license=('GPL')
makedepends=('python-setuptools' 'python-apt' 'python2-apt' 'python2-setuptools')
options=(!emptydirs)
source=("https://mirrors.ocf.berkeley.edu/debian/pool/main/g/germinate/${_pkgname}_$pkgver.tar.xz")
sha256sums=('367771cdd892cfa94a46b8df8afec1060604b93d7bb98170d406bcdaddbfd096')

# Base
# Build last
package_germinate() {
	cd work
	depends+=('perl' 'python')

	# Initial python build
	python setup.py build

	# Install files to /usr/bin
	install -Dm 755 bin/germinate{,-pkg-diff,-update-metapackage} -t "$pkgdir/usr/bin"

	# Install perl libs
	install -Dm 644 debhelper/germinate.pm -t "$pkgdir/usr/share/perl5/vendor_perl/Debhelper/Sequence/"

	# Install man pages (keep original files, or python builds will fail)
	install -Dm 644 \
	  debhelper/dh_germinate_{clean,metapackage} \
	  man/germinate{,-pkg-diff,-update-metapackage}.1 \
	  -t "$pkgdir/usr/share/man/man1/"
}

# Python libs
# Build this first
package_python-germinate() {
	cd work
	depends+=('germinate' 'python' 'python-apt')

	python setup.py install --root="$pkgdir/" --optimize=1

	# Remove already installed portions
	rm -rf $pkgdir/usr/share/man
	rm -rf $pkgdir/usr/share/perl5
	rm -rf $pkgdir/usr/bin
}

# Python2 libs
package_python2-germinate() {
	cd work
	depends+=('germinate' 'python2' 'python2-apt')

	python2 setup.py install --root="$pkgdir/" --optimize=1

	# Remove already installed portions
	rm -rf $pkgdir/usr/share/man
	rm -rf $pkgdir/usr/share/perl5
	rm -rf $pkgdir/usr/bin
}

