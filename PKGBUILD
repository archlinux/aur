# Maintainer: Martin Chang <marty188586@gmail.com>

pkgname=python-ttnn-git
pkgver=0.62.0.dev20250919.r12.g3168af4a952
pkgrel=3
pkgdesc='TT-NN operator and Tensor library for Tenstorrent hardware'
arch=('x86_64')
url='https://github.com/tenstorrent/tt-metal'
license=('Apache-2.0')
makedepends=(python-build python-installer python-wheel python-setuptools 'gcc>=12' 'cmake>=3.29' ninja wget pkg-config xz curl mold)
depends=('python>=3.10' hwloc numactl boost tbb capstone sfpi python python-loguru python-networkx python-graphviz python-numpy)
provides=("python-ttnn")
conflicts=("python-ttnn")
source=("tt-metal::git+https://github.com/tenstorrent/tt-metal")
sha256sums=('SKIP')
options=(!strip)

pkgver() {
    cd "$srcdir/tt-metal"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//'
}


prepare() {
    cd "$srcdir/tt-metal"
    git submodule update --init --recursive

    # Dirty sortce patches (patching using the patch command is not stable enough)
    sed -i 's/\(add_subdirectories(tools)\)/#\1/' CMakeLists.txt
    sed -i 's/\(add_subdirectories(tools)\)/#\1/' tt_metal/CMakeLists.txt
    sed -i 's/#\(include(linking)\)/\1/' CMakeLists.txt
    sed -i 's/\(setuptools.*\)==.*"/\1"/' pyproject.toml
    sed -i 's/\(numpy\)>.*"/\1"/' pyproject.toml
    sed -i 's/--release"/--release", "--cxx-compiler-path=g++", "--c-compiler-path=gcc", "--without-distributed"/' setup.py
    sed -i 's/"lib64" if/"lib" if/' setup.py
    sed -i 's|copy_tree_with_patterns(build_dir / get_lib_dir(), self.build_lib + f"/ttnn/build/lib", lib_patterns)|copy_tree_with_patterns(build_dir / get_lib_dir(), self.build_lib + f"/ttnn/build/lib", lib_patterns);copy_tree_with_patterns(build_dir / "ttnn", self.build_lib + f"/ttnn/build/lib", lib_patterns)|' setup.py
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
