# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Doron Behar <doron.behar@gmail.com>

## GPG key: https://github.com/jedbrown.gpg

pkgname=('libceed' 'python-ceed')
pkgver=0.10.1
pkgrel=2
pkgdesc="Performance portable operators for element-based discretizations"
arch=('x86_64')
license=('BSD')
url='https://github.com/ceed/libceed'
makedepends=(
	'gcc-fortran'
	'git'
	'python-build'
	'python-cffi'
	'python-installer'
	'python-setuptools'
	'python-wheel')
source=("$pkgname::git+$url#tag=v$pkgver?signed")
sha256sums=('SKIP')
validpgpkeys=('BA543CE09D732BE604D53F6FCA6D4A3B32D335A0') ## Jed Brown

prepare() {
	cd "$pkgname"
	## don't compile CEED twice for python-ceed
	sed -i '/always-make/d' setup.py
}

build() {
	cd "$pkgname"
	make
	python -m build --wheel --no-isolation
}

check() {
	cd "$pkgname"
	make test
}

package_libceed() {
	depends=('glibc')
	provides=('libceed.so')

	cd "$pkgname"
	make DESTDIR="$pkgdir" prefix=/usr install
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

package_python-ceed() {
	depends=('libceed' 'python-cffi' 'python-numpy')

	cd "$pkgbase"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s \
		"$_site/libceed-$pkgver.dist-info/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/"
}
