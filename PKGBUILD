# Maintainer Torsten Keßler <t dot kessler at posteo dot de>

pkgname=rocsolver
pkgver=5.0.1
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
sha256sums=('0086d673ed47b8713ea2906061c59f30ed4b5bd6181a1702428ca7dc6a8c14f8'
            'SKIP')
_dirname="$(basename "$_git")-$(basename "${source[0]}" .tar.gz)"

prepare() {
    cd "${_dirname}"
    patch --forward --strip=1 --input="${srcdir}/fmt.patch"
}

build() {
    # -fcf-protection is not supported by HIP, see
    # https://github.com/ROCm-Developer-Tools/HIP/blob/develop/docs/markdown/clang_options.md
    CXX=/opt/rocm/bin/hipcc \
    CXXFLAGS="${CXXFLAGS} -fcf-protection=none" \
    cmake   -B build \
            -S "$_dirname" \
            -DCMAKE_INSTALL_PREFIX=/opt/rocm
    make -C build
}

package() {
    DESTDIR="$pkgdir" make -C build install

    install -Dm644 /dev/stdin "$pkgdir/etc/ld.so.conf.d/$pkgname.conf" <<-EOF
        /opt/rocm/$pkgname/lib
EOF
    install -Dm644 "$_dirname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
