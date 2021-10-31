# Maintainer: loathingkernel <loathingkernel at@ gmail dot. com>
# Contributor:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=readline6
_basever=6.3
_patchlevel=008
pkgver=${_basever}.${_patchlevel}
pkgrel=4
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

md5sums=('33c8fb279e981274f485fd91da77e94a'
         'SKIP'
         '4343f5ea9b0f42447f102fb61576b398'
         'SKIP'
         '700295212f7e2978577feaee584afddb'
         'SKIP'
         'af4963862f5156fbf9111c2c6fa86ed7'
         'SKIP'
         '11f9def89803a5052db3ba72394ce14f'
         'SKIP'
         '93721c31cd225393f80cb3aadb165544'
         'SKIP'
         '71dc6ecce66d1489b96595f55d142a52'
         'SKIP'
         '062a08ed60679d3c4878710b3d595b65'
         'SKIP'
         'ee1c04072154826870848d8b218d7b04'
         'SKIP')
