# Maintainer: Martin Chang <marty188586@gmail.com>

pkgname=python-ttnn
pkgver=0.62.2
pkgrel=1
pkgdesc='TT-NN operator and Tensor library for Tenstorrent hardware'
arch=('x86_64')
url='https://github.com/tenstorrent/tt-metal'
license=('Apache-2.0')
makedepends=(python-build python-installer python-wheel python-setuptools 'gcc>=12' 'cmake>=3.29' ninja wget pkg-config xz curl mold)
depends=('python>=3.10' hwloc numactl boost tbb capstone sfpi python python-loguru python-networkx python-graphviz python-numpy)
provides=("python-ttnn")
conflicts=("python-ttnn")
source=("tt-metal::git+https://github.com/tenstorrent/tt-metal"
    'cmake-disable-tools.patch'
    'ttmetal-disable-tools.patch'
    'pyptoject-hack-deps.patch'
    'setup-py-set-flags.patch'
    'cmake-enable-advanced-linking.patch'
)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

prepare() {
    cd "$srcdir/tt-metal"
    git submodule update --init --recursive

    patch -Np1 -i ../cmake-disable-tools.patch
    patch -Np1 -i ../ttmetal-disable-tools.patch
    patch -Np1 -i ../pyptoject-hack-deps.patch
    patch -Np1 -i ../setup-py-set-flags.patch
    patch -i ../cmake-enable-advanced-linking.patch
}

build() {
    # patch deps
    cd "$srcdir/tt-metal"

    ln -s build_Release build || true
    [[ -d dist ]] && (rm -r dist && mkdir dist)
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/tt-metal"
    python -m installer --destdir="$pkgdir" dist/*.whl

    rm -rf $pkgdir/usr/lib/python*/site-packages/debian/ || true

    # Delete pyc
    find "$pkgdir" -name '*.pyc' -delete
    find "$pkgdir" -name '__pycache__' -type d -empty -delete
}
