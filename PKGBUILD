# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Simon Sapin <simon dot sapin at exyr dot org>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=python-tinycss
_pyname=${pkgname#python-}
pkgver=0.4
pkgrel=10
pkgdesc='A complete yet simple CSS parser for Python'
url="https://pypi.python.org/pypi/${pkgname#python-}"
license=(BSD)
arch=(x86_64)
depends=(python)
makedepends=(cython
             python-{build,installer,wheel}
             python-setuptools)
checkdepends=(python-pytest)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('12306fb50e5e9e7eaeef84b802ed877488ba80e35c672867f548c0924a76716e')

prepare() {
	cd "$_archive"
	rm tinycss/speedups.c
	# isort is not a sign of failing code
	sed -i -e '/addopts/d' setup.cfg
}

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive"
	local _pyver=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
	export PYTHONPATH="$PWD/lib.linux-$CARCH-cpython-$_pyver"
	export TINYCSS_SKIP_SPEEDUPS_TESTS=true
	pytest
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
