# Maintainer: jjacky
# Contributor: Angel Velasquez <angvp@archlinux.org> 
# Contributor: tobias <tobias@archlinux.org>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org

# clear.patch based on patch by rlblaster: https://bbs.archlinux.org/viewtopic.php?id=129302

_pkgname=rxvt-unicode
pkgname=${_pkgname}-better-wheel-scrolling
pkgver=9.18
pkgrel=1
pkgdesc="An unicode enabled rxvt-clone terminal emulator (urxvt) w/ better wheel scrolling (VTE-like) (& no utmp/wtmp support)"
arch=('i686' 'x86_64')
url="http://software.schmorp.de/pkg/rxvt-unicode.html"
license=('GPL')
depends=('gcc-libs' 'libxft' 'gdk-pixbuf2')
optdepends=('perl: lots of utilities') # 'gtk2-perl: to use the urxvt-tabbed')
provides=('rxvt-unicode')
conflicts=('rxvt-unicode')
source=(http://dist.schmorp.de/rxvt-unicode/${_pkgname}-${pkgver}.tar.bz2 \
        ${_pkgname}.desktop
        clear.patch secondaryWheel.patch)
md5sums=('963ccc748fe5bca925e7b92c0404d68b'
         '4723fc20ed200c86caf8c8680a1be26b'
         '5714991c5b1bf5f7d7769961e391a0db'
         'a6011928fe8734591544f70083b995c7')
sha1sums=('5d12639c4b17019357ee62c08916b826e5d03259'
          'd4eea2dd1834b596c715ec9ea239e70788f49a8f'
          '089e0263722412dd82008ae3e2b3eb335fc8116e'
          '7b2de8c206babc4a8baea1f8c3a4219dcfa03750')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -p1 -i ../clear.patch
  patch -p1 -i ../secondaryWheel.patch
  ./configure --prefix=/usr \
    --with-terminfo=/usr/share/terminfo \
    --enable-256-color \
    --enable-font-styles \
    --enable-xim \
    --enable-keepscrolling \
    --enable-selectionscrolling \
    --enable-smart-resize \
    --enable-pixbuf \
    --enable-transparency \
    --disable-utmp \
    --disable-wtmp \
    --enable-lastlog \
    --disable-frills
  make alldoc
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -d "${pkgdir}/usr/share/terminfo"
  export TERMINFO="${pkgdir}/usr/share/terminfo"
  make DESTDIR="${pkgdir}" install
#  # for utmp/wtmp support
#  chgrp utmp $pkgdir/usr/bin/urxvt
#  chmod g+s $pkgdir/usr/bin/urxvt
# # install the tabbing wrapper ( requires gtk2-perl! )
#  sed -i 's/\"rxvt\"/"urxvt"/' doc/rxvt-tabbed
#  install -Dm 755 doc/rxvt-tabbed "${pkgdir}/usr/bin/urxvt-tabbed"
 # install freedesktop menu
  install -Dm644 ../${_pkgname}.desktop \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
