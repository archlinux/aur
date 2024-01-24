pkgname=psp-gcc-base
pkgver=13.2.0
pkgrel=1
pkgdesc="A port of gcc to the PSP (bootstrap) (psp)"
arch=('x86_64')
url="https://github.com/pspdev/gcc"
license=('GPL' 'LGPL' 'FDL' 'custom')
depends=('mpfr')
makedepends=('psp-binutils' 'git')
conflicts=('psp-gcc')
options=('!buildflags' '!strip' 'staticlibs')
source=(gcc-$pkgver::git+https://github.com/pspdev/gcc.git#branch=allegrex-v${pkgver})
sha256sums=('SKIP')

build()
{
  cd "$srcdir/gcc-$pkgver"
  mkdir -p build-psp && pushd build-psp
  ../configure --quiet --prefix=/usr --target=psp --enable-languages="c" --with-float=hard \
    --with-headers=no --without-newlib --disable-libatomic --disable-libssp --disable-multilib
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
