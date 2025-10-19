# Maintainer: Martin Chang <marty188586@gmail.com>

pkgname=python-ttnn-git
pkgver=0.62.0.dev20251019.r0.gbb02171262f
pkgrel=4
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
options=(!strip)

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
    sed -i 's/\[tool.scikit-build.cmake.define\]/\[tool.scikit-build.cmake.define\]\nENABLE_DISTRIBUTED = "OFF"\n/' pyproject.toml

    # Disable -Werror (sometimes triggers on GCC)
    find -name CMakeLists.txt | grep -v './build' | grep -v './.cpmcache' | xargs -n 1 sed -i -E 's/-Werror([[:space:]]|$)/ /g'
}

build() {
    # patch deps
    cd "$srcdir/tt-metal"

    [[ -d dist ]] && (rm -r dist && mkdir dist)
    # makepkg generates debug symbols - they take forever to compress
    # and we are going to decompress it and repackage anyway
    WHEEL_COMPRESSION_LEVEL=0 python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/tt-metal"
    python -m installer --destdir="$pkgdir" dist/*.whl

    rm -rf $pkgdir/usr/lib/python*/site-packages/debian/ || true

    strip --strip-unneeded "$pkgdir"/usr/lib/python*/site-packages/ttnn/*.so

    # Delete pyc
    find "$pkgdir" -name '*.pyc' -delete
    find "$pkgdir" -name '__pycache__' -type d -empty -delete
}
