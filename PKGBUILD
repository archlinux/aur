# Maintainer: Danny Lin <[firstname] at kdrag0n dot dev>

_pkgname=gperftools
pkgname=$_pkgname-aarch64-tls-fix
pkgver=2.7
pkgrel=1
pkgdesc="Fast, multi-threaded malloc and nifty performance analysis tools (patched to fix TLS errors on aarch64)"
arch=('x86_64')
url="https://github.com/gperftools/gperftools"
license=('BSD')
depends=('perl')
conflicts=($_pkgname)
provides=('libtcmalloc.so'
          'libprofiler.so'
          'libtcmalloc_debug.so'
          'libtcmalloc_and_profiler.so'
          'libtcmalloc_minimal.so'
          'libtcmalloc_minimal_debug.so'
          "$_pkgname=$pkgver")
makedepends=('git')
optdepends=('graphviz: pprof graph generation'
            'gv: pprof postscript generation')
source=("git+https://github.com/gperftools/gperftools#tag=$_pkgname-$pkgver"
        "gperftools-2.7-disable-generic-dynamic-tls.patch")
sha512sums=('SKIP'
            '6181eb88ee4e39aa55f7d9c8caa94a1cecd64ae9960c148b85b3192579f3336988342d6532fbec840c757010c116c739527c436a82c9ed4afcc99257f4cb6e56')

prepare() {
  cd "$_pkgname"
  
  patch -Np1 -i ../gperftools-2.7-disable-generic-dynamic-tls.patch
  ./autogen.sh
}

build() {
  cd "$_pkgname"

  ./configure --prefix=/usr --enable-frame-pointers
  make
}

package() {
  cd "$_pkgname"

  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
