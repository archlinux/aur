# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-k3http
_name=${pkgname#python-}
pkgver=0.1.10
pkgrel=1
pkgdesc="HTTP multipart form data encoder"
provides=(${pkgname})
conflicts=(${pkgname})
arch=('any')
url="https://github.com/pykit3/k3http"
_pydeps=(
    k3stopwatch
)
depends=('python'
    "${_pydeps[@]/#/python-}")
makedepends=(
    git
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
checkdepends=(
    python-pytest
    python-k3ut
)
license=('MIT')
source=("${_name}::git+${url}.git#tag=v$pkgver")
sha256sums=('10e24a55aebb80b4dda5d9365f62ca6a773478a4037bfc7b15083d58ab7b2eac')

prepare() {
    git -C "${srcdir}/${_name}" clean -dfx
}

build() {
    cd "${srcdir}/${_name}"
    python -m build --wheel --no-isolation
}

check() {
	cd "${srcdir}/${_name}"

	# k3http.__getattr__ uses importlib.metadata.version("k3http"); doctest
	# enumerates it, so the built distribution metadata must be visible.
	# Install the wheel into a temp DESTDIR and put its site-packages on
	# PYTHONPATH after the source tree (source code still takes precedence).
	python -m installer --destdir="${srcdir}/check-install" dist/*.whl
	local _site
	_site=$(find "${srcdir}/check-install" -type d -name site-packages | head -1)

	export PYTHONPATH="${srcdir}${_site:+:${_site}}${PYTHONPATH:+:${PYTHONPATH}}"
	pytest -x
}

package() {
    cd "${srcdir}/${_name}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -vDm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
