# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=hisat2-git
pkgver=2.2.1.r59.g7e01700
pkgrel=1
pkgdesc="A fast and sensitive alignment program for mapping sequencing reads"
arch=('x86_64')
url="https://daehwankimlab.github.io/hisat2/"
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=('git' 'cmake')
optdepends=('perl' 'python')
provides=("hisat2=$pkgver")
conflicts=('hisat2')
options=('staticlibs')
source=("git+https://github.com/DaehwanKimLab/hisat2.git")
sha256sums=('SKIP')


pkgver() {
  cd "hisat2"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "hisat2"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    ./
  cmake --build "_build"
}

package() {
  cd "hisat2"

  install -Dm755 hisat2{,-*} -t "$pkgdir/usr/bin"
  install -Dm755 "_build"/hisat2-* -t "$pkgdir/usr/bin"

  install -Dm644 "_build/libhisat2lib.a" -t "$pkgdir/usr/lib"
  install -Dm755 "_build/libhisat2lib.so" -t "$pkgdir/usr/lib"

  install -Dm644 {MANUAL.markdown,README.md,TUTORIAL} -t "$pkgdir/usr/share/doc/hisat2"
}
