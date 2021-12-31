# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>

_name=pyre-check
_py=py3
pkgname=pyre-check-bin
pkgver=0.9.9
pkgrel=1
pkgdesc="Performant type-checking for Python"
arch=('any')
url="https://pyre-check.org/"
license=('MIT')
depends=('python')
provides=('pyre-check')
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/${_name/-/_}-$pkgver-$_py-none-manylinux1_x86_64.whl")
sha256sums=('809717c2134b814f05128e3c6c06dd88cd8cdb5a6e4304d10ccf9813bc7bbf0a')

package() {
	_python_version=$(python -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')")

	PIP_CONFIG_FILE=/dev/null pip install \
		--isolated \
		--root="$pkgdir" \
		--ignore-installed \
		--no-deps \
		--no-warn-script-location \
		./*.whl

	python -O -m compileall "${pkgdir}/usr/lib/python${_python_version}/site-packages/pyre_check"

	install -D -m644 \
		"${pkgdir}/usr/lib/python${_python_version}/site-packages/pyre_check-${pkgver}.dist-info/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
