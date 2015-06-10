# $Id: PKGBUILD
# 2015.03.13  one more patch from gentoo

pkgname=bombono-dvd
pkgver=1.2.2
pkgrel=4
pkgdesc="DVD authoring program with nice and clean GUI"
arch=('i686' 'x86_64')
url="http://www.bombono.org"
license=('GPL')
depends=('gtk2' 'gtkmm' 'mjpegtools' 'ffmpeg' 'libdvdread' 'dvdauthor' \
         'dvd+rw-tools' 'twolame' 'libxml++' 'boost' 'enca' 'cdrkit')
makedepends=('scons')
optdepends=('gvfs: web browser integration')
conflicts=('bombono-dvd-git')
source=(http://downloads.sourceforge.net/bombono/$pkgname-$pkgver.tar.bz2
        fix_ffmpeg_codecid.patch bombono-dvd-1.2.2-ffmpeg26.patch)
install=bombono-dvd.install
sha256sums=('3ffaadc803dc2526d2805629ee928800ce150cb2e6a40b6724d898c76366f68b'
            'decc8f9261b0fcd18780080438c9fc4297d56a281355f195a5dee9a92abf474a'
            'ee89adeff7bd19d731eac96c180d5d59766bb3a68f3b21b898199e1cb6c5639e')

build() {
  cd "${pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/fix_ffmpeg_codecid.patch"
  patch -Np1 -i "${srcdir}/bombono-dvd-1.2.2-ffmpeg26.patch"
  # python2 fix
  for file in $(find . -name '*.py' -print); do
     sed -i 's_#!.*/usr/bin/python_#!/usr/bin/python2_' $file
     sed -i 's_#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done
  for file in $(find . -name 'SConscript*' -print); do
     sed -i 's_#!.*/usr/bin/python_#!/usr/bin/python2_' $file
     sed -i 's_#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done
  for file in $(find . -name 'menu_SConscript*' -print); do
     sed -i 's_#!.*/usr/bin/python_#!/usr/bin/python2_' $file
     sed -i 's_#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done
  sed -i -e 's_#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' Autoconfig
  for file in $(find . -name 'SConstruct*' -print); do
     sed -i 's_#!.*/usr/bin/python_#!/usr/bin/python2_' $file
     sed -i 's_#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done

  scons  PREFIX="/usr" DESTDIR="$pkgdir" CPPFLAGS="-DBOOST_SYSTEM_NO_DEPRECATED -DBOOST_FILESYSTEM_VERSION=3" USE_EXT_BOOST=1
}

package() {
  cd "${pkgname}-${pkgver}"

  scons PREFIX="/usr" DESTDIR="$pkgdir" install
}

