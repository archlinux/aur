# Maintainer: Pedro A. López-Valencia <https://aur.archlinux.org/users/toropisco>

pkgname=groff-git
pkgver=1.23.0.598
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
#
# A provides here is a mere empty gesture. It doesn't work unless the core package includes the same.
#
provides=('groff') 
#
# Absolutely necessary. Those who advocate for replaces only, have not used
# pacman in anger apparently.
#
conflicts=('groff')
replaces=('groff')
source=(
  "$pkgname::git://git.savannah.gnu.org/groff.git" 
  "gnulib-git::git://git.sv.gnu.org/gnulib.git"
  'site.tmac'
)

b2sums=('SKIP'
        'SKIP'
        'c2906f83259261ba3927ca4870ce1035f04a66e9e2331a30961373d0b5dc2f62955b2cdf2ed8cebf927912a9b689fc9a3a25891dee0bdb301a41acea9dac56c3')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "%s" "$(git describe | awk -F- '{ print $1"."$2 }')"
}

prepare() {
  cd "$srcdir/$pkgname"
  sed -i.bak -e "s/\[2\.62\]/\[2\.69\]/" configure.ac
  ./bootstrap \
    --gnulib-srcdir="$srcdir"/gnulib-git \
    --force
}

build() {
  mkdir -p "$srcdir/$pkgname"/build
  cd "$srcdir/$pkgname"/build
  local _configopts=(
    --prefix=/usr
    --enable-groff-allocator
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
  #
  # Please report if your country uses ANSI paper sizes instead of ISO,
  # be it officially or de facto---as is the case in Colombia, Mexico 
  # Chile or Canada---.
  #
  if
    [[ ${LANG/en_US} ]]  || \
    [[ ${LANG/en_CA} ]]  || \
    [[ ${LANG/en_PH} ]]  || \
    [[ ${LANG/es_CO} ]]  || \
    [[ ${LANG/es_CL} ]]  || \
    [[ ${LANG/es_CR} ]]  || \
    [[ ${LANG/es_DO} ]]  || \
    [[ ${LANG/es_GT} ]]  || \
    [[ ${LANG/es_MX} ]]  || \
    [[ ${LANG/es_PA} ]]  || \
    [[ ${LANG/es_US} ]]  || \
    [[ ${LANG/fil_PH} ]] || \
    [[ ${LANG/fr_CA} ]]  || \
    [[ ${LANG/ik_CA} ]]  || \
    [[ ${LANG/iu_CA} ]]  || \
    [[ ${LANG/shs_CA} ]] || \
    [[ ${LANG/tl_PH} ]] \
    then
    make DESTDIR="$pkgdir/" PAPER=letter install
  else
    make DESTDIR="$pkgdir/" PAPER=A4 install
  fi
  #
  ## Copypaste from core package's PKGBUILD...
  #
  # add compatibility symlinks
  #
  ln -s eqn $pkgdir/usr/bin/geqn
  ln -s tbl $pkgdir/usr/bin/gtbl
  ln -s soelim $pkgdir/usr/bin/zsoelim
  #
  # FS33760 - TERMCAP variables not followed
  #
  cat $srcdir/site.tmac >> \
    $pkgdir/usr/share/groff/site-tmac/man.local
  cat $srcdir/site.tmac >> \
    $pkgdir/usr/share/groff/site-tmac/mdoc.local
}

# vim:set ft=sh ts=2 sw=2 et:
