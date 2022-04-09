# Maintainer Torsten Keßler <t dot kessler at posteo dot de>

pkgname=hipfft
pkgver=5.1.0
pkgrel=1
pkgdesc='rocFFT marshalling library.'
arch=('x86_64')
url='https://github.com/ROCmSoftwarePlatform/hipFFT'
license=('MIT')
depends=('hip' 'rocfft')
makedepends=('cmake' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/rocm-$pkgver.tar.gz")
sha256sums=('1bac7761c055355216cd262cdc0450aabb383addcb739b56ba849b2e6e013fa5')
_dirname="$(basename "$url")-$(basename "${source[0]}" ".tar.gz")"

build() {
  # -fcf-protection is not supported by HIP, see
  # https://github.com/ROCm-Developer-Tools/HIP/blob/rocm-5.0.x/docs/markdown/clang_options.md
  CXX=/opt/rocm/bin/hipcc \
  CXXFLAGS="${CXXFLAGS} -fcf-protection=none" \
  cmake -Wno-dev -S "$_dirname" \
        -DCMAKE_INSTALL_PREFIX=/opt/rocm \
        -DBUILD_CLIENTS_SAMPLES=OFF \
        -DBUILD_CLIENTS_TESTS=OFF \
        -DAMDGPU_TARGETS=${AMDGPU_TARGETS:-gfx803;gfx900;gfx906;gfx908}
  make
}

package() {
  DESTDIR="$pkgdir" make install

  install -Dm644 /dev/stdin "$pkgdir/etc/ld.so.conf.d/hipfft.conf" << EOF
/opt/rocm/hipfft/lib
EOF
  install -Dm644 "$srcdir/$_dirname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
