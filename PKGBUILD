# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>

_name=pyre-check
_py=py3
pkgname=pyre-check-bin
pkgver=0.9.3
pkgrel=1
pkgdesc="Performant type-checking for Python"
arch=('any')
url="https://pyre-check.org/"
license=('MIT')
depends=('python')
provides=('pyre-check')
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/${_name/-/_}-$pkgver-$_py-none-manylinux1_x86_64.whl")
sha256sums=('ed000307bcc7999b6e651bd8fa3d7716d6b3cc272855bf677643438f77ff54c1')

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
