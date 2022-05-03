# Maintainer: BrainDamage

pkgname=python-matplotlib-backend-notcurses
pkgver=1.0.1
pkgrel=1
pkgdesc="a sixel graphics backend for matplotlib "
arch=('any')
url="https://github.com/jktr/matplotlib-backend-notcurses"
license=('Custom:CC0')
depends=('python-matplotlib' 'notcurses')
# template start; name=github_release; version=1;
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
# template end;
sha256sums=('252411c3e0368bce59432e1e414026c35e7a0990ea11d70ee892e6a1883f88eb')

# template start; name=tarball; version=1;
_dirname="${pkgname}-${pkgver}"
_basename="${pkgname}"
# template end;


# template start; name=python-wheel; version=1;
depends+=('python')
makedepends+=(python-build python-installer python-wheel)
# strip the python- prefix from names if present
_dirname="${_dirname#python-}"
_basename="${_basename#python-}"

build() {
	cd "${srcdir}/${_dirname}"
	export PYTHONHASHSEED=0
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_dirname}"
	find dist -name '*.whl' -exec python -m installer --compile-bytecode 1 --destdir="${pkgdir}" {} \;
	# not necessary for every package, but for those who it is, it'd generate conflict with others otherwise
	rm -rf "${pkgdir}/$(python -c 'import site; print(site.getsitepackages()[0])')/tests/"
  find . -maxdepth 1 -iname 'README*' -exec install -Dvm 644 {} -t "${pkgdir}/usr/share/doc/${_basename}" \;
  find . -maxdepth 1 -iname 'LICENSE*' -exec install -Dvm 644 {} -t "${pkgdir}/usr/share/licenses/${_basename}" \;
}
# template end;
