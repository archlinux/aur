# Maintainer Torsten Keßler <t dot kessler at posteo dot de>

pkgname=hipfft
pkgver=5.1.1
pkgrel=1
pkgdesc='rocFFT marshalling library.'
arch=('x86_64')
url='https://github.com/ROCmSoftwarePlatform/hipFFT'
license=('MIT')
depends=('hip' 'rocfft')
makedepends=('cmake' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/rocm-$pkgver.tar.gz")
sha256sums=('e9519d746ee01ba96669182c0159d687d36abb4b5e4cd7d4c22cad29b9856e00')
_dirname="$(basename "$url")-$(basename "${source[0]}" ".tar.gz")"

build() {
  local cmake_args=(-DCMAKE_INSTALL_PREFIX=/opt/rocm
                    -DBUILD_CLIENTS_SAMPLES=OFF
                    -DBUILD_CLIENTS_TESTS=OFF)
  if [[ -n "$AMDGPU_TARGETS" ]]; then
      cmake_args+=(-DAMDGPU_TARGETS="$AMDGPU_TARGETS")
  fi
  # -fcf-protection is not supported by HIP, see
  # https://github.com/ROCm-Developer-Tools/HIP/blob/rocm-5.0.x/docs/markdown/clang_options.md
  CXX=/opt/rocm/bin/hipcc \
  CXXFLAGS="${CXXFLAGS} -fcf-protection=none" \
  cmake -Wno-dev -S "$_dirname" \
        "${cmake_args[@]}"
  make
}

package() {
  DESTDIR="$pkgdir" make install

  install -Dm644 /dev/stdin "$pkgdir/etc/ld.so.conf.d/hipfft.conf" << EOF
/opt/rocm/hipfft/lib
EOF
  install -Dm644 "$srcdir/$_dirname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
