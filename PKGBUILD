# Maintainer: Adriaan Zonnenberg <amz@adriaan.xyz>
# Contributor: Florian Bruhin (The-Compiler) <archlinux.org@the-compiler.org>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Sébastien Luttringer
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org

_pkgname=rxvt-unicode
pkgname=rxvt-unicode-cvs
pkgver=20170518
pkgrel=1
pkgdesc='A unicode enabled rxvt-clone terminal emulator (urxvt) - latest cvs revision'
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
        'urxvt-tabbed.desktop')
sha1sums=('b5a4507f85ebb7bac589db2e07d9bc40106720d9'
          '62c4ffecfce6967def394dd4d418b68652372ea2'
          'cd204d608d114d39c80331efe0af0231ad6b7e18')

prepare() {
  cd ${srcdir}
  cvs -z3 -d :pserver:anonymous@cvs.schmorp.de/schmorpforge co ${_pkgname}
}

build() {
  cd ${srcdir}/${_pkgname}
  # we disable smart-resize (FS#34807)
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
    --disable-smart-resize \
    --enable-startup-notification \
    --enable-transparency \
    --enable-unicode3 \
    --enable-utmp \
    --enable-wtmp \
    --enable-xft \
    --enable-xim \
    --enable-xterm-scroll \
    --disable-frills
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
