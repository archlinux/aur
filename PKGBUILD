# Maintainer: Chris Severance aur.severach AatT spamgourmet.com
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Alexander Kurilo <alex@kurilo.me>
# Contributor: Mariusz Szczepańczyk <mszczepanczyk@gmail.com>
# Contributor: Thor K. H. <thor alfakrøll roht dott no>

pkgname=csvkit-git
pkgver=1.4.0.r13.g59fbd6d
pkgrel=1
pkgdesc='A suite of utilities for converting to and working with CSV'
arch=(any)
url='https://csvkit.readthedocs.org'
license=(MIT)
_pydeps=(agate
         agate-dbf
         agate-excel
         agate-sql
         setuptools
         sphinx-furo)
depends=(python
         "${_pydeps[@]/#/python-}")
optdepends=('ipython: nicer command-line for csvpy utility')
makedepends=(git
             python-{build,installer,wheel}
             python-sphinx)
checkdepends=(python-pytest)
provides=("${pkgname%-git}=$pkgver")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+https://github.com/wireservice/${pkgname/-/.}")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	python -m build -wn
	make -C docs html
	_rtd_theme_path="$(python -c 'import sphinx_rtd_theme; print(sphinx_rtd_theme.get_html_theme_path())')"
	rm -rvf "docs/_build/html/_static"
	ln -svf "$_rtd_theme_path/sphinx_rtd_theme/static" "docs/_build/html/_static"
}

check() {
	cd "$pkgname"
	export LANG=en_US.UTF-8
	pytest tests
}

package() {
	cd "$pkgname"
	python -m installer -d "$pkgdir" dist/*.whl
	install -dm0755 "$pkgdir/usr/share/doc/"
	cp -rv docs/_build/html "$pkgdir/usr/share/doc/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" COPYING
}
