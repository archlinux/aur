# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: Connor Behan <connor dot behan at gmail dot com>
# Contributor: Eric Bélanger <eric at archlinux dot org>

pkgname=glib1
pkgver=1.2.10
pkgrel=1
pkgdesc="Common C routines used by GTK+ and other libs"
arch=('i686' 'x86_64')
url="http://www.gtk.org/"
license=('LGPL')
depends=('glibc' 'sh')
provides=('glib')
conflicts=('glib')
replaces=('glib')
options=('!makeflags')
install=${pkgname}.install
source=("ftp://ftp.gnome.org/pub/gnome/sources/glib/1.2/${pkgname%1}-${pkgver}.tar.gz"
	    "gcc340.patch" "aclocal-fixes.patch" "glib1-autotools.patch")
sha512sums=('4452b741382194d4ca425f084fa60e1a9e30040ac2e839c9136047d0461cf4b1ebcc16aac4e65998d1b9329ead8f617966b3d09317a83634f14d556a7e14b7a8'
            'a850b824b55d89fed7a4730c99487aaf24d75e28ae71c195d5edfca4b0db4676ff8a2809bb3c537588e19c8e7ff736a71541505b9f174192785f458c3edc50fe'
            '24fe03a4b767face55a1ca5f8f99ee44e7852adf5c5749ae11aed34d4453ecbabe22b3254eeced4201370b8df91fa46c7746bb7f5116dfcb53670919d031d97d'
            '0b6710db46ebed7a518791623cc08b31fed914965d2be30e93ee113f1a5333db6e9d21a6e474fa1751dd99395871fc597af14c4c0bc4136a5a222a6d7cd6b703')

prepare() {
  cd "${srcdir}/${pkgname%1}-${pkgver}"
  patch -Np1 -i "${srcdir}/gcc340.patch"
  patch -Np0 -i "${srcdir}/aclocal-fixes.patch"
  patch -Np1 -i "${srcdir}/glib1-autotools.patch"
  sed -i -e 's/ifdef[[:space:]]*__OPTIMIZE__/if 0/' glib.h
}

build() {
  cd "${srcdir}/${pkgname%1}-${pkgver}"
  autoreconf --force --install
  if [[ $CARCH = "i686" ]]; then
    ./configure --prefix=/usr --mandir=/usr/share/man --infodir=/usr/share/info --host=i686-pc-linux-gnu --target=i686-pc-linux-gnu
  elif [[ $CARCH = "x86_64" ]]; then
    ./configure --prefix=/usr --mandir=/usr/share/man --infodir=/usr/share/info --host=x86_64-unknown-linux-gnu --target=x86_64-unknown-linux-gnu
  fi

  make
}

check() {
  cd "${srcdir}/${pkgname%1}-${pkgver}"
  make check
}

package() {
  cd "${srcdir}/${pkgname%1}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
