# Maintainer: Maxime Arthaud <maxime@arthaud.me>

pkgname=ikos
pkgver=2.0
pkgrel=1
pkgdesc='A static analyzer for C and C++ developed by NASA'
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url='https://ti.arc.nasa.gov/opensource/ikos/'
license=('custom:NOSA 1.3')
depends=('gmp'
         'boost-libs'
         'python'
         'python-pygments'
         'sqlite'
         'llvm40'
         'llvm40-libs'
         'clang40'
         'apron-ppl-svn')
makedepends=('cmake'
             'boost')
source=("https://ti.arc.nasa.gov/m/opensource/downloads/ikos-$pkgver.tar.gz"
        "https://ti.arc.nasa.gov/m/opensource/downloads/ikos/IKOS_NASA_Open_Source_Agreement.pdf")
sha512sums=('f3abb77e9d3d57b26cb0df7d26b1cb824441c178205edc7b92b3b137d6b2b12b9f7336d53f5135a8a0f114042c193419945553fac0f91b59235e8ed5849fb3d5'
            '3caeffbe06254b3a181eee1f172bde48d7c8007e989b07928b0ce4e737759d5e2649d25419722c3b7a78ca8ddf408ce150a143490489641527cbcac479c241b7')

prepare() {
  cd "$srcdir/ikos-$pkgver"
  mkdir build
}

build() {
  cd "$srcdir/ikos-$pkgver/build"
  cmake \
    -DCMAKE_BUILD_TYPE="Release" \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DLLVM_CONFIG_EXECUTABLE="/usr/bin/llvm-config-4.0" \
    ..
  make
}

package() {
  cd "$srcdir/ikos-$pkgver/build"
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/IKOS_NASA_Open_Source_Agreement.pdf" "${pkgdir}/usr/share/licenses/ikos/LICENSE"
}

check() {
  cd "$srcdir/ikos-$pkgver/build"
  make check
}
