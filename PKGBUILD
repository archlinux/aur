# Maintainer: Torsten Keßler <t dot kessler at posteo dot de>
# Contributor: Jakub Okoński <jakub@okonski.org>
# Contributor: Markus Näther <naetherm@cs.uni-freiburg.de>
pkgname=rocfft
pkgver=5.1.3
pkgrel=1
pkgdesc='Next generation FFT implementation for ROCm'
arch=('x86_64')
url='https://rocmdocs.amd.com/en/latest/ROCm_Libraries/ROCm_Libraries.html#rocfft'
license=('MIT')
depends=('hip')
makedepends=('cmake')
_git='https://github.com/ROCmSoftwarePlatform/rocFFT'
source=("$pkgname-$pkgver.tar.gz::$_git/archive/rocm-$pkgver.tar.gz")
sha256sums=('b4fcd03c1b07d465bb307ec33cc7fb50036dff688e497c5e52b2dec37f4cb618')
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
