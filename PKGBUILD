# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>
# Maintainer: mwberry <matt@comp.uter.science>

pkgname=s2n-git
pkgver=r2225.2fbc43d3
pkgrel=1
pkgdesc='Implementation of the TLS/SSL protocols that is designed to be simple, small, fast, and with security as a priority'
arch=(x86_64)
url='https://github.com/awslabs/s2n'
license=(Apache)
makedepends=(git cmake)
depends=(openssl)
source=(git://github.com/awslabs/s2n)
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/s2n"
  echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  rm -rf "$srcdir/build"
  mkdir "$srcdir/build"
  cd "$srcdir/build"
  cmake -DBUILD_SHARED_LIBS=ON "$srcdir/s2n"
  make s2n{,c,d}
}

package() {
  cd "build"
  # Note: cmake's built-in 'install' target depends on 'all', which includes 'test'
  # This slows down the build, but there's not much that can be done about it.
  make DESTDIR="$pkgdir" install

  # strip /usr/local to /usr and squash /usr/lib64 to /usr/lib
  mv "$pkgdir/usr/local/"* "$pkgdir/usr/"
  rmdir "$pkgdir/usr/local"
  mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib"

  # it's not clear to me how transitive dependencies which are not cmake-aware are
  # intended to work (if at all) by Kitware, but the find_package module will look
  # for *Config.cmake files. The Find*.cmake modules are reserved for the cmake
  # distribution itself. This worked in my project, YMMV.
  install -d "$pkgdir/usr/lib/LibCrypto/cmake"
  mv "$pkgdir/usr/lib/cmake/FindLibCrypto.cmake" "$pkgdir/usr/lib/LibCrypto/LibCryptoConfig.cmake" 

  install -d "$pkgdir/usr/bin"
  install -Dm644 "$srcdir/build/bin/s2n"{c,d} "$pkgdir/usr/bin"
  install -Dm644 "$srcdir/s2n/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

