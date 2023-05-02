pkgname=coin-or-os
pkgver=2.10.3
pkgrel=1
pkgdesc="Optimization Services"
arch=('x86_64')
url="https://projects.coin-or.org/OS"
license=('EPL')
groups=('coin-or')
depends=('coin-or-bonmin' 'coin-or-csdp' 'cppad')
options=(debug !strip)
source=("https://github.com/coin-or/OS/archive/refs/tags/releases/${pkgver}.tar.gz")
sha256sums=('f8732cc140231307cca4c0dfdc08cf98bc9347d7040fe4edbc295396c8140f71')

prepare() {
  cd "$srcdir/OS-releases-$pkgver"
  curl -L https://src.fedoraproject.org/rpms/coin-or-OS/raw/rawhide/f/coin-or-OS-parser.patch  | patch -p1
  curl -L https://src.fedoraproject.org/rpms/coin-or-OS/raw/rawhide/f/coin-or-OS-OSMatrix.patch | patch -p1
  curl -L https://src.fedoraproject.org/rpms/coin-or-OS/raw/rawhide/f/coin-or-OS-test.patch | patch -p1
  curl -L https://src.fedoraproject.org/rpms/coin-or-OS/raw/rawhide/f/coin-or-OS-uninitialized.patch | patch -p1  
  curl -L https://src.fedoraproject.org/rpms/coin-or-OS/raw/rawhide/f/coin-or-OS-signed.patch | patch -p1
  curl -L https://src.fedoraproject.org/rpms/coin-or-OS/raw/rawhide/f/coin-or-OS-except.patch | patch -p1
  curl -L https://src.fedoraproject.org/rpms/coin-or-OS/raw/rawhide/f/coin-or-OS-configure-c99.patch | patch -p1

  # bonmin part of test asserts
  sed -i "s|#ifdef COIN_HAS_BONMIN|#if 0|g" OS/test/unitTest.cpp 
}

build() {
  cd "$srcdir/OS-releases-$pkgver"
  CFLAGS="${CFLAGS} -fno-delete-null-pointer-checks" \
  CXXFLAGS="${CXXFLAGS} -I/usr/include/coin -std=gnu++14" \
  ./configure --prefix=/usr \
              --with-osi-lib="$(pkg-config --libs osi)" \
              --with-osi-incdir="/usr/include/coin/" \
              --with-clp-lib="$(pkg-config --libs clp)" \
              --with-clp-incdir="/usr/include/coin/" \
              --with-cgl-lib="$(pkg-config --libs cgl)" \
              --with-cgl-incdir="/usr/include/coin/" \
              --with-coinutils-lib="$(pkg-config --libs coinutils)" \
              --with-coinutils-incdir="/usr/include/coin/" \
              --with-cbc-lib="$(pkg-config --libs cbc)" \
              --with-cbc-incdir="/usr/include/coin/" \
              --with-ipopt-lib="$(pkg-config --libs ipopt)" \
              --with-ipopt-incdir="/usr/include/coin/" \
              --with-csdp-lib="-lsdp" \
              --with-csdp-incdir=/usr/include/csdp
  make
}

check() {
  cd "$srcdir/OS-releases-$pkgver"
  make test
}

package() {
  cd "$srcdir/OS-releases-$pkgver"
  PKG_CONFIG_LIBDIR="${pkgdir}/usr/lib/pkgconfig/" \
  make DESTDIR="$pkgdir/" install
}

