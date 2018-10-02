# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgbase=python-scikit-surprise-git
pkgname=("python-scikit-surprise-git" "python2-scikit-surprise-git")
_reponame="Surprise"
pkgver=1.0.4.r73.g633ab47
pkgrel=1
pkgdesc="Python scikit for building and analyzing recommender systems"
arch=('any')
license=('BSD-3-Clause')
url="https://github.com/NicolasHug/${_reponame}"
depends=('')
makedepends=('git' 'python-setuptools' 'python2-setuptools' 'cython' 'cython2' 'python-numpy' 'python2-numpy')
provides=("")
conflicts=("")
source=("git+https://github.com/NicolasHug/${_reponame}")
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_reponame}"
	( set -o pipefail
	git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
	|| printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare() {
	cp -a "${srcdir}/${_reponame}"{,-py2}
}

build() {
	cd "${srcdir}/${_reponame}"
	python setup.py clean
	rm -rf build dist
	python setup.py build

	cd "${srcdir}/${_reponame}-py2"
	python2 setup.py clean
	rm -rf build dist
	python2 setup.py build
}

package_python-scikit-surprise-git() {
	depends=('python-joblib' 'python-numpy' 'python-scipy' 'python-six')
	optdepends=("flake8: code linting to comply with contributing standards"
		"python-pandas: dataframe handling"
		"python-pytest: test suite"
		"python-sphinx: documentation generator"
		"python-sphinx_rtd_theme: Read The Docs theme for documentation generator"
		"python-sphinxcontrib-spelling: spelling extension for documentation generator")
	provides=("python-scikit-surprise=${pkgver}")
	conflicts=("python-scikit-surprise")

	cd "${srcdir}/${_reponame}"
	python setup.py install --root="${pkgdir}" --optimize=1
	ln -s surprise "${pkgdir}/usr/bin/surprise3"

	install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname/-git//}/LICENSE"
}

package_python2-scikit-surprise-git() {
	depends=('python2-joblib' 'python2-numpy' 'python2-scipy' 'python2-six')
	optdepends=("python2-flake8: code linting to comply with contributing standards"
		"python2-pandas: dataframe handling"
		"python2-pytest: test suite"
		"python2-sphinx: documentation generator"
		"python2-sphinx_rtd_theme: Read The Docs theme for documentation generator"
		"python2-sphinxcontrib-spelling: spelling extension for documentation generator")
	provides=("python2-scikit-surprise=${pkgver}")
	conflicts=("python2-scikit-surprise")

	cd "${srcdir}/${_reponame}-py2"
	python2 setup.py install --root="${pkgdir}" --optimize=1
	mv "${pkgdir}/usr/bin/surprise"{,2}

	install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname/-git//}/LICENSE"
}
