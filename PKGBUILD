# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-k3confloader
_name=${pkgname#python-}
pkgver=0.1.9
pkgrel=1
pkgdesc="Load configuration for pykit3 modules"
provides=(${pkgname})
conflicts=(${pkgname})
arch=('any')
url="https://github.com/pykit3/k3confloader"
_pydeps=(
    # k3conf
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
    python-k3proc
    python-k3ut
)
license=('MIT')
source=("${_name}::git+${url}.git#tag=v$pkgver")
sha256sums=('f1844f1b7dffb5ad5b79e5614fcc6c77b22a84ec0fb2f226e46cfd1d99298be8')

prepare() {
    git -C "${srcdir}/${_name}" clean -dfx
}

build() {
    cd "${srcdir}/${_name}"
    python -m build --wheel --no-isolation
}

check() {
	cd "${srcdir}/${_name}"

	# Build chroot has no MAC: uuid.getnode() falls back to a per-process
	# random node, so pin it for the pytest parent and k3proc children.
	cat > "${srcdir}/sitecustomize.py" <<'PY'
import uuid
uuid.getnode = lambda: 0x001122334455
PY

	export PYTHONPATH="${srcdir}${PYTHONPATH:+:${PYTHONPATH}}"
	pytest -x
}

package() {
    cd "${srcdir}/${_name}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -vDm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
