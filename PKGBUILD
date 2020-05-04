pkgname=psp-binutils
pkgver=2.23.2
pkgrel=1
pkgdesc="A set of programs to assemble and manipulate binary and object files (psp)"
arch=(x86_64)
url="https://www.gnu.org/software/binutils/"
license=('GPL')
groups=('psp')
depends=('zlib' 'flex')
makedepends=('gcc')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://ftp.gnu.org/pub/gnu/binutils/binutils-$pkgver.tar.bz2"
        "binutils-$pkgver-PSP.patch")
sha256sums=('fe914e56fed7a9ec2eb45274b1f2e14b0d8b4f41906a5194eac6883cfe5c1097'
            '155d7499dd65d496ec076dc71d93db9c0c2f9cdf3faae8671d969675346bf4c9')

prepare ()
{
  cd "$srcdir/binutils-$pkgver"
  rm -f include/opcode/vfpu.h ld/emulparams/elf_mipsallegrexel_psp.sh ld/scripttempl/elf_psp.sc
  patch -p1 -i "$srcdir"/binutils-${pkgver}-PSP.patch
}

build()
{
  cd "$srcdir/binutils-$pkgver"
  mkdir -p build-psp && pushd build-psp
  ../configure --prefix=/usr --target=psp --enable-install-libbfd \
    --enable-plugins --disable-werror --with-system-zlib
  make 
}

package()
{
  cd "$srcdir/binutils-$pkgver/build-psp"
  make install DESTDIR="$pkgdir"
  rm -r "$pkgdir"/usr/share
  cp -r "$pkgdir"/usr/*-linux-gnu/psp "$pkgdir"/usr
  rm -r "$pkgdir"/usr/*-linux-gnu
  rm -r "$pkgdir"/usr/lib
}

