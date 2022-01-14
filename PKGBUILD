# Maintainer: Lukas Tobler <luk4s.tobler@gmail.com>

_pkgname=rxvt-unicode
pkgname=rxvt-unicode-256xresources
pkgver=9.30
pkgrel=1
pkgdesc="urxvt with patches to support 256 Xresource colors and fixes for line/font spacing"
arch=('x86_64')
url="http://software.schmorp.de/pkg/rxvt-unicode.html"
license=('GPL')
makedepends=('libxft' 'perl' 'startup-notification' 'libnsl')
depends=('rxvt-unicode-terminfo' 'libxft' 'perl' 'startup-notification' 'libnsl' 'libptytty')
optdepends=('gtk2-perl: to use the urxvt-tabbed')
source=(http://dist.schmorp.de/rxvt-unicode/$_pkgname-$pkgver.tar.bz2
        font-width-fix.patch
        line-spacing-fix.patch
        256color.patch
        urxvt.desktop
        urxvtc.desktop
        urxvt-tabbed.desktop)
provides=(rxvt-unicode)
conflicts=(rxvt-unicode)
sha256sums=('fe1c93d12f385876457a989fc3ae05c0915d2692efc59289d0f70fabe5b44d2d'
            '686770fe4e8d6bb0ba497ad2e1f217d17515f2544d80abe76496c63ead2bfaa4'
            '546a388d0595404a59c71c3eaeba331031032a75f96c57e9a860f27bbd7ebfcc'
            'e51a598ee616b5953c991a4135dd1acc13a62f1180a8b842297f5401df55dc69'
            '5f9c435d559371216d1c5b49c6ec44bfdb786b12d925d543c286b0764dea0319'
            '91536bb27c6504d6cb0d33775a0c4709a4b439670b900f0c278c25037f19ad66'
            'ccd7c436e959bdc9ab4f15801a67c695b382565b31d8c352254362e67412afcb')
build() {
  cd "$srcdir/$_pkgname-$pkgver"
  patch -p0 -i ../256color.patch
  patch -p0 -i ../font-width-fix.patch
  patch -p0 -i ../line-spacing-fix.patch
  # we disable smart-resize (FS#34807)
  # do not specify --with-terminfo (FS#46424)
  ./configure  \
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
    --disable-pixbuf \
    --disable-frills
  make
}

package() {
  #install freedesktop menu
  for _f in urxvt urxvtc urxvt-tabbed; do
    install -Dm644 ${_f}.desktop "${pkgdir}/usr/share/applications/${_f}.desktop"
  done

  cd ${_pkgname}-${pkgver}

  #workaround terminfo installation
  export TERMINFO="${srcdir}/terminfo"
  install -d "${TERMINFO}"
  make DESTDIR="${pkgdir}" install

  #install the tabbing wrapper ( requires gtk2-perl! )
  sed -i 's/\"rxvt\"/"urxvt"/' doc/rxvt-tabbed
  install -Dm 755 doc/rxvt-tabbed "${pkgdir}/usr/bin/urxvt-tabbed"
}
