# Maintainer: Junchun Guan <junchunx.guan@gmail.com>
pkgname=qemu-arm-static
pkgver=1.6.0
pkgrel=3.1
pkgdesc="Universal CPU emulator"
url="http://www.qemu.org"
arch=('i686' 'x86_64')
license=("GPL2")
makedepends=(python2)
source=(http://download.tizen.org/tools/archive/14.03.1/openSUSE_13.1/src/qemu-arm-static-1.6.0rc3-3.1.src.rpm)
sha256sums=('5e031095000f5fd97577bb1743f3ccafe41c63b4c83b6ee93778bbee76cda53d')

prepare()
{
  cd "$srcdir"
  tar -x -f qemu-$pkgver-rc3.tar.bz2
  cd "$srcdir/qemu-${pkgver}-rc3"
  for patch_file in $(find ../ -maxdepth 1 -name '*.patch' |sort)
  do
    patch -p1 -i $patch_file
  done
}

build() {
   cd "$srcdir/qemu-$pkgver-rc3"
  ./configure \
	--prefix=/usr \
	--libexecdir=/usr/lib \
	--target-list="arm-linux-user,arm64-linux-user" \
	--disable-tools \
	--disable-guest-agent \
	--disable-docs \
	--disable-system \
	--disable-werror \
	--disable-linux-aio \
	--disable-fdt \
	--disable-sdl \
        --enable-linux-user \
        --python=/usr/bin/python2 \
#        --static
}

package() {
  cd "$srcdir/qemu-$pkgver-rc3"
  make install DESTDIR="$pkgdir"
  install -m755 $srcdir/qemu-binfmt-conf.sh $pkgdir/usr/bin/qemu-binfmt-conf.sh
  mv $pkgdir/usr/bin/qemu-arm $pkgdir/usr/bin/qemu-arm-static
  mv $pkgdir/usr/bin/qemu-arm64 $pkgdir/usr/bin/qemu-arm64-static
  rm -rf $pkgdir/usr/{lib,include,share,etc}
  rm -rf $pkgdir/usr/bin/vscclient
}
