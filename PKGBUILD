# Maintainer: Daniel Hahler <archlinux+aur@thequod.de>
# Contributor: Florian Bruhin (The-Compiler) <archlinux.org@the-compiler.org>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Sébastien Luttringer <seblu@aur.archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org

_pkgname=rxvt-unicode
pkgname=rxvt-unicode-cvs-patched-wideglyphs
pkgver=20170412
pkgrel=9
pkgdesc='Unicode enabled rxvt-clone terminal emulator (urxvt) with fixed font spacing and wide glyphs patch (cvs version)'
arch=('i686' 'x86_64')
url='http://software.schmorp.de/pkg/rxvt-unicode.html'
license=('GPL')
depends=('libxft' 'perl' 'startup-notification' 'rxvt-unicode-terminfo')
makedepends=('cvs')
optdepends=('gtk2-perl: to use the urxvt-tabbed')
provides=(rxvt-unicode)
conflicts=(rxvt-unicode)
source=('urxvt.desktop'
        'urxvtc.desktop'
        'urxvt-tabbed.desktop'
        'font-width-fix.patch'
        'line-spacing-fix.patch'
        'sgr-mouse-mode.patch'
        'add-space-to-extent_test_chars.patch'
        'enable-wide-glyphs.patch')
sha1sums=('b5a4507f85ebb7bac589db2e07d9bc40106720d9'
          '62c4ffecfce6967def394dd4d418b68652372ea2'
          'cd204d608d114d39c80331efe0af0231ad6b7e18'
          '01ee8f212add79a158dcd4ed78d0ea1324bdc59b'
          'b7fde1c46af45e831828738874f14b092b1e795f'
          'f478acf3662aab3f5b1703a4a29bcfe055dbdd66'
          '69b77c0b4b4587117f3a6e240a5bd6389ed40be3'
          '5b37be933d9b6cc1f7e3129a69c338d232bf7808')

prepare() {
  cd ${srcdir}
  cvs -z3 -d :pserver:anonymous@cvs.schmorp.de/schmorpforge co ${_pkgname}

  cd $_pkgname
  patch -p0 -i ../font-width-fix.patch
  patch -p0 -i ../line-spacing-fix.patch
  patch -p0 -i ../sgr-mouse-mode.patch
  patch -p1 -i ../enable-wide-glyphs.patch
}

build() {
  cd ${srcdir}/${_pkgname}

  # do not specify --with-terminfo (FS#46424)
  ./configure \
    --prefix=/usr \
    --enable-256-color \
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
    --enable-smart-resize \
    --enable-startup-notification \
    --enable-transparency \
    --enable-unicode3 \
    --enable-utmp \
    --enable-wide-glyphs \
    --enable-wtmp \
    --enable-xft \
    --enable-xim \
    --enable-xterm-scroll
  make
}

package() {

  # install freedesktop menu
  for _f in urxvt urxvtc urxvt-tabbed; do
    install -Dm644 $_f.desktop "$pkgdir/usr/share/applications/$_f.desktop"
  done

  cd $_pkgname

  # workaround terminfo installation
  export TERMINFO="$srcdir/terminfo"
  install -d "$TERMINFO"
  make DESTDIR="$pkgdir" install

  # install the tabbing wrapper ( requires gtk2-perl! )
  sed -i 's/\"rxvt\"/"urxvt"/' doc/rxvt-tabbed
  install -Dm 755 doc/rxvt-tabbed "$pkgdir/usr/bin/urxvt-tabbed"
}
