# Maintainer: spudowiar

_pkgname=rxvt-unicode
_gitname=$_pkgname
pkgname=${_pkgname}-24bit
pkgver=r3540.2cbd01f
pkgrel=1
arch=('i686' 'x86_64')
url='http://github.com/spudowiar/rxvt-unicode/tree/24bit'
license=('GPL')
makedepends=('libxft' 'perl' 'startup-notification')
pkgdesc='A unicode enabled rxvt-clone terminal emulator (urxvt) with 24-bit color support'
depends=('libxft' 'perl' 'startup-notification')
optdepends=('gtk2-perl: to use the urxvt-tabbed')
source=(
  'git://github.com/spudowiar/rxvt-unicode.git#branch=24bit'
  'git://github.com/spudowiar/libptytty.git'
  'git://github.com/spudowiar/libev.git'
  'git://github.com/spudowiar/libecb.git'
  'urxvt.desktop'
  'urxvtc.desktop'
  'urxvt-tabbed.desktop'
)
provides=($_pkgname ${_pkgname}-terminfo)
conflicts=($_pkgname ${_pkgname}-terminfo)
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP'
         'fec94dc986fa37ec380079d81de3e0b2'
         'fac55f0a8404c86dad3e702146762332'
         '8a5599197568c63720e282b9722a7990')

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_gitname"
  git submodule init
  for submodule in 'libptytty' 'libev' 'libecb'; do
    git config "submodule.${submodule}.url" "$srcdir/$submodule"
  done
  git submodule update
}

build() {
  cd "$srcdir/$_gitname"
  # we disable smart-resize (FS#34807)
  ./configure \
    --prefix=/usr \
    --with-terminfo=/usr/share/terminfo \
    --enable-256-color \
    --enable-24-bit-color \
    --enable-combining \
    --enable-fading \
    --enable-font-styles \
    --enable-iso14755 \
    --enable-keepscrolling \
    --enable-lastlog \
    --enable-mousewheel \
    --enable-next-scroll \
    --enable-perl \
    --enable-pointer-blank \
    --enable-rxvt-scroll \
    --enable-selectionscrolling \
    --enable-slipwheeling \
    --disable-smart-resize \
    --enable-startup-notification \
    --enable-transparency \
    --enable-unicode3 \
    --enable-utmp \
    --enable-wtmp \
    --enable-xft \
    --enable-xim \
    --enable-xterm-scroll \
    --disable-pixbuf \
    --disable-frills
  make
}

package() {
  # install freedesktop menu
  for _f in urxvt urxvtc urxvt-tabbed; do
    install -Dm644 $_f.desktop "$pkgdir/usr/share/applications/$_f.desktop"
  done
  cd "$srcdir/$_gitname"
   # workaround terminfo installation
  export TERMINFO="$pkgdir/usr/share/terminfo"
  install -d "$TERMINFO"
  make DESTDIR="$pkgdir" install
  # install the tabbing wrapper ( requires gtk2-perl! )
  sed -i 's/\"rxvt\"/"urxvt"/' doc/rxvt-tabbed
  install -Dm 755 doc/rxvt-tabbed "$pkgdir/usr/bin/urxvt-tabbed"
}

# vim:set ts=2 sw=2 et:
