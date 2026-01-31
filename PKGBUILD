# Maintainer: Martin Larralde <martin.larralde@embl.de>

_name=pyjess
pkgname=python-${_name}
pkgver=0.9.1
pkgrel=3
pkgdesc="Cython bindings and Python interface to Jess, a 3D template matching software."
url="https://github.com/althonos/pyjess"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=("MIT")
depends=('python')
makedepends=('cython' 'python-build' 'python-installer' 'cmake' 'ninja' 'python-scikit-build-core' 'git')
source=(
  "git+https://github.com/althonos/pyjess#tag=v$pkgver"
  "git+https://github.com/iriziotis/jess"
)
sha256sums=('41d158ffe83b7d52877ef40346d2395a089b7d7717823063dfba984cd4771423'
            'SKIP')

prepare() {
    repo="pyjess"
    git -C $repo submodule init
    git -C $repo config submodule.jess.url "file://$srcdir/jess"
    git -C $repo submodule update
}

build() {
    cd "${srcdir}/${_name}"
    python -m build --wheel --no-isolation
}

check() {
    local machine=$(python -c 'import platform; print(platform.machine())')
    whl="${srcdir}/${_name}/dist/${_name}-${pkgver}-cp38-abi3-linux_${machine}.whl"

    if [ -e "${srcdir}/env" ]; then rm -rd "${srcdir}/env"; fi
    python -m venv --symlinks --system-site-packages "${srcdir}/env"
    source "${srcdir}/env/bin/activate"
    python -m installer "$whl"

    python -m unittest ${_name}.tests
}

package() {
    local machine=$(python -c 'import platform; print(platform.machine())')
    whl="${srcdir}/${_name}/dist/${_name}-${pkgver}-cp38-abi3-linux_${machine}.whl"

    python -m installer --prefix="${pkgdir}/usr" "$whl"
    install -Dm644  "${srcdir}/${_name}/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
