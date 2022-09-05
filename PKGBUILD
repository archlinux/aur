# Maintainer: Pedro A. López-Valencia <https://aur.archlinux.org/users/toropisco>

CLANG=0

pkgname=groff-git
pkgver=1.23.0.rc1.2913.g27568d6e3
pkgrel=1
pkgdesc="GNU Troff. Official git trunk."
arch=('x86_64')
url="http://www.gnu.org/software/groff/"
license=('GPL')
depends=(
  'netpbm'
  'psutils'
  'uchardet'
  'ghostscript'
  'perl'
  'libxaw'
  'perl-file-homedir'
)
makedepends=('git')
conflicts=('groff')
provides=('groff')
source=(
  "$pkgname::git://git.savannah.gnu.org/groff.git" 
  "gnulib-git::git://git.sv.gnu.org/gnulib.git"
  'site.tmac'
)

if [[ CLANG == 1 ]]; then
  makedepends+=(
  'clang'
  'llvm'
  'lld'
 ) 
fi

b2sums=('SKIP'
        'SKIP'
        'c2906f83259261ba3927ca4870ce1035f04a66e9e2331a30961373d0b5dc2f62955b2cdf2ed8cebf927912a9b689fc9a3a25891dee0bdb301a41acea9dac56c3')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "%s" "$(git describe | sed 's/\-/\./g')"
}

prepare() {
  cd "$srcdir/$pkgname"
  sed -i.bak -e "s/\[2\.62\]/\[2\.69\]/" configure.ac
  ./bootstrap \
    --gnulib-srcdir="$srcdir"/gnulib-git \
    --force
}

build() {
  if [[ $CLANG == 1 ]]; then 
    export CC="clang"
    export CXX="clang++"
    export LD="ldd"
    export AR="llvm-ar"
    export AS="llvm-as"
    export NM="llvm-nm"
    export STRIP="llvm-stipr"
  fi

  mkdir -p "$srcdir/$pkgname"/build

  cd "$srcdir/$pkgname"/build

  local _configopts=(
    --prefix=/usr
    --disable-rpath
    --with-x
    --with-appresdir=/usr/share/X11/app-defaults
    --with-doc=yes
    --with-uchardet=yes
  )

  ../configure "${_configopts[@]}"

  make
}

check() {
  cd "$srcdir/$pkgname"/build

  make check
}

package() {
  cd "$srcdir/$pkgname"/build

  if [[ ${LANG/en_US} ]] || [[ ${LANG/es_CO} ]]; then
    make DESTDIR="$pkgdir/" PAPER=letter install
  else
    make DESTDIR="$pkgdir/" PAPER=A4 install
  fi
  
  ## Copypaste from core package's PKGBUILD...
  
  # add compatibility symlinks
  ln -s eqn $pkgdir/usr/bin/geqn
  ln -s tbl $pkgdir/usr/bin/gtbl
  ln -s soelim $pkgdir/usr/bin/zsoelim

  # FS33760 - TERMCAP variables not followed
  # TODO: everyone is doing this - find out why upstream does not...
  #
  # Having being privy to the whole thing since 2003, I wonder why people
  # still stick to this. Blech! Vorbote.
  #
  cat $srcdir/site.tmac >> \
    $pkgdir/usr/share/groff/site-tmac/man.local
  cat $srcdir/site.tmac >> \
    $pkgdir/usr/share/groff/site-tmac/mdoc.local
}

# vim:set ft=sh ts=2 sw=2 et:
