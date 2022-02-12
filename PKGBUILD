# Maintainer: Torsten Keßler <t dot kessler at posteo dot de>
# Contributor: Jakub Okoński <jakub@okonski.org>
pkgname=rocrand
pkgver=5.0.0
pkgrel=1
pkgdesc='Pseudo-random and quasi-random number generator on ROCm'
arch=('x86_64')
url='https://rocmdocs.amd.com/en/latest/ROCm_Libraries/ROCm_Libraries.html#rocrand'
license=('MIT')
depends=('hip')
makedepends=('cmake' 'git' 'gcc-fortran' 'python')
optdepends=('gcc-fortran: Use Fortran wrapper'
            'python: Use Python wrapper')
_git='https://github.com/ROCmSoftwarePlatform/rocRAND'
source=("$pkgname-$pkgver.tar.gz::$_git/archive/rocm-$pkgver.tar.gz")
sha256sums=('356a03a74d6d5df3ae2d38da07929f23d90bb4dee71f88792c25c25069e673bc')
_dirname="$(basename "$_git")-$(basename "${source[0]}" ".tar.gz")"

build() {
  # -fcf-protection is not supported by HIP, see
  # https://github.com/ROCm-Developer-Tools/HIP/blob/rocm-5.0.x/docs/markdown/clang_options.md

  CXX=/opt/rocm/hip/bin/hipcc \
  CXXFLAGS="${CXXFLAGS} -fcf-protection=none" \
  cmake -Wno-dev -S "$_dirname" \
        -DCMAKE_INSTALL_PREFIX=/opt/rocm \
        -DBUILD_TEST=OFF
  make
}

package() {
  DESTDIR="$pkgdir" make install

  install -Dm644 /dev/stdin "$pkgdir/etc/ld.so.conf.d/rocrand.conf" << EOF
/opt/rocm/hiprand/lib
/opt/rocm/rocrand/lib
EOF
  install -Dm644 "$_dirname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Some packages search for {roc,hip}rand includes in /opt/rocm/include/{roc,hip}rand
  install -d "$pkgdir/opt/rocm/include"
  ln -s "/opt/rocm/hiprand/include/" "$pkgdir/opt/rocm/include/hiprand"
  ln -s "/opt/rocm/rocrand/include/" "$pkgdir/opt/rocm/include/rocrand"
}
