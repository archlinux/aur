# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: Sirocco <sirocco at ngs dot ru>

pkgname=bombono-dvd
pkgver=1.2.2
pkgrel=8
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
        fix_ffmpeg_codecid.patch bombono-dvd-1.2.2-ffmpeg26.patch
        fix_ptr2bool_cast.patch fix_c++11_literal_warnings.patch fix_crefoftemp_bug.patch
        autoptr2uniqueptr.patch stream_bool_cast.patch
        fix_deprecated_boost_api.patch fix_ffmpeg30.patch)
install=bombono-dvd.install
sha256sums=('3ffaadc803dc2526d2805629ee928800ce150cb2e6a40b6724d898c76366f68b'
            'decc8f9261b0fcd18780080438c9fc4297d56a281355f195a5dee9a92abf474a'
            'ee89adeff7bd19d731eac96c180d5d59766bb3a68f3b21b898199e1cb6c5639e'
            '9471454c97d8b91b4234085f1eabc625d9e23e76a91266b205dc3f79553322b9'
            '31dfc5400d450490a53bbd386bafb59d68a9a2d6f9036755419d3be035aa87be'
            '0ea8ad5ccf64d30d0463e9bde5b07abdedd00e2da2fa7f3f72de99aa3915a64c'
            '9214f838377cdf35bf1f151e4eaac10952049ccff4d74ca485fc8b6f05bc8ba4'
            '62d0f56ab4c2512bf004756426da6bf63cc0bd134ae6bc60304cc20116277e27'
            '8abd4e79a34a4d919060443439127cca95412d79534eef6554c300f55a0425ed'
            'e345c0788991e6c6b5eaf0f271db4b0d9c0c0ff42757a4d67ebc023d352acc15')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/fix_ffmpeg_codecid.patch"
  patch -Np1 -i "${srcdir}/bombono-dvd-1.2.2-ffmpeg26.patch"
  patch -Np1 -i "${srcdir}/fix_ptr2bool_cast.patch"
  patch -Np1 -i "${srcdir}/fix_c++11_literal_warnings.patch"
  patch -Np1 -i "${srcdir}/fix_crefoftemp_bug.patch"
  patch -Np1 -i "${srcdir}/autoptr2uniqueptr.patch"
  patch -Np1 -i "${srcdir}/stream_bool_cast.patch"
  patch -Np1 -i "${srcdir}/fix_deprecated_boost_api.patch"
  patch -Np1 -i "${srcdir}/fix_ffmpeg30.patch"
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
}

build() {
  cd "${pkgname}-${pkgver}"
  scons  PREFIX="/usr" DESTDIR="$pkgdir" CPPFLAGS="-std=c++11 -DBOOST_SYSTEM_NO_DEPRECATED -DBOOST_FILESYSTEM_NO_DEPRECATED -DBOOST_FILESYSTEM_VERSION=3" USE_EXT_BOOST=1
}

package() {
  cd "${pkgname}-${pkgver}"

  scons PREFIX="/usr" DESTDIR="$pkgdir" install
}

