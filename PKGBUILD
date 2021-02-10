# Maintainer: Pedro A. López-Valencia <https://aur.archlinux.org/users/vorbote>

pkgname=groff-git
pkgver=1.23.0.rc1.199.g79a168ad
pkgrel=1
pkgdesc="GNU Troff. Official git trunk."
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/groff/"
license=('GPL')
depends=('netpbm' 'psutils' 'ghostscript' 'perl' 'libxaw')
makedepends=('git')
conflicts=('groff')
provides=('groff')
source=(
	"$pkgname::git://git.savannah.gnu.org/groff.git" 
        "gnulib-git::git://git.sv.gnu.org/gnulib.git"
	'site.tmac'
)
sha256sums=('SKIP'
            'SKIP'
            'af59ecde597ce9f8189368a7739279a5f8a391139fe048ef6b4e493ed46e5f5f')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "%s" "$(git describe | sed 's/\-/\./g')"
}

prepare() {
  cd "$srcdir/$pkgname"
  sed -i.bak -e "s/\[2\.62\]/\[2\.69\]/" configure.ac
  ./bootstrap --gnulib-srcdir="$srcdir"/gnulib-git --bootstrap-sync --no-git
}

build() {
  mkdir -p "$srcdir/$pkgname"/build
  cd "$srcdir/$pkgname"/build

  export CC="clang"
  export CXX="clang++"
  local _configopts=(
    --prefix=/usr
    --disable-rpath
    --with-x
    --with-appresdir=/usr/share/X11/app-defaults
    --with-doc=yes
    --with-uchardet=no
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
