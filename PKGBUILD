# Maintainer Torsten Keßler <t dot kessler at posteo dot de>

pkgname=hipsolver
pkgver=5.0.2
pkgrel=1
pkgdesc='rocSOLVER marshalling library.'
arch=('x86_64')
url='https://hipsolver.readthedocs.io/en/latest/userguide_index.html'
license=('MIT')
depends=('hip' 'rocsolver')
makedepends=('cmake' 'git' 'gcc-fortran')
_git='https://github.com/ROCmSoftwarePlatform/hipSOLVER'
source=("$pkgname-$pkgver.tar.gz::$_git/archive/rocm-$pkgver.tar.gz")
sha256sums=('cabeada451686ed7904a452c5f8fd3776721507db1c06f426cd8d7189ff4a441')
_dirname="$(basename "$_git")-$(basename "${source[0]}" ".tar.gz")"

build() {
  # -fcf-protection is not supported by HIP, see
  # https://github.com/ROCm-Developer-Tools/HIP/blob/rocm-5.0.x/docs/markdown/clang_options.md
  CXX=/opt/rocm/bin/hipcc \
  CXXFLAGS="${CXXFLAGS} -fcf-protection=none" \
  cmake -Wno-dev -S "$_dirname" \
        -DCMAKE_INSTALL_PREFIX=/opt/rocm
  make
}

package() {
  DESTDIR="$pkgdir" make install

  install -Dm644 /dev/stdin "$pkgdir/etc/ld.so.conf.d/hipsolver.conf" << EOF
/opt/rocm/hipsolver/lib
EOF
  install -Dm644 "$srcdir/$_dirname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
