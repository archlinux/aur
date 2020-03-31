# Maintainer: Marc Straube <email@marcstraube.de>
# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=xkeyboard-config-adnw
_pkgbase=xkeyboard-config
pkgver=2.29
pkgrel=1
pkgdesc="X keyboard configuration files with AdNW, AdNWzj, BU-Teck, KOY keymap variants."
arch=(any)
license=('custom')
url="https://www.freedesktop.org/wiki/Software/XKeyboardConfig"
makedepends=('intltool' 'xorg-xkbcomp' 'libxslt' 'python')
provides=('xkbdata' 'xkeyboard-config')
replaces=('xkbdata')
conflicts=('xkbdata' 'xkeyboard-config')
source=(https://xorg.freedesktop.org/archive/individual/data/${_pkgbase}/${_pkgbase}-${pkgver}.tar.bz2{,.sig}
        http://509.ch/AdNW-xkc.tar.xz)
validpgpkeys=('FFB4CCD275AAA422F5F9808E0661D98FC933A145')
validpgpkeys+=('15CFA5C595041D2CCBEA155F1732AA424A0E86B4') # "Sergey Udaltsov (For GNOME-related tasks) <svu@gnome.org>"
sha512sums=('202255af097f3063d76341d1b4a7672662dc645f9bcd7afa87bc966a41db4c20fc6b8f4fbe2fcaec99b6bc458eac10129141a866a165857c46282f6705b78670'
            'SKIP'
            '7016b9eb32b777c556c9874c5bad0f04111761223dfd7ede539df751e398f1ebabaf6381062d83c8ad1bd9b237575394dbc1f032d4518187ca62a45a8684f784')

build() {
  cd ${_pkgbase}-${pkgver}
  ./configure --prefix=/usr \
      --with-xkb-base=/usr/share/X11/xkb \
      --with-xkb-rules-symlink=xorg \
      --enable-compat-rules=yes
  make
 }
 
 package() { 
  cd ${_pkgbase}-${pkgver}

  make DESTDIR="${pkgdir}" install
  rm -f "${pkgdir}/usr/share/X11/xkb/compiled"

  install -m755 -d "${pkgdir}/var/lib/xkb"
  install -m755 -d "${pkgdir}/usr/share/licenses/${_pkgbase}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${_pkgbase}/"

  tar xpf "${srcdir}/AdNW-xkc/xkb.tar" -C "${pkgdir}/usr/share/X11/"
  install -m644 "${srcdir}/AdNW-xkc/xkeyboard-config.mo" "${pkgdir}/usr/share/locale/de/LC_MESSAGES/xkeyboard-config.mo"
  install -m644 "${srcdir}/AdNW-xkc/xkeyboard-config.7" "${pkgdir}/usr/share/man/man7/xkeyboard-config.7"
}
