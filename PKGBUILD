pkgname=redox-gcc
pkgver=r152183.98e77b0b0d2
pkgrel=1
arch=(any)
license=(GPL)
source=("git+https://github.com/redox-os/gcc#branch=redox")
md5sums=('SKIP')
makedepends=('git' 'autoconf-2.64')
depends=(redox-binutils redox-newlib libmpc zlib)
conflicts=(redox-gcc-freestanding)
provides=(redox-gcc-freestanding)

prepare() {
  cd "$srcdir/gcc"

  cd libstdc++-v3
  /opt/autoconf/2.64/bin/autoconf
  cd ..

  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc}/configure

  rm -rf $srcdir/gcc-build
  mkdir $srcdir/gcc-build
}

build() {
  cd "$srcdir/gcc"

  cd $srcdir/gcc-build
  $srcdir/gcc/configure --target=$_target --prefix=/usr --with-local-prefix=/usr/$_target --with-sysroot=/usr/$_target --with-native-system-header-dir=/include --disable-nls --enable-languages=c,c++
  make all-gcc all-target-libgcc all-target-libstdc++-v3
}

package() {
  cd $srcdir/gcc-build

  make DESTDIR="$pkgdir" install-gcc install-target-libgcc install-target-libstdc++-v3

  rm -r "$pkgdir"/usr/share/man
  rm -r "$pkgdir"/usr/share/info
}

pkgver() {
  cd "$srcdir/gcc"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
