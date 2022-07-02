# Maintainer: BrainDamage
pkgname="python-wfdb"
pkgver=4.0.0
_basename='wfdb-python'
_dirname="${_basename}-${pkgver}"
pkgrel=1
pkgdesc="A library of tools for reading, writing, and processing WFDB signals and annotations"
arch=(any)
url="https://github.com/MIT-LCP/wfdb-python"
license=("MIT")
depends=("python" "python-numpy" "python-scipy" "python-matplotlib" "python-pandas" "python-requests" "python-soundfile")
sha256sums=('06e5acfbde5aaa629a4c194ec29eee979b627d0ed711f0ed312b02f338a67a1a')
source=("https://github.com/MIT-LCP/${_basename}/archive/v${pkgver}.tar.gz")

makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry' 'python-sphinx')
checkdepends=('python-pytest' 'python-pytest-xdist' 'python-pylint' 'python-black')

build() {
	cd "${srcdir}/${_dirname}"
	export PYTHONHASHSEED=0
	python -m build --wheel --no-isolation
	cd docs
	make html
}

package() {
	cd "${srcdir}/${_dirname}"
	find dist -name '*.whl' -exec python -m installer --compile-bytecode 1 --destdir="${pkgdir}" {} \;
	# not necessary for every package, but for those who it is, it'd generate conflict with others otherwise
	rm -rf "${pkgdir}/$(python -c 'import site; print(site.getsitepackages()[0])')/tests/"
	find docs/_build/html -type f -exec install -Dvm 644 {} -t "${pkgdir}/usr/share/doc/${_basename}/html" \;
	find . -maxdepth 1 -iname 'README*' -exec install -Dvm 644 {} -t "${pkgdir}/usr/share/doc/${_basename}" \;
	find . -maxdepth 1 -iname 'LICENSE*' -exec install -Dvm 644 {} -t "${pkgdir}/usr/share/licenses/${_basename}" \;
}

check() {
	cd "${srcdir}/${_dirname}"
	pytest -n auto
}
