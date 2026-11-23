# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-k3confloader
_name=${pkgname#python-}
pkgver=0.1.8
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
sha256sums=('267646789eea33bb85b594c36440c1837177e084ace98a0541c26aaae402180a')

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
