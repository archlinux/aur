#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Aditya Sirish <aditya@saky.in>

pkgname=shiv
pkgver=1.0.8
pkgrel=1
pkgdesc='CLI for building self-contained Python zipapps'
arch=('any')
url='https://github.com/linkedin/shiv'
license=('BSD-2-Clause')
depends=('python>=3.11' 'python-click')
makedepends=(
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-sphinx'
	'python-sphinx-click'
	'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('3be19e245fa0260f095ffa83c0eb63b64087a434c2f097b17c2664a61b40bf07')

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
	sphinx-build -b man docs/ _build/man
}

package() {
	local _site
	cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dvm0644 _build/man/shiv.1 -t "$pkgdir/usr/share/man/man1/"
	_site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sv "$_site/$pkgname-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
