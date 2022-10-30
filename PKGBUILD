# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>

_name=pyre_extensions
_py=py3
pkgname=python-pyre_extensions-bin
pkgver=0.0.30
pkgrel=1
pkgdesc="Extensions to the typing module supported by Pyre"
arch=('any')
url="https://pyre-check.org/"
license=('MIT')
depends=(
    'python-typing_extensions'
    'python-typing_inspect'
)
provides=('python-pyre_extensions')
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/${_name/-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('32b37ede4eed0ea879fdd6d84e0c7811e129f19b76614f1be3a6b47f9a4b1fa0')

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
		"${pkgdir}/usr/lib/python${_python_version}/site-packages/pyre_extensions-${pkgver}.dist-info/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
