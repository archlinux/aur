pkgname=psp-gcc-base
pkgver=14.1.0
pkgrel=1
pkgdesc="A port of gcc to the PSP (bootstrap) (psp)"
arch=('x86_64')
url="https://github.com/pspdev/gcc"
license=('GPL' 'LGPL' 'FDL' 'custom')
depends=('mpfr')
makedepends=('psp-binutils' 'git')
conflicts=('psp-gcc')
options=('!buildflags' '!strip' 'staticlibs')

prepare()
{
  rm -rf "$srcdir/gcc-$pkgver"
  git clone https://github.com/pspdev/gcc.git -b allegrex-v${pkgver} --depth 1 "$srcdir/gcc-$pkgver"
}

build()
{
  cd "$srcdir/gcc-$pkgver"
  mkdir -p build-psp && pushd build-psp
  ../configure \
    --quiet \
    --prefix=/usr \
    --target=psp \
    --enable-languages="c" \
    --with-float=hard \
    --with-headers=no \
    --without-newlib \
    --disable-libgcc \
    --disable-shared \
    --disable-threads \
    --disable-libssp \
    --disable-libgomp \
    --disable-libmudflap \
    --disable-libquadmath \
    --disable-nls
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
