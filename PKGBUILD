# Maintainer Torsten Keßler <t dot kessler at posteo dot de>

pkgname=rocsolver
pkgver=4.5.0
pkgrel=1
pkgdesc='Subset of LAPACK functionality on the ROCm platform'
arch=('x86_64')
url='https://rocsolver.readthedocs.io/en/latest/userguidedocu.html'
license=('BSD 2-Clause')
depends=('hip' 'rocblas')
makedepends=('cmake' 'fmt' 'python' 'python-pyaml' 'rocm-cmake')
_git='https://github.com/ROCmSoftwarePlatform/rocSOLVER'
source=("$pkgname-$pkgver.tar.gz::$_git/archive/rocm-$pkgver.tar.gz")
sha256sums=('0295862da941f31f4d43b19195b79331bd17f5968032f75c89d2791a6f8c1e8c')
_dirname="$(basename "$_git")-$(basename "${source[0]}" .tar.gz)"

build() {
    # -fcf-protection is not supported by HIP, see
    # https://github.com/ROCm-Developer-Tools/HIP/blob/rocm-4.5.x/docs/markdown/clang_options.md
    CXX=/opt/rocm/bin/hipcc \
    CXXFLAGS="${CXXFLAGS} -fcf-protection=none" \
    cmake   -B build -Wno-dev \
            -S "$_dirname" \
            -DCMAKE_INSTALL_PREFIX=/opt/rocm \
            -DCMAKE_PREFIX_PATH=/opt/rocm/llvm/lib/cmake/llvm \
            -DBUILD_CLIENTS_TESTS=OFF \
            -DBUILD_CLIENTS_BENCHMARKS=OFF
    make -C build
}

package() {
    DESTDIR="$pkgdir" make -C build install

    install -Dm644 /dev/stdin "$pkgdir/etc/ld.so.conf.d/$pkgname.conf" <<-EOF
        /opt/rocm/$pkgname/lib
EOF
    install -Dm644 "$_dirname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
