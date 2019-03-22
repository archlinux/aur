# Maintainer: loathingkernel <loathingkernel at@ gmail dot. com>
# Contributor:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=readline7
_basever=7.0
_patchlevel=005
pkgver=${_basever}.${_patchlevel}
pkgrel=1
pkgdesc="GNU readline library. Provides libreadline.so.${_basever:0:1}"
arch=('x86_64')
url='http://tiswww.case.edu/php/chet/readline/rltop.html'
license=('GPL')
depends=('glibc' 'ncurses' 'libncursesw.so' 'readline')
provides=("libhistory.so.${_basever:0:1}" "libreadline.so.${_basever:0:1}")
options=('!emptydirs')
source=(https://ftp.gnu.org/gnu/readline/readline-$_basever.tar.gz{,.sig}
)
validpgpkeys=('7C0135FB088AAF6C66C650B9BB5869F064EA74AB') # Chet Ramey

if [ $_patchlevel -gt 0 ]; then
    for (( _p=1; _p <= $((10#${_patchlevel})); _p++ )); do
        source=(${source[@]} https://ftp.gnu.org/gnu/readline/readline-$_basever-patches/readline${_basever//.}-$(printf "%03d" $_p){,.sig})
    done
fi

prepare() {
  cd readline-$_basever
  for (( _p=1; _p <= $((10#${_patchlevel})); _p++ )); do
    msg "applying patch readline${_basever//.}-$(printf "%03d" $_p)"
    patch -p0 -i ../readline${_basever//.}-$(printf "%03d" $_p)
  done

  # remove RPATH from shared objects (FS#14366)
  sed -i 's|-Wl,-rpath,$(libdir) ||g' support/shobj-conf
}

build() {
  cd readline-$_basever

  # build with -fPIC for x86_64 (FS#15634)
  [[ $CARCH == "x86_64" ]] && CFLAGS="$CFLAGS -fPIC"

  ./configure --prefix=/usr
  make SHLIB_LIBS=-lncurses
}

package() {
  make -C readline-$_basever DESTDIR="$pkgdir" install
  rm -r "$pkgdir"/usr/{include,share}
  rm "$pkgdir"/usr/lib/{libhistory.{so,a},libreadline.{so,a}}
}

md5sums=('205b03a87fc83dab653b628c59b9fc91'
         'SKIP'
         'e299384458a4cbefaaac3f30e9cc2bba'
         'SKIP'
         'f9071a353e2fd52a91d32667b23715d6'
         'SKIP'
         '03595464cf0283286a6e07f4f01c4a70'
         'SKIP'
         '80e29bef54e2164bf9ecca0c8932cf23'
         'SKIP'
         '2146e694e0f1f67b025790879111c6cb'
         'SKIP')
