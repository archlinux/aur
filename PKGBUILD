# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: brent s. <bts[at]square-r00t[dot]net>

# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net

pkgname=python-pychroot
_pkg="${pkgname#python-}"
pkgver=0.10.4
pkgrel=1
pkgdesc="A python library and CLI tool that simplifies chroot handling"
arch=('any')
url='https://github.com/pkgcore/pychroot'
license=('BSD')
depends=('python-snakeoil')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("$pkgname::git+$url#tag=v$pkgver?signed")
sha256sums=('SKIP')
validpgpkeys=('74A2E6514C583FA49EEEA1094AB3E85B4F064CA3') ## Tim Harder

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
