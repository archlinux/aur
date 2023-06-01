# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>

_project=ots-python
_pyname=opentype-sanitizer
pkgname=python-$_pyname
pkgver=9.1.0
pkgrel=1
pkgdesc='Python wheels for the OpenType Sanitizer'
arch=(any)
url="https://github.com/googlefonts/$_project"
license=(GPL3)
depends=(ots
         python)
checkdepends=(python-pytest
              woff2)
makedepends=(python-{build,installer,wheel}
             meson
             ninja
             python-setuptools-scm)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz"
        system-ots-sanitize.patch)
sha256sums=('d5975df9e4440a299997c2fc082926ee90a33744da7d2b1ce62d98ebfa07f3c2'
            '6388d57e44f3dc7d6ee91422b30ca9eca3e3c590bacaa7bc4664b6183ed4d065')

prepare () {
	cd "$_archive"
	patch -p0 < "../system-ots-sanitize.patch"
	# python -m build finds project local helper script not distro tooling
	sed -i -e 's/build.py/buildots.py/g' setup.py
	mv build{,ots}.py
	sed -i -e '/ninja/d' pyproject.toml
}

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive"
	PYTHONPATH=src/python pytest
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
