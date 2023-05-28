# Maintainer: BrainDamage

pkgname=python-tulir-telethon
pkgver=1.28.0a9
pkgrel=1
pkgdesc="is a fork of Telethon library with custom patches from Tulir."
arch=('any')
url="https://github.com/tulir/Telethon"
license=('MIT')
depends=('python-pyaes' 'python-rsa')
provides=('python-telethon')
conflicts=('python-telethon')
optdepends=('python-cryptg' 'python-pysocks' 'python-hachoir' 'python-pillow')

sha256sums=('ee5468258872f5cf11c494d6d7fed2acdb40dfa9b022b3dcc9130f54d8562539')

_dirname="${pkgname#python-}-${pkgver}"
_basename="${pkgname#python-}"

# template start; name=pythonhosted; version=1;
source=("https://files.pythonhosted.org/packages/source/${_basename::1}/${_basename}/${_basename}-${pkgver}.tar.gz")
# template end;

# template start; name=python-wheel; version=1;
depends+=('python')
makedepends+=(python-build python-installer python-wheel)

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
