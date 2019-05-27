# Maintainer: Aniket Pradhan <aniket17133@iiitd.ac.in>
# Contributor: Chris Wanstrath <chris@github.com>

_pkgname="pystache"
pkgname=python-pystache-git
pkgver=20091121
pkgrel=1
pkgdesc="The mustache template engine written in python"
arch=("x86_64")
url="https://github.com/defunkt/pystache"
license=('MIT')
depends=('python')
makedepends=('git' 'python-setuptools')
provides=('python-pystache')
conflicts=('python-pystache')
source=("git+https://github.com/defunkt/pystache#branch=master")
md5sums=('SKIP')

build() {
	cd "$srcdir/$_pkgname"
	python setup.py build
}

check() {
	# This package uses 2to3 to convert itself to Python 3 on the fly
	# So we need to jump through some hoops here
	rm -rf test_dir
	mkdir test_dir
	cd ${_pkgname}
	python setup.py install --root=../test_dir
	PYTHONPATH=../test_dir/usr/lib/python3.7/site-packages/ \
		../test_dir/usr/bin/pystache-test .
}

package() {
	cd ${srcdir}/${_pkgname}
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
