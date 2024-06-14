# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>

_name=pyre-check
_py=py3
pkgname=pyre-check-bin
pkgver=0.9.18
pkgrel=1
pkgdesc="Performant type-checking for Python"
arch=('any')
url="https://pyre-check.org/"
license=('MIT')
depends=(
    'python-click'
    'python-dataclasses-json'
    'python-intervaltree'
    'python-libcst'
    'python-psutil'
    'python-pyre_extensions'
    'python-tabulate'
    'python-testslide'
    'python-typing_extensions'
)
provides=('pyre-check')
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/${_name/-/_}-$pkgver-$_py-none-manylinux1_x86_64.whl")
sha256sums=('5659d4dbd6d1dd3052359861d828419f07d1ced1dad4ce4ca79071d252699c26')

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
