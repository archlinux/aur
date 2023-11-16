# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: jjacky
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
# Contributor: Hermann Mayer <hermann.mayer92@gmail.com>

# clear.patch based on patch by rlblaster: https://bbs.archlinux.org/viewtopic.php?id=129302

_pkgname=rxvt-unicode
pkgname=${_pkgname}-better-wheel-scrolling-unicode3
pkgver=9.31
pkgrel=1
pkgdesc="Same like rxvt-unicode-better-wheel-scrolling + enabled frills+unicode3 to support (vim) powerline/airline (http://powerline.readthedocs.io/en/master/troubleshooting.html#urxvt-unicode3-and-frills)"
arch=('i686' 'x86_64')
url="http://software.schmorp.de/pkg/rxvt-unicode.html"
license=('GPL')
depends=('rxvt-unicode-terminfo' 'gcc-libs' 'libxft' 'gdk-pixbuf2' 'libptytty' 'libxext')
optdepends=('perl: lots of utilities') # 'gtk2-perl: to use the urxvt-tabbed')
makedepends=('perl-pod-parser')
provides=($_pkgname)
conflicts=($_pkgname ${_pkgname}-better-wheel-scrolling)
source=(http://dist.schmorp.de/rxvt-unicode/${_pkgname}-${pkgver}.tar.bz2 \
        ${_pkgname}.desktop
        clear.patch secondaryWheel.patch)
sha1sums=('44b31b4d9890aea4a6d66998bfb0c39e727fdf39'
          '9a31b46324c0be44fb97be0828e1ead2311b3f9f'
          'fc77f75bd2d51baa4abef81983dab044d7f498ce'
          'e76432e08ed7723deba23777b0b8c00cf39037d3')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -p1 -i ../clear.patch
  patch -p1 -i ../secondaryWheel.patch
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  # workaround ncurses --disable-root-access (FS#79143)
  export TIC="/usr/bin/tic -o${srcdir}/terminfo"
  ./configure --prefix=/usr \
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
    --enable-unicode3 \
    --enable-frills
  make alldoc
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
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
