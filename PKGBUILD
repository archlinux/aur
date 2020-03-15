# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: Sirocco <sirocco at ngs dot ru>

pkgname=bombono-dvd
pkgver=1.2.4
pkgrel=5
pkgdesc="DVD authoring program with nice and clean GUI"
arch=('i686' 'x86_64')
url="http://www.bombono.org"
license=('GPL')
depends=('gtk2' 'gtkmm' 'mjpegtools' 'ffmpeg' 'libdvdread' 'dvdauthor' \
         'dvd+rw-tools' 'twolame' 'libxml++2.6' 'boost' 'enca' 'cdrkit')
makedepends=('python2-scons')
optdepends=('gvfs: web browser integration')
conflicts=('bombono-dvd-git')
source=("https://github.com/muravjov/${pkgname}/archive/${pkgver}.tar.gz"
        "fix_ffmpeg_codecid.patch"
        "fix_ptr2bool_cast.patch"
        "fix_c++11_literal_warnings.patch"
        "autoptr2uniqueptr.patch"
        "inc_boost_header.patch"
        "fix_deprecated_boost_api.patch"
        "fix_throw_specifications.patch"
        "fix_operator_ambiguity.patch"
        "fix_ffmpeg30.patch")
install=bombono-dvd.install
sha256sums=('4f8c882a0c359ca8c182a627885c64aa271820eead2f9a64b34f1625c3b0a9d7'
            '63e47ffb812acb33a4d1f5d7f421eb2ccdf3ee1ce1b7f75267c32079dbc9dea1'
            'b0ff83b2fad27e39dfd77d12e00c25e554fe86ee1894c2f8fbe1915a2c46dd88'
            '28be98eb36eb6422717df7048c8ee74927495e7d7829e17cb54d746befc238c4'
            '4c29e9b19ba3bcf8c42c46aaea6c1411580629e581307a91f4d085fcdaa6eab6'
            '14687493ffe5f95c60d4397e4a9f7d7a8434159e2e4338570856b5ee3e683b50'
            'a69f51f9d5bd6ebe26c13abeece9de012d110dcec944c76efbab59b6bc0ef915'
            '72b3d6c76cbf98fb9287f7ee5b7a57b6febe2a635d50758c2451e376e3e6ca02'
            '9d56f7d16c55a506b092dbec00789e4767963d6202d3d92b79ad389393d43c69'
            'f6fd3a309987ac08b6f70132686c5a06bc7496fb6e1097539d6348f558d09502')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/fix_ffmpeg_codecid.patch"
  patch -Np1 -i "${srcdir}/fix_ptr2bool_cast.patch"
  patch -Np1 -i "${srcdir}/fix_c++11_literal_warnings.patch"
  patch -Np1 -i "${srcdir}/autoptr2uniqueptr.patch"
  patch -Np1 -i "${srcdir}/fix_deprecated_boost_api.patch"
  patch -Np1 -i "${srcdir}/fix_ffmpeg30.patch"
  patch -Np1 -i "${srcdir}/fix_throw_specifications.patch"
  patch -Np1 -i "${srcdir}/fix_operator_ambiguity.patch"
  patch -Np1 -i "${srcdir}/inc_boost_header.patch"
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
  scons2  PREFIX="/usr" DESTDIR="$pkgdir" CPPFLAGS="-std=c++14 -DBOOST_SYSTEM_NO_DEPRECATED -DBOOST_FILESYSTEM_NO_DEPRECATED -DBOOST_FILESYSTEM_VERSION=3" USE_EXT_BOOST=1
}

package() {
  cd "${pkgname}-${pkgver}"

  scons2 PREFIX="/usr" DESTDIR="$pkgdir" install
}

