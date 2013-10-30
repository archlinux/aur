# Maintainer: jjacky
# Contributor: Angel Velasquez <angvp@archlinux.org> 
# Contributor: tobias <tobias@archlinux.org>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org

# clear.patch based on patch by rlblaster: https://bbs.archlinux.org/viewtopic.php?id=129302

_pkgname=rxvt-unicode
pkgname=${_pkgname}-better-wheel-scrolling
pkgver=9.19
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
md5sums=('45ad197eb9b5a840c0f65e3a8131921c'
         'af8e6ad4cd2d33c26f8df6a838685332'
         '9fecdb0265bd58c3896548e43ef00b6b'
         '37fd5b2ca79d2e1c6c4ed5c75696388b')
sha1sums=('979f990b73cf057d81f25884668f362b5a748154'
          '9a31b46324c0be44fb97be0828e1ead2311b3f9f'
          '013bd0d29b922aaccebb6d48092ed3694ea92d6f'
          '332ac4885c0e0b3c83db9b94dd18ced5593191b8')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -p1 -i ../clear.patch
  patch -p1 -i ../secondaryWheel.patch
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
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
