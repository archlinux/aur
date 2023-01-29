# Maintainer: Dr-Noob <peibolms at gmail dot com>
# Contributor: Dr-Noob <peibolms at gmail dot com>
_name=gpufetch
pkgname="$_name-git"
pkgver=0.10.r0.gf4a96ce
pkgrel=1
pkgdesc="Simple yet fancy GPU architecture fetching tool"
arch=('x86_64')
provides=(${pkgname%-*}=$pkgver)
conflicts=(${pkgname%-*})
url="https://github.com/Dr-Noob/gpufetch"
license=('MIT')
depends=('glibc' 'cuda')
makedepends=('git' 'cmake' 'cuda-tools')
source=("git+https://github.com/Dr-Noob/gpufetch")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_name"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_name"
  mkdir build/
  cd build/
  cmake -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_CUDA_COMPILER=/opt/cuda/bin/nvcc \
        -DCMAKE_CUDA_COMPILER_TOOLKIT_ROOT=/opt/cuda/ \
        -Wno-dev \
        ..
  MAKEFLAGS="-j$(nproc) --no-print-directory"
  make
}

package() {
  cd "$srcdir/$_name"
  DESTDIR="$pkgdir" make -C build install
  install -Dm644 "LICENSE"    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "gpufetch.1" "$pkgdir/usr/share/man/man1/gpufetch.1.gz"
}
