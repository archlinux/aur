# Maintainer: Martin Chang <marty188586@gmail.com>

pkgname=python-ttnn
pkgver=0.63.0
pkgrel=2
pkgdesc='TT-NN operator and Tensor library for Tenstorrent hardware'
arch=('x86_64')
url='https://github.com/tenstorrent/tt-metal'
license=('Apache-2.0')
makedepends=(python-build python-installer python-wheel python-setuptools 'gcc>=12' 'cmake>=3.29' ninja wget pkg-config xz curl mold python-pycapnp)
depends=('python>=3.10' hwloc numactl boost tbb capstone sfpi python python-loguru python-networkx python-graphviz python-numpy)
provides=("python-ttnn")
conflicts=("python-ttnn")
source=("tt-metal::git+https://github.com/tenstorrent/tt-metal.git#tag=v${pkgver}")
sha256sums=('SKIP')
options=(!strip)

prepare() {
    cd "$srcdir/tt-metal"
    git submodule update --init --recursive

    # Dirty source patches (patching using the patch command is not stable enough)
    sed -i '/add_subdirectory(tools)/d' CMakeLists.txt # Does not build (most likely LTO)
    sed -i '/add_subdirectory(tools)/d' tt_metal/CMakeLists.txt # Does not build (most likely LTO)
    sed -i '/add_subdirectory(examples)/d' ttnn/CMakeLists.txt # Not used in output
    sed -i 's/#\(include(linking)\)/\1/' CMakeLists.txt # Arch is new enough that we can use the better linking parameters
    sed -i 's/\(setuptools.*\)==.*"/\1"/' pyproject.toml # Forced version but it doesn't really need it
    sed -i 's/\(numpy\)>.*"/\1"/' pyproject.toml # DITTO
    sed -i 's/--release"/--release", "--cxx-compiler-path=g++", "--c-compiler-path=gcc", "--without-distributed"/' setup.py # Need more flags but no palce to invoke from build() - hack script
    sed -i 's/"lib64" if/"lib" if/' setup.py # Bad assumption. Arch installs to lib even if lib64 exist
    sed -i '/copy_tree_with_patterns(build_dir \/ get_lib_dir(), self.build_lib + f"\/ttnn\/build\/lib", lib_patterns)/{p; s|get_lib_dir()|"ttnn"| }' setup.py # Additional install needed

    # Disable -Werror (sometimes triggers on GCC)
    find -name CMakeLists.txt | grep -v './build' | grep -v './.cpmcache' | xargs -n 1 sed -i -E 's/-Werror([[:space:]]|$)/ /g'

}

build() {
    # patch deps
    cd "$srcdir/tt-metal"

    # ln -s build_Release build || true
    [[ -d dist ]] && (rm -r dist && mkdir dist)
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/tt-metal"
    python -m installer --destdir="$pkgdir" dist/*.whl

    rm -rf $pkgdir/usr/lib/python*/site-packages/debian/ || true

    strip --strip-unneeded "$pkgdir"/usr/lib/python*/site-packages/ttnn/*.so
    strip --strip-unneeded "$pkgdir"/usr/lib/python*/site-packages/ttnn/build/lib/*.so

    # Delete pyc
    find "$pkgdir" -name '*.pyc' -delete
    find "$pkgdir" -name '__pycache__' -type d -empty -delete
}
