# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=gm2
_gccver=11.1.0
_gm2ver=20210503
pkgver=${_gccver}.r${_gm2ver}
pkgrel=1
epoch=1
pkgdesc="GNU Modula2 compiler"
url="https://floppsie.comp.glam.ac.uk/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('bash' 'zstd' 'libmpc')
source=(http://floppsie.comp.glam.ac.uk/download/c/gcc-${_gccver}+gm2-${_gm2ver}.tar.gz)
sha256sums=('fe956f12ed97f8a1e5ea44a5cf6a229e7e8b4be1e41a0fc757fae40c3954a9a3')

build() {
  [[ -d build-gcc-$_gccver ]] || mkdir build-gcc-$_gccver
  cd build-gcc-$_gccver
  CXXFLAGS=-g BOOT_CFLAGS=-g CFLAGS=-g \
  ../gcc-${_gccver}+gm2-${_gm2ver}/configure \
  --prefix=/usr \
  --libdir=/usr/lib \
  --libexecdir=/usr/lib \
  --enable-threads=posix \
  --enable-clocale=gnu --enable-languages=c,c++,m2 \
  --disable-multilib --disable-bootstrap --enable-checking
  make
}

package() {
  cd build-gcc-$_gccver
  make DESTDIR="$pkgdir" install
  # Lazy way of dealing with conflicting files...
  rm -rf "$pkgdir"/usr/share/{info,locale,man}

  # Install Runtime Library Exception
  install -Dm644 "$srcdir"/gcc-${_gccver}+gm2-${_gm2ver}/COPYING.RUNTIME \
	  "$pkgdir"/usr/share/licenses/$pkgbase/RUNTIME.LIBRARY.EXCEPTION
  rm "$pkgdir"/usr/bin/c++
  rm "$pkgdir"/usr/bin/cpp 
  rm "$pkgdir"/usr/bin/g++ 
  rm "$pkgdir"/usr/bin/gcc 
  rm "$pkgdir"/usr/bin/gcc-ar
  rm "$pkgdir"/usr/bin/gcc-nm 
  rm "$pkgdir"/usr/bin/gcc-ranlib 
  rm "$pkgdir"/usr/bin/gcov 
  rm "$pkgdir"/usr/bin/gcov-tool
  rm "$pkgdir"/usr/bin/x86_64-pc-linux-gnu-c++ 
  rm "$pkgdir"/usr/bin/x86_64-pc-linux-gnu-g++ 
  rm "$pkgdir"/usr/bin/x86_64-pc-linux-gnu-gcc 
  rm "$pkgdir"/usr/bin/x86_64-pc-linux-gnu-gcc-ar
  rm "$pkgdir"/usr/bin/x86_64-pc-linux-gnu-gcc-nm
  rm "$pkgdir"/usr/bin/x86_64-pc-linux-gnu-gcc-ranlib
  rm "$pkgdir"/usr/lib/libcc1.so
  rm "$pkgdir"/usr/lib/libcc1.so.0
  rm "$pkgdir"/usr/lib/libcc1.so.0.0.0
  rm "$pkgdir"/usr/lib64/libasan.so
  rm "$pkgdir"/usr/lib64/libasan.so.6
  rm "$pkgdir"/usr/lib64/libasan.so.6.0.0 
  rm "$pkgdir"/usr/lib64/libasan_preinit.o
  rm "$pkgdir"/usr/lib64/libatomic.so
  rm "$pkgdir"/usr/lib64/libatomic.so.1
  rm "$pkgdir"/usr/lib64/libatomic.so.1.2.0
  rm "$pkgdir"/usr/lib64/libgomp.so
  rm "$pkgdir"/usr/lib64/libgomp.so.1
  rm "$pkgdir"/usr/lib64/libgomp.so.1.0.0 
  rm "$pkgdir"/usr/lib64/libgomp.spec
  rm "$pkgdir"/usr/lib64/libitm.so
  rm "$pkgdir"/usr/lib64/libitm.so.1
  rm "$pkgdir"/usr/lib64/libitm.so.1.0.0 
  rm "$pkgdir"/usr/lib64/libitm.spec
  rm "$pkgdir"/usr/lib64/liblsan.so
  rm "$pkgdir"/usr/lib64/liblsan.so.0
  rm "$pkgdir"/usr/lib64/liblsan.so.0.0.0 
  rm "$pkgdir"/usr/lib64/liblsan_preinit.o
  rm "$pkgdir"/usr/lib64/libquadmath.so
  rm "$pkgdir"/usr/lib64/libquadmath.so.0
  rm "$pkgdir"/usr/lib64/libquadmath.so.0.0.0 
  rm "$pkgdir"/usr/lib64/libsanitizer.spec
  rm "$pkgdir"/usr/lib64/libstdc++.so
  rm "$pkgdir"/usr/lib64/libstdc++.so.6
  rm "$pkgdir"/usr/lib64/libstdc++.so.6.0.29
  rm "$pkgdir"/usr/lib64/libstdc++fs.a
  rm "$pkgdir"/usr/lib64/libstdc++.a
  rm "$pkgdir"/usr/lib64/libsupc++.a
  rm "$pkgdir"/usr/lib64/libtsan.so
  rm "$pkgdir"/usr/lib64/libtsan.so.0
  rm "$pkgdir"/usr/lib64/libtsan.so.0.0.0 
  rm "$pkgdir"/usr/lib64/libtsan_preinit.o
  rm "$pkgdir"/usr/lib64/libgcc_s.so
  rm "$pkgdir"/usr/lib64/libgcc_s.so.1
  rm "$pkgdir"/usr/lib64/libubsan.so
  rm "$pkgdir"/usr/lib64/libubsan.so.1
  rm "$pkgdir"/usr/lib64/libubsan.so.1.0.0
  cp "$pkgdir"/usr/lib64/* "$pkgdir"/usr/lib
  rm -rf "$pkgdir"/usr/lib64/
  cd "$pkgdir"/usr/lib
  for _file in libm2cor.so.17 libm2min.so.17 libm2iso.so.17 libm2pim.so.17 libm2log.so.17
  do
    rm $_file 
    ln -s $_file.0.0 $_file
  done
  rm libssp.so.0
  ln -s libssp.so.0.0.0 libssp.so.0
}
