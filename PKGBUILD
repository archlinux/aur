# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgname=python-scikit-surprise-git
_reponame="Surprise"
pkgver=1.0.4.r112.gef3ed6e
pkgrel=1
pkgdesc="Python scikit for building and analyzing recommender systems"
arch=('any')
license=('BSD-3-Clause')
url="https://github.com/NicolasHug/${_reponame}"
depends=('python-joblib' 'python-numpy' 'python-scipy' 'python-six')
optdepends=("flake8: code linting to comply with contributing standards"
	"python-pandas: dataframe handling"
	"python-pytest: test suite"
	"python-sphinx: documentation generator"
	"python-sphinx_rtd_theme: Read The Docs theme for documentation generator"
	"python-sphinxcontrib-spelling: spelling extension for documentation generator")
makedepends=('git' 'python-setuptools' 'cython')
provides=("python-scikit-surprise=${pkgver}")
conflicts=("python-scikit-surprise")
source=("git+https://github.com/NicolasHug/${_reponame}")
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_reponame}"
	( set -o pipefail
	git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
	|| printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "${srcdir}/${_reponame}"
	python setup.py clean
	rm -rf build dist
	python setup.py build
}

package() {
	cd "${srcdir}/${_reponame}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
	ln -s surprise "${pkgdir}/usr/bin/surprise3"

	install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname/-git//}/LICENSE"
}
