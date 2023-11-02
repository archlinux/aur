# Maintainer: Bailey Kasin <baileykasin@gmail.com>
# Contributer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: brent s. <bts[at]square-r00t[dot]net>
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net

## GPG key: https://github.com/arthurzam.gpg

pkgname=python-snakeoil
_pkg="${pkgname#python-}"
pkgver=0.10.5
pkgrel=2
pkgdesc="Provides common functionality and useful optimizations"
arch=('any')
url='https://github.com/pkgcore/snakeoil'
license=('BSD')
depends=('python-lazy-object-proxy')
makedepends=('git' 'python-build' 'python-flit-core' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'lbzip2')
source=("$pkgname::git+$url#tag=v$pkgver?signed")
sha256sums=('SKIP')
validpgpkeys=('38514F35D453DDE719F74C6AFC1FFCB5DC7D67A3') ## Arthur Zamarin

prepare() {
	cd "$pkgname"
}

build() {
	cd "$pkgname"
	python -m build --wheel --no-isolation
}

check() {
	cd "$pkgname"
	PYTHONPATH="$PWD/src" pytest -x
}

package() {
	cd "$pkgname"
	python -m installer --destdir "$pkgdir" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sv "$_site/$_pkg-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
