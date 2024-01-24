pkgname=psp-gcc
pkgver=13.2.0
pkgrel=1
pkgdesc="A port of gcc to the PSP (psp)"
arch=('x86_64')
url="https://github.com/pspdev/gcc"
license=('GPL' 'LGPL' 'FDL' 'custom')
depends=('psp-binutils' 'psp-newlib' 'psp-pthread-embedded' 'mpfr')
makedepends=('git')
conflicts=('psp-gcc-base')
provides=('psp-gcc-base')
options=('!buildflags' '!strip' 'staticlibs')
source=(gcc-$pkgver::git+https://github.com/pspdev/gcc.git#branch=allegrex-v${pkgver})
sha256sums=('SKIP')

build()
{
  cd "$srcdir/gcc-$pkgver"
  mkdir -p build-psp && pushd build-psp
  ../configure --quiet --prefix=/usr --target=psp --enable-languages="c,c++" --with-float=hard \
    --with-newlib --disable-libssp --disable-multilib --enable-cxx-flags="-G0" --enable-threads=posix
  make 
}

package()
{
  cd "$srcdir/gcc-$pkgver/build-psp"
  make install DESTDIR="$pkgdir"

  # Remove files owned by host gcc
  rm -r "$pkgdir"/usr/share
  rm "$pkgdir"/usr/lib/libcc1.*
}
