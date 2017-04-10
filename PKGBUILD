# Maintainer: xsmile <sascha_r gmx de>

_pkgname=rtorrent
pkgname=rtorrent-ps
_pkgver=0.9.6
pkgver=1.0.r55.g1f648ee
pkgrel=1
pkgdesc='Extended rTorrent distribution with UI enhancements, colorization, and some added features'
url='https://github.com/pyroscope/rtorrent-ps'
license=('GPL')
arch=('any')
depends=('cppunit' 'curl>=7.15.4' 'libtorrent-ps>=1.0' 'ncurses' 'xmlrpc-c')
provides=('rtorrent')
conflicts=('rtorrent' 'rtorrent-cdl' 'rtorrent-color' 'rtorrent-git' 'rtorrent-ipv6' 'rtorrent-ps-git' 'rtorrent-pyro-git' 'rtorrent-vi-color')
source=("https://github.com/rakshasa/$_pkgname/archive/$_pkgver.tar.gz"
        'command_pyroscope.cc'
        'ps-event-view_all.patch'
        'ps-fix-double-slash-319_all.patch'
        'ps-fix-sort-started-stopped-views_all.patch'
        'ps-handle-sighup-578_all.patch'
        'ps-info-pane-xb-sizes_all.patch'
        'ps-item-stats-human-sizes_all.patch'
        'ps-ssl_verify_host_all.patch'
        'ps-throttle-steps_all.patch'
        'ps-ui_pyroscope_all.patch'
        'ps-view-filter-by_all.patch'
        'pyroscope.patch'
        'ui_pyroscope.cc'
        'ui_pyroscope.h'
        'ui_pyroscope.patch')
md5sums=('b8b4009f95f8543244ae1d23b1810d7c'
         '4ad3ae94e76106add9e228ac768c9881'
         '56701bca42cc9b309637bf3f918ede12'
         '22fae392c6e281dc438b39a5019e7e1b'
         '3fd739c0d5a9442f0cdec9ed5a720eaa'
         '2137e16f8b881170fb92fb7a6c276193'
         'f1539d70c74e5c74d8a15d51675aa26c'
         '2d34e8c86c1c6ed1354b55ca21819886'
         'cef14e9011d4b4af92536b02f8b611c2'
         'ee76d57dfbc40e09eeaee3845d327d94'
         '7a88f8ab5d41242fdf1428de0e2ca182'
         '26faff00b306b6ef276a7d9e6d964994'
         'bd04a0699b80c8042e1cf63a7e0e4222'
         'eaed2a7fea74c6ac46cc4dc93d868074'
         '1258acfc82c50a8f452ace87fef0b416'
         '0a2bbaf74c7160ba33876dcc2f050f14')

prepare() {
  cd "$srcdir/$_pkgname-$_pkgver"

  # Version handling
  RT_HEX_VERSION=$(printf "0x%02X%02X%02X" ${_pkgver//./ })
  sed -i -e "s:\\(AC_DEFINE(HAVE_CONFIG_H.*\\):\1  AC_DEFINE(RT_HEX_VERSION, "$RT_HEX_VERSION", for CPP if checks):" configure.ac
  grep "AC_DEFINE.*API_VERSION" configure.ac >/dev/null || sed -i -e "s:\\(AC_DEFINE(HAVE_CONFIG_H.*\\):\1  AC_DEFINE(API_VERSION, 0, api version):" configure.ac

  # Patch rTorrent
  for corepatch in $srcdir/ps-*_{${_pkgver},all}.patch; do
    test ! -e "$corepatch" || { msg2 "$(basename $corepatch)"; patch -uNp1 -i "$corepatch"; }
  done

  msg2 "pyroscope.patch"
  patch -uNp1 -i "$srcdir/pyroscope.patch"
  for i in "$srcdir"/*.{cc,h}; do
    ln -nsf "$i" src
  done

  msg2 "ui_pyroscope.patch"
  patch -uNp1 -i "$srcdir/ui_pyroscope.patch"

  sed -i -e 's/rTorrent \" VERSION/rTorrent PS-'"$pkgver"' " VERSION/' src/ui/download_list.cc

  ./autogen.sh
}

build() {
  cd "$srcdir/$_pkgname-$_pkgver"

  ./configure \
    --prefix=/usr \
    --with-xmlrpc-c \
    --disable-debug \
    --disable-instrumentation
  make
}

package() {
  cd "$srcdir/$_pkgname-$_pkgver"

  make DESTDIR="$pkgdir" install

  install -Dm644 "doc/faq.xml"        "$pkgdir/usr/share/doc/$_pkgname/faq.xml"
  install -Dm644 "doc/old/rtorrent.1" "$pkgdir/usr/share/man/man1/$_pkgname.1"
  install -Dm644 "doc/rtorrent.rc" "$pkgdir/usr/share/doc/$_pkgname/rtorrent.rc"
  install -Dm644 "doc/rtorrent_fast_resume.pl" "$pkgdir/usr/share/doc/$_pkgname/rtorrent_fast_resume.pl"
}
