# Maintainer: tarball <bootctl@gmail.com>
#
# The "main" source code only supports Windows. The necessary Linux patches can
# be found in one release archive, which is exactly what is used down below.

pkgname=pyprime
pkgver=2.0
pkgrel=2
pkgdesc='CPU and RAM benchmark'
arch=('i686' 'x86_64' 'aarch64' 'riscv64')
url='https://github.com/mbntr/PYPrime-2.x'
license=('MIT')
depends=('glibc' 'python')
makedepends=('cython' 'python' 'pkgconf')
source=("$url/releases/download/$pkgver/PYPrime.$pkgver.MP.tar.gz"
        "https://raw.githubusercontent.com/mbntr/PYPrime-2.x/refs/tags/$pkgver/LICENSE")
sha256sums=('4edaa952f9799d951b58d0e6807b9b4950cc1ae81d1ee540fce82ca0c4ef57e7'
            'a74abd01dabbb4e8417fa5f30004ea3a797dfe05e75c4322df1a3feda38432f5')

build() {
  cd PYPrime
  sed -i 's_3))} s"_3)} s"_' PYPrime.pyx # fix broken syntax on line 77
  cython --embed -3 -o PYPrime.c PYPrime.pyx
  cc $CFLAGS $(pkg-config --cflags --libs python3-embed) -O3 -o $pkgname PYPrime.c
}

package() {
  install -Dm755 PYPrime/$pkgname -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
