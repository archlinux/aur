# Maintainer: Dr-Noob <peibolms at gmail dot com>
_name=peakperf
pkgname="$_name-git"
pkgver=1.15.r1.g9c8ede7
pkgrel=1
pkgdesc="Achieve peak performance on x86 CPUs and NVIDIA GPUs"
arch=('x86_64')
provides=(${pkgname%-*}=$pkgver)
conflicts=(${pkgname%-*})
url="https://github.com/Dr-Noob/peakperf"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('git' 'cmake' 'make')
optdepends=('cuda: GPU mode support'
            'cuda-tools: GPU mode support')
source=("git+https://github.com/Dr-Noob/peakperf")
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
        -Wno-dev \
        ..
  MAKEFLAGS="-j$(nproc) --no-print-directory"
  make
}

package() {
  cd "$srcdir/$_name"
  DESTDIR="$pkgdir" make -C build install
  install -Dm644 "LICENSE"    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "peakperf.1" "$pkgdir/usr/share/man/man1/peakperf.1.gz"
}
