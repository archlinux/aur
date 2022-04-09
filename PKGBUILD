# Maintainer: Torsten Keßler <t dot kessler at posteo dot de>
# Contributor: Jakub Okoński <jakub@okonski.org>
# Contributor: Markus Näther <naetherm@cs.uni-freiburg.de>
pkgname=rocfft
pkgver=5.1.1
pkgrel=1
pkgdesc='Next generation FFT implementation for ROCm'
arch=('x86_64')
url='https://rocmdocs.amd.com/en/latest/ROCm_Libraries/ROCm_Libraries.html#rocfft'
license=('MIT')
depends=('hip')
makedepends=('cmake')
_git='https://github.com/ROCmSoftwarePlatform/rocFFT'
source=("$pkgname-$pkgver.tar.gz::$_git/archive/rocm-$pkgver.tar.gz")
sha256sums=('1006c869bcf2886fc51ca69946771083184e3664aadb51a706c34975c2782f8a')
options=(!lto)
_dirname="$(basename "$_git")-$(basename "${source[0]}" ".tar.gz")"

build() {
  local cmake_args=(-DCMAKE_INSTALL_PREFIX=/opt/rocm
                    -DCMAKE_CXX_COMPILER=hipcc)
  if [[ -n "$AMDGPU_TARGETS" ]]; then
      cmake_args+=(-DAMDGPU_TARGETS="$AMDGPU_TARGETS")
  fi

  # -fcf-protection is not supported by HIP, see
  # https://github.com/ROCm-Developer-Tools/HIP/blob/develop/docs/markdown/clang_options.md
  CXXFLAGS="${CXXFLAGS} -fcf-protection=none" \
  cmake -B build \
        -S "$_dirname" \
        "${cmake_args[@]}"
  make -C build
}

package() {
  DESTDIR="$pkgdir" make -C build install

  install -Dm644 /dev/stdin "$pkgdir/etc/ld.so.conf.d/rocfft.conf" << EOF
/opt/rocm/rocfft/lib
EOF
  install -Dm644 "$srcdir/$_dirname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
