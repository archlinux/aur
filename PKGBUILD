# Contributor: Naoya Inada <inaoya@kushinada.org>
#     Updated: Yuki Chiba <chiba@jaist.ac.jp>

pkgname=smlsharp
pkgver=2.0.0
pkgrel=3
pkgdesc="A new programming language in the Standard ML family"
arch=('i686' 'x86_64')
url="http://www.pllab.riec.tohoku.ac.jp/smlsharp/"
license=('custom')
depends=('gmp')
[ "$CARCH" == "x86_64" ] && depends=('lib32-gmp')
makedepends=("ed" 'cpio' 'llvm>=3.5' )
[ "$CARCH" == "x86_64" ] && makedepends=("ed" 'cpio' 'lib32-llvm>=3.5' )
source=(http://www.pllab.riec.tohoku.ac.jp/smlsharp/download/$pkgname-$pkgver.tar.gz
        llvm-3.5.patch::https://github.com/susurri/smlsharp/commit/c9b743fff63b1f3fb1c83c47f80751e72faa0925.patch)
md5sums=('df71724704c967a51e7c1db77ee5d0b1'
         '8d03886bb9fabf988177fbded1fdf910')
options=(libtool staticlibs)

build() {
  cd $srcdir/$pkgname-$pkgver
  patch -p1 < ../llvm-3.5.patch
  if [ "$CARCH" == "i686" ]; then
    ./configure --prefix=/usr
  else
    ./configure CC='gcc -m32' CXX='g++ -m32' LD='ld -m elf_i386' LLVM_CONFIG=/usr/bin/llvm-config32 --prefix=/usr
  fi

  make
}

package(){
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install

  for file in LICENSE SMLNJ_LICENSE; do
    install -D -m 644 $file $pkgdir/usr/share/licenses/$pkgname/$file
  done
}
