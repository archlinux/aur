# Maintainer: klanc <lewis at ledgedash dot com>
# Contributor: Florian Bruhin (The-Compiler) <archlinux.org@the-compiler.org>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Sébastien Luttringer
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
# Contributor: Daniel Hahler <archlinux+aur@thequod.de>

_pkgname=rxvt-unicode
pkgname=rxvt-unicode-fa-patched
pkgver=20190219
pkgrel=2
pkgdesc='A unicode enabled rxvt-clone terminal emulator (urxvt) - Patched to enable FontAwesome support + wcwidth'
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
        'FontAwesome.patch'
        'line-spacing-fix.patch'
        'wcwidthcallback.patch')
sha1sums=('b5a4507f85ebb7bac589db2e07d9bc40106720d9'
          '62c4ffecfce6967def394dd4d418b68652372ea2'
          'cd204d608d114d39c80331efe0af0231ad6b7e18'
          '9575c7a83817a7b347b3d739b4b55f9ed8a77859'
          'b7fde1c46af45e831828738874f14b092b1e795f'
          'c884f2be45073624c7f34ed6011e0a7dad3ffb22')

prepare() {
  cd ${srcdir}
  cvs -z3 -d :pserver:anonymous@cvs.schmorp.de/schmorpforge co ${_pkgname}
  cd ${_pkgname}
  echo "applying line-spacing-fix.patch"
  patch  -p0 -i ../../line-spacing-fix.patch
  echo "applying FontAwesome.patch"
  patch -p1 -i ../../FontAwesome.patch
  rm -f src/rxvtwcwidth.C src/rxvtwcwidth.h README.md
  echo "Applying wcwidthcallback.patch"
  patch  -Np1 -i ../../wcwidthcallback.patch

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
    --disable-frills \
    --enable-wcwidthpreload
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
