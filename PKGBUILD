# Maintainer: Jacob Alexander <haata at kiibohd com>
pkgname=('germinate' 'python-germinate' 'python2-germinate')
_pkgname=${pkgname[0]}
pkgver=2.23
pkgrel=1
pkgdesc="Takes lists of seed packages and expands their dependencies to produce a full list of packages. This can be used for purposes such as managing the list of packages present in a derived distribution's archive or CD builds."
arch=('any')
url="https://tracker.debian.org/pkg/germinate"
license=('GPL')
makedepends=('python' 'python-setuptools' 'python-apt' 'python2-apt')
options=(!emptydirs)
source=("https://mirrors.ocf.berkeley.edu/debian/pool/main/g/germinate/${_pkgname}_$pkgver.tar.xz")
sha256sums=('aeadbd250ef4c065cc9aa0b0a7410ddee49b5c4aa31209c4f66d23652da612eb')

# Base
# Build last
package_germinate() {
	cd "${_pkgname}"
	depends+=('perl' 'python')

	# Initial python build
	python setup.py build

	# Install files to /usr/bin
	mkdir -p $pkgdir/usr/bin || return 1
	cp bin/germinate $pkgdir/usr/bin/. || return 1
	cp bin/germinate-pkg-diff $pkgdir/usr/bin/. || return 1
	cp bin/germinate-update-metapackage $pkgdir/usr/bin/. || return 1
	cp debhelper/dh_germinate_clean $pkgdir/usr/bin/. || return 1
	cp debhelper/dh_germinate_metapackage $pkgdir/usr/bin/. || return 1

	# Install perl libs
	mkdir -p $pkgdir/usr/share/perl5/vendor_perl/Debhelper/Sequence || return 1
	cp debhelper/germinate.pm $pkgdir/usr/share/perl5/vendor_perl/Debhelper/Sequence/. || return 1

	# Install man pages (keep original files, or python builds will fail)
	mkdir -p $pkgdir/usr/share/man/man1 || return 1
	gzip -k debhelper/*.1 || return 1
	cp debhelper/dh_germinate_clean.1.gz $pkgdir/usr/share/man/man1/. || return 1
	cp debhelper/dh_germinate_metapackage.1.gz $pkgdir/usr/share/man/man1/. || return 1
	gzip -k man/*.1 || return 1
	cp man/germinate-pkg-diff.1.gz $pkgdir/usr/share/man/man1/. || return 1
	cp man/germinate-update-metapackage.1.gz $pkgdir/usr/share/man/man1/. || return 1
	cp man/germinate.1.gz $pkgdir/usr/share/man/man1/. || return 1
}

# Python libs
# Build this first
package_python-germinate() {
	cd "${_pkgname}"
	depends+=('germinate' 'python')

	python setup.py install --root="$pkgdir/" --optimize=1

	# Remove already installed portions
	rm -rf $pkgdir/usr/share/man
	rm -rf $pkgdir/usr/share/perl5
	rm -rf $pkgdir/usr/bin
}

# Python2 libs
package_python2-germinate() {
	cd "${_pkgname}"
	depends+=('germinate' 'python2')

	python2 setup.py install --root="$pkgdir/" --optimize=1

	# Remove already installed portions
	rm -rf $pkgdir/usr/share/man
	rm -rf $pkgdir/usr/share/perl5
	rm -rf $pkgdir/usr/bin
}

