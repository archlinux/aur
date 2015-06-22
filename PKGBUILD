pkgname=psp-binutils
pkgver=2.22
pkgrel=1
pkgdesc="A set of programs to assemble and manipulate binary and object files (psp)"
arch=(i686 x86_64)
url="http://www.gnu.org/software/binutils/"
license=('GPL')
groups=('psp')
depends=('zlib' 'flex')
makedepends=('gcc')
options=('!buildflags' '!strip' 'staticlibs')
source=("http://ftp.gnu.org/pub/gnu/binutils/binutils-$pkgver.tar.bz2"
        'binutils-2.22-PSP.patch'
        'binutils-2.22-texinfofix.patch')
md5sums=('ee0f10756c84979622b992a4a61ea3f5'
         'a30ab9c15c985c771a42b19f3356d42b'
         '771f36e63bc53732990f02ef42a475c9')

prepare ()
{
  cd "$srcdir/binutils-$pkgver"
  rm -f include/opcode/vfpu.h ld/emulparams/elf_mipsallegrexel_psp.sh ld/scripttempl/elf_psp.sc
  patch -p1 -i "$srcdir"/binutils-2.22-PSP.patch
  patch -p1 -i "$srcdir"/binutils-2.22-texinfofix.patch
}

build()
{
  cd "$srcdir/binutils-$pkgver"
  mkdir -p build-psp && pushd build-psp
  ../configure --prefix=/usr --target=psp \
    --enable-install-libbfd \
    --disable-werror
  make 
}

package()
{
  cd "$srcdir/binutils-$pkgver/build-psp"
  make install DESTDIR="$pkgdir"
  rm -r "$pkgdir"/usr/share
  cp -r "$pkgdir"/usr/`gcc -dumpmachine`/psp "$pkgdir"/usr
  rm -r "$pkgdir"/usr/`gcc -dumpmachine`
  rm -r "$pkgdir"/usr/lib
}

