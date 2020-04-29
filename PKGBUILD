pkgname=psp-binutils
pkgver=2.22
pkgrel=1
pkgdesc="A set of programs to assemble and manipulate binary and object files (psp)"
arch=(x86_64)
url="https://github.com/pspdev/psptoolchain"
license=('GPL')
groups=('psp')
depends=('zlib' 'flex')
makedepends=('gcc')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://ftp.gnu.org/pub/gnu/binutils/binutils-$pkgver.tar.bz2")
sha256sums=('6c7af8ed1c8cf9b4b9d6e6fe09a3e1d3d479fe63984ba8b9b26bf356b6313ca9')

prepare ()
{
  cd "$srcdir/binutils-$pkgver"
  rm -f include/opcode/vfpu.h ld/emulparams/elf_mipsallegrexel_psp.sh ld/scripttempl/elf_psp.sc
  curl -L https://raw.githubusercontent.com/pspdev/psptoolchain/master/patches/binutils-${pkgver}-PSP.patch | patch -p1
  curl -L https://raw.githubusercontent.com/pspdev/psptoolchain/master/patches/binutils-${pkgver}-texinfofix.patch | patch -p1
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
  cp -r "$pkgdir"/usr/*-linux-gnu/psp "$pkgdir"/usr
  rm -r "$pkgdir"/usr/*-linux-gnu
  rm -r "$pkgdir"/usr/lib
}

