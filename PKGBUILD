# $Id$
# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Adapted for Chromebook by dhead666, for more details visit https://github.com/dhead666/archlinux-pkgbuilds/tree/master/xkeyboard-config-chromebook

pkgname=xkeyboard-config-chromebook
_pkgname=xkeyboard-config
pkgver=2.14
pkgrel=2
pkgdesc="X keyboard configuration files"
arch=(any)
license=('custom')
url="http://www.freedesktop.org/wiki/Software/XKeyboardConfig"
makedepends=('intltool' 'xorg-xkbcomp')
provides=('xkbdata', 'xkeyboard-config')
replaces=('xkbdata')
conflicts=('xkbdata', 'xkeyboard-config')
source=(http://xorg.freedesktop.org/archive/individual/data/${_pkgname}/${_pkgname}-${pkgver}.tar.bz2
        xkeyboard-config-chromebook.install 
        0001-chromebook-add-function-keys.patch
        0002-chromebook-set-altgr-backspace-as-delete.patch
        0003-chromebook-set-alt-shift-arrows-as-pgup-pgdown-home-.patch
        0004-chromebook-add-English-US-Chromebook-layout-with-alt.patch
        0005-chromebook-set-f3-key-as-reload.patch
        0006-chromebook-set-f5-key-chrome-os-overview-as-printscr.patch)

sha256sums=('dc91458a214c56a35727f9e523fc647615de64137057ca6ee4d4d4474a4bb2ae'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')
install=xkeyboard-config-chromebook.install

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  
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
  cd "${srcdir}/${_pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  rm -f "${pkgdir}/usr/share/X11/xkb/compiled"

  install -m755 -d "${pkgdir}/var/lib/xkb"
  install -m755 -d "${pkgdir}/usr/share/licenses/${_pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/"
}
