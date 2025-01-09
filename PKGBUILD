# maintainer: BrainDamage

pkgname=python-radicale-decsync
pkgver=2.1.0
pkgrel=3
pkgdesc="Radicale storage plugin to add synchronization using DecSync "
arch=('any')
url="https://github.com/39aldo39/Radicale-DecSync"
license=(' GPL-3.0-only')
depends=('python' 'python-libdecsync' 'radicale')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("git+https://github.com/mab122/Radicale-DecSync.git#branch=fix/storage_discovery_arguments_mismatch")
sha256sums=('SKIP')

_dirname="Radicale-DecSync-${pkgver}"
_basename="${_basename#python-}"


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
