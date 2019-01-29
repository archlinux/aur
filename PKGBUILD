# Maintainer:  James Kolb <jck1089@gmail.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=readline-athame-git
_basever=8.0
_patchlevel=0
pkgver=${_basever}.${_patchlevel}
pkgrel=1
pkgdesc='Readline with Athame(provides full Vim mode)'
arch=('i686' 'x86_64')
url='http://github.com/ardagnir/athame/'
license=('GPL' 'AGPL')
backup=('etc/inputrc' 'etc/athamerc')
depends=('glibc' 'ncurses' 'libncursesw.so' 'vim')
makedepends=('git')
conflicts=("readline")
provides=('libhistory.so' 'libreadline.so' "readline=${_basever}")
options=('!emptydirs')
source=(git://github.com/ardagnir/athame
        git://github.com/ardagnir/vimbed
        https://ftp.gnu.org/gnu/readline/readline-$_basever.tar.gz{,.sig}
        inputrc)
validpgpkeys=('7C0135FB088AAF6C66C650B9BB5869F064EA74AB') # Chet Ramey

if [ $_patchlevel -gt 0 ]; then
    for (( _p=1; _p <= $((10#${_patchlevel})); _p++ )); do
        source=(${source[@]} https://ftp.gnu.org/gnu/readline/readline-$_basever-patches/readline${_basever//.}-$(printf "%03d" $_p){,.sig})
    done
fi

prepare() {
  cd "${srcdir}/athame"
  git submodule init
  git config submodule.vimbed "${srcdir}/vimbed"
  git submodule update

  cd "${srcdir}/readline-$_basever"
  for (( _p=1; _p <= $((10#${_patchlevel})); _p++ )); do
    msg "applying patch readline${_basever//.}-$(printf "%03d" $_p)"
    patch -p0 -i ../readline${_basever//.}-$(printf "%03d" $_p)
  done

  # remove RPATH from shared objects (FS#14366)
  sed -i 's|-Wl,-rpath,$(libdir) ||g' support/shobj-conf

  # Patch with Athame
  ${srcdir}/athame/athame_patcher.sh readline ${srcdir}/athame
}

build() {
  cd readline-$_basever

  # build with -fPIC for x86_64 (FS#15634)
  [[ $CARCH == "x86_64" ]] && CFLAGS="$CFLAGS -fPIC"

  ./configure --prefix=/usr
  make SHLIB_LIBS="-lncurses -lutil" ATHAME_VIM_BIN="/usr/bin/vim" ATHAME_USE_JOBS_DEFAULT=1
}

package() {
  make -C readline-$_basever DESTDIR="$pkgdir" install
  install -Dm644 inputrc "$pkgdir"/etc/inputrc
  install -Dm644 "${srcdir}/athame/athamerc" "${pkgdir}/etc/athamerc"
}

md5sums=('SKIP'
         'SKIP'
         '7e6c1f16aee3244a69aba6e438295ca3'
         'SKIP'
         '58d54966c1191db45973cb3191ac621a')
