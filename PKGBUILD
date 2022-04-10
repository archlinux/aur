# Maintainer Torsten Keßler <t dot kessler at posteo dot de>

pkgname=rocsolver
pkgver=5.1.1
pkgrel=1
pkgdesc='Subset of LAPACK functionality on the ROCm platform'
arch=('x86_64')
url='https://rocsolver.readthedocs.io/en/latest/userguidedocu.html'
license=('BSD 2-Clause')
depends=('hip' 'rocblas')
makedepends=('cmake' 'fmt' 'python' 'python-pyaml' 'rocm-cmake')
_git='https://github.com/ROCmSoftwarePlatform/rocSOLVER'
source=("$pkgname-$pkgver.tar.gz::$_git/archive/rocm-$pkgver.tar.gz"
        "fmt.patch::https://github.com/acxz/rocSOLVER/commit/0f4658e04ac7b48fea213f29b209a0206b67c43f.patch")
sha256sums=('7b81d7d8ca5fcb86a4e1ac824e7ac884f635c61bf593e91a9322fc925aae8276'
            '3c2935fea8136ce6d1078318a50aa3c58bd39384da7e3a7e12e8d7fec5e31f69')
_dirname="$(basename "$_git")-$(basename "${source[0]}" .tar.gz)"

prepare() {
    cd "${_dirname}"
    patch -Np1 -i "${srcdir}/fmt.patch"
}

build() {
    local cmake_args=(-DCMAKE_INSTALL_PREFIX=/opt/rocm)
    if [[ -n "$AMDGPU_TARGETS" ]]; then
        cmake_args+=(-DAMDGPU_TARGETS="$AMDGPU_TARGETS")
    fi
    # -fcf-protection is not supported by HIP, see
    # https://github.com/ROCm-Developer-Tools/HIP/blob/develop/docs/markdown/clang_options.md
    CXX=/opt/rocm/bin/hipcc \
    CXXFLAGS="${CXXFLAGS} -fcf-protection=none" \
    cmake   -B build \
            -S "$_dirname" \
            "${cmake_args[@]}"
    make -C build
}

package() {
    DESTDIR="$pkgdir" make -C build install

    install -Dm644 /dev/stdin "$pkgdir/etc/ld.so.conf.d/$pkgname.conf" <<-EOF
        /opt/rocm/$pkgname/lib
EOF
    install -Dm644 "$_dirname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
