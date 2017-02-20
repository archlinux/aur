# $Id$
# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Adapted for Chromebook by dhead666, for more details visit https://github.com/dhead666/archlinux-pkgbuilds/tree/master/xkeyboard-config-chromebook
# Maintainer: Evan Anderson <evananderson@thelinuxman.us>

pkgname=xkeyboard-config-chromebook
_pkgname=xkeyboard-config
pkgver=2.20
pkgrel=1
pkgdesc="X keyboard configuration files"
arch=(any)
license=('custom')
url="https://www.freedesktop.org/wiki/Software/XKeyboardConfig"
makedepends=('intltool' 'xorg-xkbcomp' 'libxslt')
provides=('xkbdata', 'xkeyboard-config')
replaces=('xkbdata')
conflicts=('xkbdata', 'xkeyboard-config')
source=(https://xorg.freedesktop.org/archive/individual/data/${_pkgname}/${_pkgname}-${pkgver}.tar.bz2{,.sig}
        xkeyboard-config-chromebook.install 
        0001-chromebook-add-function-keys.patch
        0002-chromebook-set-altgr-backspace-as-delete.patch
        0003-chromebook-set-alt-shift-arrows-as-pgup-pgdown-home-.patch
        0004-chromebook-add-English-US-Chromebook-layout-with-alt.patch
        0005-chromebook-set-f3-key-as-reload.patch
        0006-chromebook-set-f5-key-chrome-os-overview-as-printscr.patch)
validpgpkeys=('FFB4CCD275AAA422F5F9808E0661D98FC933A145'
              'SKIP'
              'SKIP'
              'SKIP'
              'SKIP'
              'SKIP'
              'SKIP')

sha256sums=('d1bfc72553c4e3ef1cd6f13eec0488cf940498b612ab8a0b362e7090c94bc134'
            'SKIP'
            '9a61685fb34a3845d02e6f1bd609a962bbcf528c5302acc209da94d8eb19dabc'
            '6bc40e442626080cf84e1d76b79bdd2d66940dc8e856193d56e45d5151a042ab'
            '7fd87f379c90ce4dc4b8f2bf09bd74fd893f880847cacca6dc6ea4990d8519cc'
            '2dd24df45e3975cd7f6e50a1d20291ba2eecf72487d3d60d84d9ee4e694e8a6b'
            'ba29d6a0040437b873f02d8e4390fce1602f6d99bda66fcb4eddf7cd3c35e861'
            '8dc3b478ab7323e9b701c5ecf437bcf3cd0ac009b589098adb85d5b799c12183'
            '97619867123c9764c6736a8c58f53b1a69c08deda771f18d80540554e6d94430')
install=xkeyboard-config-chromebook.install

build() {
  cd ${_pkgname}-${pkgver}
  
  echo 'Adding Chromebook function keys...'
  patch -p1 -i "${srcdir}/0001-chromebook-add-function-keys.patch"
  
  echo 'Setting AltGR+Backspace as Delete...'
  patch -p1 -i "${srcdir}/0002-chromebook-set-altgr-backspace-as-delete.patch"

  echo 'Setting up Alt+Shift+Arrows as PgUp, PgDown, Home and End'
  patch -p1 -i "${srcdir}/0003-chromebook-set-alt-shift-arrows-as-pgup-pgdown-home-.patch"

  echo 'Adding new layout: English (US, Chromebook)...'
  patch -p1 -i "${srcdir}/0004-chromebook-add-English-US-Chromebook-layout-with-alt.patch"

  echo 'Setting up F3 as XF86Reload...'
  patch -p1 -i "${srcdir}/0005-chromebook-set-f3-key-as-reload.patch"

  echo 'Setting up F5 as PrintScr...'
  patch -p1 -i "${srcdir}/0006-chromebook-set-f5-key-chrome-os-overview-as-printscr.patch"

  ./configure --prefix=/usr \
      --with-xkb-base=/usr/share/X11/xkb \
      --with-xkb-rules-symlink=xorg \
      --enable-compat-rules=yes
  make
 }
 
 package() { 
  cd ${_pkgname}-${pkgver}

  make DESTDIR="${pkgdir}" install
  rm -f "${pkgdir}/usr/share/X11/xkb/compiled"

  install -m755 -d "${pkgdir}/var/lib/xkb"
  install -m755 -d "${pkgdir}/usr/share/licenses/${_pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/"
}
