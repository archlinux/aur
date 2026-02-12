pkgname=papis-zotero
pkgver=0.3.0
pkgrel=1
pkgdesc='Zotero remote server for papis'
arch=('any')
url='https://github.com/papis/papis-zotero'
license=('GPL')
depends=('python' 'papis')
makedepends=(python-build python-installer python-wheel python-hatchling)
source=("https://github.com/papis/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('aa189632e30113b10e74b19cee97a9811b1d7f6ed5536c222696060e8cdc64ce')

_dirname="${pkgname}-${pkgver}"
_basename="${pkgname}"


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
