# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)
# Contributor : Aniket Pradhan <aniket17133@iiitd.ac.in>
# Contributor : Chris Wanstrath <chris@github.com>


pkgname=python-pystache-git
_pkgname="pystache"

epoch=1
pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}
pkgver=0.5.4.r3.17a5dfd
pkgrel=3

pkgdesc="The mustache template engine written in python"
arch=('x86_64')
url="https://github.com/defunkt/$_pkgname"
license=('MIT')

provides=('python-pystache')
conflicts=('python-pystache')

depends=('python')
makedepends=('git' 'python-setuptools')

changelog=history
source=("git+$url#branch=master")
sha256sums=('SKIP')

build() {
	cd "$_pkgname"
	python setup.py build
}

check() {
	# This package uses 2to3 to convert itself to Python 3 on the fly
	# So we need to jump through some hoops here
	rm -rf test_dir
	mkdir test_dir
	cd "$_pkgname"
	python setup.py install --root=../test_dir
	_py3ver="$(python -V | sed 's/Python \(3\.[0-9]\+\).*/\1/')"
	PYTHONPATH="../test_dir/usr/lib/python$_py3ver/site-packages/" \
		../test_dir/usr/bin/pystache-test .
}

package() {
	cd "$_pkgname"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm644 LICENSE -t"$pkgdir/usr/share/licenses/$_pkgname/"
	install -Dm644 {README,HISTORY}.md setup_description.rst -t"$pkgdir/usr/share/doc/$_pkgname/"
}

# vim: sw=4 ts=4 noet ft=PKGBUILD:
