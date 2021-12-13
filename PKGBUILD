# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Gabriel Magno <gabrielmagno1@gmail.com>
# Contributor: Michał Pałubicki <maln0ir@gmx.com>

_py_name=agate
pkgname=python-$_py_name
pkgver=1.6.3
pkgrel=2
pkgdesc='A data analysis library that is optimized for humans instead of machines'
arch=(any)
url='https://agate.readthedocs.org/'
license=(MIT)
_py_deps=(babel
         isodate
         leather
         parsedatetime
         pyicu
         pytimeparse
         six
         slugify
         sphinx_rtd_theme)
depends=(python "${_py_deps[@]/#/python-}")
makedepends=(python-setuptools python-sphinx)
checkdepends=(python-cssselect)
_archive="$_py_name-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_py_name::1}/$_py_name/$_archive.tar.gz")
sha256sums=('e0f2f813f7e12311a4cdccc97d6ba0a6781e9c1aa8eca0ab00d5931c0113a308')

build() {
	cd "$_archive"
	python setup.py build
	python setup.py build_sphinx
	_rtd_theme_path="$(python -c 'import sphinx_rtd_theme; print(sphinx_rtd_theme.get_html_theme_path())')"
	rm -rvf "build/sphinx/html/_static"
	ln -svf "$_rtd_theme_path/sphinx_rtd_theme/static" "build/sphinx/html/_static"
}

check() {
	cd "$_archive"
	# Note: Upstream test suite is currently badly broken; it depends on the system local and fails on some
	# python setup.py test --test-suite=tests
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	mkdir -p "$pkgdir/usr/share/doc"
	cp -rv "build/sphinx/html" "$pkgdir/usr/share/doc/$pkgname"
}
