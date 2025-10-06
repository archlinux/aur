# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>

_name=trafilatura
pkgname=python-trafilatura
pkgver=2.0.0
pkgrel=1
pkgdesc="Python and command-line tool to gather text and metadata on the web"
arch=('any')
url="https://github.com/adbar/${_name}"
license=('Apache-2.0')
depends=('python-certifi' 'python-charset-normalizer' 'python-courlan' 'python-htmldate' 'python-justext' 'python-lxml' 'python-urllib3')
makedepends=('python-build' 'python-setuptools' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
source=("https://github.com/adbar/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('f9b9a43bb61d793f1dc832825fb76a30a452df9447d14198e91e7c25536420905c7dd074ffdb20e4c81bd66236cd8fbec19745b6e3dc91f671919496950ed930')
b2sums=('376c29c59e4dfdbdd8b923aba192fdc5b763e27154bd16f5e2401feb5b973e1ae985a1085f9f9cfc9cc705ef6427080f51057fe68022f25d9476486c7cce0a5f')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_name-$pkgver"

	local pyver=$(python -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')
	local tmpdir="$srcdir/test_dir/"
	python -m installer --destdir="$tmpdir" dist/*.whl

	export PYTHONPATH="$tmpdir/usr/lib/python${pyver}/site-packages:$PYTHONPATH"
	export PATH="$tmpdir/usr/bin:$PATH"
	pytest \
		--deselect=tests/unit_tests.py::test_table_processing \
		--deselect='tests/realworld_tests.py::test_extract[False-True]' \
		--deselect=tests/unit_tests.py::test_external
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
