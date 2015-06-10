# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Vlad-Mihai Sima <vladmihaisima@yahoo.com>
# Contributor: Carson Reynolds <carson@k2.t.u-tokyo.ac.jp>
# Contributor: Mikhail Vorozhtsov <mikhail.vorozhtsov@gmail.com>
# Contributor: Wolf Ramovsky <wolf.ramovsky@gmail.com>
# Contributor: kristianlm2 <kristanlein@gmail.com>
# Contributor: progtologist <arissynod@gmail.com>
# Contributor: pelluch <pablo.lluch@gmail.com>

pkgname=gcc44
pkgver=4.4.7
pkgrel=6
pkgdesc='The GNU Compiler Collection (4.4.x)'
arch=('x86_64' 'i686')
url='http://gcc.gnu.org/'
license=('GPL' 'LGPL' 'custom')
depends=('binutils' 'mpfr' 'cloog' 'zlib' 'elfutils')
makedepends=('setconf')
options=('!libtool' '!buildflags' 'staticlibs')
source=("http://www.mirrorservice.org/sites/sourceware.org/pub/gcc/releases/gcc-$pkgver/gcc-$pkgver.tar.bz2"
        'gcc-hash-style-both.patch'
        'gcc_pure64.patch'
        'siginfo_t_fix.patch')
sha256sums=('5ff75116b8f763fa0fb5621af80fc6fb3ea0f1b1a57520874982f03f26cd607f'
            'a600550d3d2b2fb8ee6a547c68c3a08a2af7579290b340c35ee5598c9bb305a5'
            '2d369cf93c6e15c3559c3560bce581e0ae5f1f34dc86bca013ac67ef1c1a9ff9'
            '4df866dcfd528835393d2b6897651158faf6d84852158fbf2e4ffc113ec7d201')

prepare() {
  cd "gcc-$pkgver"

  # Do not install libiberty
  sed -i -e 's:install_to_$(INSTALL_DEST) ::' libiberty/Makefile.in
  # Do not run fixincludes
  sed -i -e 's:\./fixinc\.sh:-c true:' gcc/Makefile.in

  patch -Np0 -i "$srcdir/gcc-hash-style-both.patch"
  patch -Np1 -i "$srcdir/siginfo_t_fix.patch"
  if [[ "$CARCH" == "x86_64" ]]; then
    patch -Np1 -i "$srcdir/gcc_pure64.patch"
  fi
  echo "$pkgver" > gcc/BASE-VER

  setconf gcc/configure BUILD_INFO ''
}

build() {
  cd "gcc-$pkgver"

  rm -rf build
  mkdir build
  cd build

  ../configure \
    --prefix=/usr \
    --mandir=/usr/share/man \
    --infodir=/usr/share/info \
    --libdir=/usr/lib \
    --libexecdir=/usr/lib \
    --program-suffix=-4.4 \
    --enable-shared \
    --enable-languages=c,c++,fortran,objc,obj-c++ \
    --enable-__cxa_atexit \
    --disable-libstdcxx-pch \
    --disable-multilib \
    --enable-libgomp \
    --disable-libmudflap \
    --disable-libssp \
    --enable-clocale=gnu \
    --with-tune=generic \
    --with-cloog \
    --with-ppl \
    --with-system-zlib
  make
}

package() {
  cd "gcc-$pkgver/build"

  make DESTDIR="$pkgdir" install
  rm -rf "$pkgdir/usr/share/man/man7"
  rm -rf "$pkgdir/usr/share/locale"
  mv "$pkgdir"/usr/lib/lib* \
     "$pkgdir/usr/lib/gcc/$CHOST/$pkgver/"
  # Install Runtime Library Exception
  install -Dm644 ../COPYING.RUNTIME \
    "$pkgdir/usr/share/licenses/$pkgname/RUNTIME.LIBRARY.EXCEPTION" \
  # Create links for gcc-4.4 build environment (useful for CUDA)
  mkdir -p "$pkgdir/opt/gcc-4.4"
  ln -s /usr/bin/gcc-4.4 "$pkgdir/opt/gcc-4.4/gcc"
  ln -s /usr/bin/g++-4.4 "$pkgdir/opt/gcc-4.4/g++"
  # Avoid file conflicts when enabling libgomp
  rm -rf "$pkgdir/usr/share/info"
}

# vim:set ts=2 sw=2 et:
