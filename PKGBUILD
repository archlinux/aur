# Maintainer Torsten Keßler <t dot kessler at posteo dot de>

pkgname=rocsolver
pkgver=4.2.0
pkgrel=1
pkgdesc='Subset of LAPACK functionality on the ROCm platform'
arch=('x86_64')
url='https://rocsolver.readthedocs.io/en/latest/userguidedocu.html'
license=('BSD 2-Clause')
depends=('hip-rocclr' 'rocblas')
makedepends=('cmake' 'python' 'python-pyaml' 'rocm-cmake')
_git='https://github.com/ROCmSoftwarePlatform/rocSOLVER'
source=("$pkgname-$pkgver.tar.gz::$_git/archive/rocm-$pkgver.tar.gz")
sha256sums=('e9ef72d7c29e7c36bf02be63a64ca23b444e1ca71751749f7d66647873d9fdea')
_dirname="$(basename "$_git")-$(basename "${source[0]}" .tar.gz)"

build() {
    # -fcf-protection is not supported by HIP, see
    # https://github.com/ROCm-Developer-Tools/HIP/blob/rocm-4.2.x/docs/markdown/clang_options.md
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
