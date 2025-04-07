# Maintainer: BrainDamage
pkgname="python-wfdb"
pkgver=4.3.0
_basename='wfdb-python'
_dirname="${_basename}-${pkgver}"
pkgrel=1
pkgdesc="Library of tools for reading, writing, and processing WFDB signals and annotations"
arch=(any)
url="https://github.com/MIT-LCP/wfdb-python"
license=("MIT")
depends=("python" "python-numpy" "python-scipy" "python-matplotlib" "python-pandas" "python-requests" "python-soundfile")
sha256sums=('a5df93103f65b09aaa63eb41fd2b22b9df89479860b4cc8cf8ea4c0f62cc393f')
source=("https://github.com/MIT-LCP/${_basename}/archive/v${pkgver}.tar.gz")

makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry' 'python-sphinx' 'python-hatchling')
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
