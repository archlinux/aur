# Maintainer: Martin Chang <marty188586@gmail.com>

pkgname=python-ttnn-git
pkgver=0.64.0.dev20251031.r9.g646de0ddcdb
pkgrel=1
pkgdesc='TT-NN operator and Tensor library for Tenstorrent hardware'
arch=('x86_64')
url='https://github.com/tenstorrent/tt-metal'
license=('Apache-2.0')
makedepends=(python-build python-installer python-wheel python-setuptools 'gcc>=12' 'cmake>=3.29' ninja wget pkg-config xz curl mold python-scikit-build-core 'sfpi>=7.5.0')
depends=('python>=3.10' hwloc numactl boost tbb capstone sfpi python python-loguru python-networkx python-graphviz python-numpy)
provides=("python-ttnn")
conflicts=("python-ttnn")
source=("tt-metal::git+https://github.com/tenstorrent/tt-metal")
sha256sums=('SKIP')
options=(!strip) # We don't want PKGBUILD stripping RISC-V binaries shipped with it

pkgver() {
    cd "$srcdir/tt-metal"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//'
}


prepare() {
    cd "$srcdir/tt-metal"
    git fetch --prune
    git submodule foreach --recursive git reset --hard
    git submodule update --init --recursive --remote

    # Dirty source patches (patching using the patch command is not stable enough)
    sed -i 's/\(setuptools.*\)==.*"/\1"/' pyproject.toml # Forced version but it doesn't really need it
    sed -i 's/\(numpy\)>.*"/\1"/' pyproject.toml # DITTO
    sed -i 's/"-DENABLE_CCACHE=TRUE"/"-DENABLE_CCACHE=TRUE", "-DENABLE_DISTRIBUTED=OFF", "-DTT_USE_SYSTEM_SFPI=ON", "-DCMAKE_CXX_COMPILER=c++", "-DCMAKE_C_COMPILER=cc", "-DCMAKE_CXX_FLAGS=-s"/' setup.py

    # Disable -Werror (sometimes triggers on GCC)
    find -name CMakeLists.txt | grep -v umd | grep -v './build' | grep -v './.cpmcache' | xargs -n 1 sed -i -E 's/-Werror([[:space:]]|$)/ /g'
}

build() {
    # patch deps
    cd "$srcdir/tt-metal"

    [[ -d dist ]] && (rm -r dist && mkdir dist)
    # makepkg generates debug symbols - they take forever to compress
    # and we are going to decompress it and repackage anyway
    CIBUILDWHEEL=1 WHEEL_COMPRESSION_LEVEL=0 python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/tt-metal"
    python -m installer --destdir="$pkgdir" dist/*.whl

    rm -rf $pkgdir/usr/lib/python*/site-packages/debian/ || true

    # Delete pyc
    find "$pkgdir" -name '*.pyc' -delete
    find "$pkgdir" -name '__pycache__' -type d -empty -delete
}
