# Maintainer: Simon Reiser <me AT sfxr DOT de>
# Original Maintainer: Eduardo Sánchez Muñoz

pkgname=(cling-git cling-jupyter-git)
pkgver=r5123.45318c5a
pkgrel=1
pkgdesc="Interactive C++ interpreter built on the top of LLVM and Clang libraries."
arch=('i686' 'x86_64')
url="https://root.cern.ch/cling"
license=('custom:Cling Release License')
makedepends=('cmake' 'libffi' 'git' 'python' 'jupyter-notebook' 'ninja')
options=('!lto')  # getting huge RAM usage with LTO (and extra/llvm disables LTO as well)
source=(
    "cling-llvm::git+https://github.com/root-project/llvm-project.git#branch=cling-llvm13"
    "cling::git+https://github.com/root-project/cling.git#branch=master"
)
sha256sums=(
    'SKIP'
    'SKIP'
)

pkgver() {
    cd "$srcdir/cling"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
    if [ ! -h "$srcdir/cling-llvm/llvm/tools/clang" ]; then
        ln -s "../../clang" "$srcdir/cling-llvm/llvm/tools/clang"
    fi
    if [ ! -h "$srcdir/cling-llvm/llvm/tools/cling" ]; then
        ln -s "$srcdir/cling" "$srcdir/cling-llvm/llvm/tools/cling"
    fi
}

build() {
    mkdir -p "$srcdir/cling-build"

    cmake \
        -S "$srcdir/cling-llvm/llvm" \
        -B "$srcdir/cling-build" \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX="/opt/cling" \
        -DLLVM_TARGETS_TO_BUILD="host;NVPTX" \
        -DLLVM_BUILD_LLVM_DYLIB=OFF \
        -DLLVM_ENABLE_RTTI=ON \
        -DLLVM_ENABLE_FFI=ON \
        -DLLVM_BUILD_DOCS=OFF \
        -DLLVM_ENABLE_SPHINX=OFF \
        -DLLVM_ENABLE_DOXYGEN=OFF \
        -DFFI_INCLUDE_DIR=$(pkg-config --cflags-only-I libffi | cut -c3-) \

    ninja -C "$srcdir/cling-build" #clang cling
}

package_cling-git() {
    depends=('libffi')

    DESTDIR="$pkgdir" ninja -C "$srcdir/cling-build" install

    install -d "$pkgdir/usr/bin"
    ln -s "/opt/cling/bin/cling" "$pkgdir/usr/bin/cling"

    install -Dm644 "$srcdir/cling/LICENSE.TXT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_cling-jupyter-git() {
    depends=('cling-git' 'jupyter-notebook')

    cd "$srcdir/cling/tools/Jupyter/kernel"
    python3 setup.py install --prefix=/usr --root="$pkgdir"
    jupyter-kernelspec install --prefix="$pkgdir/usr" .
}
