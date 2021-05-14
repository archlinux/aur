# Maintainer: Torsten Keßler <t dot kessler at posteo dot de>
# Contributor: acxz <akashpatel at yahoo dot com>
# Contributor: JP-Ellis <josh@jpellis.me>

pkgname=miopen-hip
pkgver=4.2.0
pkgrel=1
pkgdesc="AMD's Machine Intelligence Library (HIP backend)"
arch=('x86_64')
url="https://github.com/ROCmSoftwarePlatform/MIOpen"
license=('MIT')
depends=('rocblas' 'rocm-clang-ocl' 'hip-rocclr')
makedepends=('cmake' 'rocm-cmake' 'miopengemm')
provides=('miopen')
conflicts=('miopen')
source=("$pkgname-$pkgver.tar.gz::$url/archive/rocm-$pkgver.tar.gz"
        'boost-1.72-download.patch')
sha256sums=('8ab02e784c8b3471159794766ed6303c333b33c69dc5186c0930e56504373b7c'
            '25fd11b55180801f609f454d0d14c8dd8a3ca65217bcebad7eb8edfbaec67c5d')
_dirname="$(basename "$url")-$(basename "${source[0]}" .tar.gz)"

prepare() {
    cd "$_dirname"
    patch -Np1 -i "$srcdir/boost-1.72-download.patch"
}

build() {
  cd "$_dirname"

  # -fcf-protection is not supported by HIP, see
  # https://github.com/ROCm-Developer-Tools/HIP/blob/rocm-4.2.x/docs/markdown/clang_options.md
  # -fPIC fixes linking errors with boost.
  export CXX=/opt/rocm/llvm/bin/clang++
  export CXXFLAGS="${CXXFLAGS} -fcf-protection=none -fPIC"

  cmake -P install_deps.cmake \
        --minimum --prefix "$srcdir/deps"

  cmake -B build -Wno-dev \
        -DMIOPEN_BACKEND=HIP \
        -DCMAKE_INSTALL_PREFIX=/opt/rocm \
        -DCMAKE_PREFIX_PATH="$srcdir/deps"

  make -C build
}

package() {
  DESTDIR="$pkgdir" make -C "$_dirname/build" install

  install -d "$pkgdir/etc/ld.so.conf.d"
  cat << EOF > "$pkgdir/etc/ld.so.conf.d/miopen.conf"
/opt/rocm/miopen/lib
EOF

  install -Dm644 "$srcdir/$_dirname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
