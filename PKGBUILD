# Maintainer: BrainDamage

pkgname=python-untangle
pkgver=1.2.0
pkgrel=1
pkgdesc="Converts XML to a Python object"
arch=('any')
url="https://github.com/stchris/untangle"
license=('MIT')
depends=('python' 'python-defusedxml')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('cd3c6d544a19c1207c6213021578d6c35fac57973e9ddf1d19165d17b284c7d9')

_basename="${pkgname#python-}"
_dirname="${_basename}-${pkgver}"


makedepends+=(python-build python-installer python-wheel)

build() {
	cd "${srcdir}/${_dirname}"
	export PYTHONHASHSEED=0
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_dirname}"
	find dist -name '*.whl' \
		-exec python -m installer --compile-bytecode 1 --destdir="${pkgdir}" {} \;
	# not necessary for every package, but for those who it is, it'd generate conflict with others otherwise
	rm -rf "${pkgdir}/$(python -c 'import site; print(site.getsitepackages()[0])')/tests/"

  find . -maxdepth 1 -iname 'README*' \
		-exec install -Dvm 644 -t "${pkgdir}/usr/share/doc/${_basename}" {} +
  find . -maxdepth 1 -iname 'LICENSE*' \
		-exec install -Dvm 644 -t "${pkgdir}/usr/share/licenses/${_basename}" {} +
}
