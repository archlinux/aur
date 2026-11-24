# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-k3fs
_name=${pkgname#python-}
pkgver=0.2.4
pkgrel=1
pkgdesc="File-system utilities for reading, writing, and directory operations"
provides=(${pkgname})
conflicts=(${pkgname})
arch=('any')
url="https://github.com/pykit3/k3fs"
_pydeps=(
    k3confloader
    psutil
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
    python-k3thread
    python-k3proc
    python-k3num
)
license=('MIT')
source=("${_name}::git+${url}.git#tag=v$pkgver")
sha256sums=('b92389961de2a9e6fa3439953b5d565ed33105d70a1c59d5376c5f43e1550f91')

prepare() {
    git -C "${srcdir}/${_name}" clean -dfx
}

build() {
    cd "${srcdir}/${_name}"
    python -m build --wheel --no-isolation
}

check() {
	cd "${srcdir}/${_name}"

	# Upstream tests assume a physical host: '/' is a real partition and '/dev'
	# is devtmpfs. In a chroot '/' is a bind/overlay mount and '/dev' is tmpfs,
	# so psutil.disk_partitions() output must be normalized for both cases.
	# Patch before pytest/k3fs import psutil.
	cat > "${srcdir}/sitecustomize.py" <<'PY'
import psutil

_orig = psutil.disk_partitions
_ROOT_FSTYPES = ("apfs", "hfs", "xfs", "ext2", "ext3", "ext4")


def _normalize(pt):
    if pt.mountpoint == "/dev" and pt.fstype == "tmpfs":
        return pt._replace(fstype="devtmpfs")
    if pt.mountpoint == "/" and pt.fstype not in _ROOT_FSTYPES:
        return pt._replace(fstype="ext4")
    return pt


def _disk_partitions(all=False):
    parts = [_normalize(p) for p in _orig(all=all)]
    if not all and not any(p.mountpoint == "/" for p in parts):
        root = next((p for p in _orig(all=True) if p.mountpoint == "/"), None)
        if root is not None:
            parts.append(_normalize(root))
    return parts


psutil.disk_partitions = _disk_partitions
PY

	export PYTHONPATH="${srcdir}${PYTHONPATH:+:${PYTHONPATH}}"
	# These tests call chown() to non-caller uid/gid and assert the new owner;
	# check() runs as an unprivileged user, so they can only pass as root.
	# Deselect uses prefix matching, so test_makedirs also covers *_with_config
	# and *_with_root_ids; test_read_write_file covers the uid/gid write case.
	pytest -x \
		--deselect=test/test_fs.py::TestFS::test_makedirs \
		--deselect=test/test_fs.py::TestFS::test_read_write_file \
		--deselect=test/test_fs.py::TestFS::test_write_file_with_config \
		--deselect=test/test_fs.py::TestFS::test_write_file_with_root_ids
}

package() {
    cd "${srcdir}/${_name}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -vDm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
