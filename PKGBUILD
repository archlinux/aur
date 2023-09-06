# Maintainer: Zola Gonano <zolagonano@protonmail.com>

pkgname=rxvt-unicode-downgrade
_pkgname=rxvt-unicode
pkgver=9.30
pkgrel=1
arch=('x86_64')
provides=(rxvt-unicode)
conflicts=(rxvt-unicode)
url='http://software.schmorp.de/pkg/rxvt-unicode.html'
license=('GPL')
makedepends=('libxft' 'libxt' 'perl' 'startup-notification' 'libnsl' 'libptytty')
source=(http://dist.schmorp.de/rxvt-unicode/${_pkgname}-${pkgver}.tar.bz2
        perl-5.38.patch
        urxvt.desktop
        urxvtc.desktop
        urxvt-tabbed.desktop)
sha256sums=('fe1c93d12f385876457a989fc3ae05c0915d2692efc59289d0f70fabe5b44d2d'
            '4bec0bf559a2eb6649e077b220fe25f532a8bc3da98ac519bc72a39b223e2cc4'
            '5f9c435d559371216d1c5b49c6ec44bfdb786b12d925d543c286b0764dea0319'
            '91536bb27c6504d6cb0d33775a0c4709a4b439670b900f0c278c25037f19ad66'
            'ccd7c436e959bdc9ab4f15801a67c695b382565b31d8c352254362e67412afcb')

prepare() {
  patch -d $_pkgname-$pkgver -p1 < perl-5.38.patch # Locale fix for perl 5.38
}


build() {
  cd ${_pkgname}-${pkgver}
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
    --disable-pixbuf \
    --disable-frills
  make
}

package() {
  pkgdesc='rxvt-unicode downgrade to fix prompt issue in version 9.31'
  depends=('rxvt-unicode-terminfo' 'libxft' 'perl' 'startup-notification' 'libnsl' 'libptytty')
  optdepends=('gtk2-perl: to use the urxvt-tabbed')

  # install freedesktop menu
  for _f in urxvt urxvtc urxvt-tabbed; do
    install -Dm 644 ${_f}.desktop "${pkgdir}/usr/share/applications/${_f}.desktop"
  done

  cd ${_pkgname}-${pkgver}
  # workaround terminfo installation
  sed -Eie '/(^[[:blank:]]+\/usr\/bin\/tic)/s//#&/g' doc/Makefile
  make DESTDIR="${pkgdir}" install
  # install the tabbing wrapper ( requires gtk2-perl! )
  sed -i 's/\"rxvt\"/"urxvt"/' doc/rxvt-tabbed
  install -Dm 755 doc/rxvt-tabbed "${pkgdir}/usr/bin/urxvt-tabbed"
}

# vim: ts=2 sw=2 et:

