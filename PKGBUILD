# Maintainer Torsten Keßler <t dot kessler at posteo dot de>

pkgname=rocsolver
pkgver=3.3.0
pkgrel=1
pkgdesc='Subset of LAPACK functionality on the ROCm platform'
arch=('x86_64')
url='https://rocsolver.readthedocs.io/en/latest/userguidedocu.html'
license=('BSD 2-Clause')
depends=('hip-hcc' 'rocblas')
makedepends=('cmake' 'hcc' 'python' 'python-pyaml' 'rocm-cmake' 'llvm-amdgpu')
_git='https://github.com/ROCmSoftwarePlatform/rocSOLVER'
source=("$pkgname-$pkgver.tar.gz::$_git/archive/$pkgver.tar.gz")
sha256sums=('abbc454fdc66bde13b1e1bfe7c2ae0d57ff9ac6704bc4dde6db390303d6f1b95')
_dirname="$(basename "$_git")-$(basename "${source[0]}" .tar.gz)"

build() {
    mkdir -p build
    cd build

    CXX=/opt/rocm/hcc/bin/hcc \
    cmake   -DCMAKE_INSTALL_PREFIX=/opt/rocm \
            -DCMAKE_PREFIX_PATH=/opt/rocm/llvm/lib/cmake/llvm \
            -DBUILD_CLIENTS_SAMPLES=OFF \
            -DBUILD_CLIENTS_TESTS=OFF \
            -DBUILD_CLIENTS_BENCHMARKS=OFF \
            "../$_dirname"

    make
}

package() {
    cd "$srcdir/build"
    make DESTDIR="$pkgdir" install

    install -Dm644 /dev/stdin "$pkgdir/etc/ld.so.conf.d/$pkgname.conf" <<-EOF
        /opt/rocm/$pkgname/lib
EOF
    install -Dm644 "$srcdir/$_dirname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
