# Maintainer: xsmile <>

_pkgname=rtorrent
pkgname=rtorrent-ps
_pkgver=0.9.6
pkgver=1.1.r54.ga787dd9
pkgrel=1
pkgdesc='Extended rTorrent distribution with UI enhancements, colorization, and some added features'
url='https://github.com/pyroscope/rtorrent-ps'
license=('GPL')
arch=('any')
depends=('curl' 'libtorrent-ps' 'ncurses' 'xmlrpc-c')
provides=('rtorrent')
conflicts=('rtorrent')
source=("https://github.com/rakshasa/$_pkgname/archive/v$_pkgver.tar.gz"
        'backport_0.9.6_algorithm_median.patch'
        'command_pyroscope.cc'
        'ps-close_lowdisk_normal_all.patch'
        'ps-dl-ui-find_all.patch'
        'ps-event-view_all.patch'
        'ps-fix-double-slash-319_all.patch'
        'ps-fix-log-xmlrpc-close_all.patch'
        'ps-fix-sort-started-stopped-views_all.patch'
        'ps-fix-throttle-args_all.patch'
        'ps-handle-sighup-578_all.patch'
        'ps-import.return_all.patch'
        'ps-info-pane-is-default_all.patch'
        'ps-info-pane-xb-sizes_all.patch'
        'ps-issue-515_all.patch'
        'ps-item-stats-human-sizes_all.patch'
        'ps-log_messages_all.patch'
        'ps-max_scgi_size_all.patch'
        'ps-object_std-map-serialization_all.patch'
        'ps-silent-catch_all.patch'
        'ps-ssl_verify_host_all.patch'
        'ps-throttle-steps_all.patch'
        'ps-ui_pyroscope_all.patch'
        'ps-view-filter-by_all.patch'
        'pyroscope.patch'
        'rt-base-cppunit-pkgconfig.patch'
        'ui_pyroscope.cc'
        'ui_pyroscope.h'
        'ui_pyroscope.patch')
md5sums=('b8b4009f95f8543244ae1d23b1810d7c'
         'b49903d3fa25a66c72db69570dfe8b47'
         '9e1b37fc7e5423245d7d07ece0590fd5'
         '5680c3d167dd3aaa87cd80437b50b4fe'
         '27e2b4099fa2b943812d80d9306dab79'
         'fbe511a1dfe89fe0510a077e61ae6ec7'
         '22fae392c6e281dc438b39a5019e7e1b'
         '1b4f82e6123c5baa0cd07056e368064e'
         '3fd739c0d5a9442f0cdec9ed5a720eaa'
         'ab490d1d1df9c27f3cf624966f7f03f6'
         '2137e16f8b881170fb92fb7a6c276193'
         'cc9bbf20acf855e551ca2f80cac91903'
         '398c132d99dcf9f45252043ece176dd6'
         'f1539d70c74e5c74d8a15d51675aa26c'
         'c438a91cd3e58edebf39fce06587641a'
         '2d34e8c86c1c6ed1354b55ca21819886'
         'a4f5a4da3397e4b1d71eb59a5e8e0279'
         '0cbbbb2c87d046d8a39c3a6da13e7187'
         '0fa551b7cba264bd906e32827d06700c'
         'e3f367abe42d28168008f99a9bf0f1d6'
         'cef14e9011d4b4af92536b02f8b611c2'
         'ee76d57dfbc40e09eeaee3845d327d94'
         '7a88f8ab5d41242fdf1428de0e2ca182'
         '26faff00b306b6ef276a7d9e6d964994'
         'bd04a0699b80c8042e1cf63a7e0e4222'
         'd0a956f0eb4b53b66d83df2a8a4d16dc'
         '39e18c251a6049b60c2c28b1494eff2a'
         '265c4ddeab5745a93c360a920a375dfe'
         '0a2bbaf74c7160ba33876dcc2f050f14')

prepare() {
  cd "$srcdir/$_pkgname-$_pkgver"

  # Version handling
  RT_HEX_VERSION=$(printf "0x%02X%02X%02X" ${_pkgver//./ })
  sed -i -e "s:\\(AC_DEFINE(HAVE_CONFIG_H.*\\):\1  AC_DEFINE(RT_HEX_VERSION, "$RT_HEX_VERSION", for CPP if checks):" configure.ac
  grep "AC_DEFINE.*API_VERSION" configure.ac >/dev/null || sed -i -e "s:\\(AC_DEFINE(HAVE_CONFIG_H.*\\):\1  AC_DEFINE(API_VERSION, 0, api version):" configure.ac

  RT_BASE_PATCHES=("$srcdir"/rt-base-cppunit-pkgconfig.patch)
  RT_PATCHES=()

  # Patch rTorrent
  for corepatch in "${RT_BASE_PATCHES[@]}" \
                   "$srcdir"/ps-*_{${_pkgver},all}.patch "${RT_PATCHES[@]}"; do
    test ! -e "$corepatch" || { msg2 "$(basename $corepatch)"; patch -uNp1 -i "$corepatch"; }
  done

  for backport in "$srcdir"/backport*_${_pkgver}_*.patch; do
    test ! -e "$backport" || { msg2 "$(basename $backport)"; patch -uNp1 -i "$backport"; }
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
    --disable-debug
  make
}

package() {
  cd "$srcdir/$_pkgname-$_pkgver"

  make DESTDIR="$pkgdir" install

  install -Dm644 "doc/faq.xml" "$pkgdir/usr/share/doc/$_pkgname/faq.xml"
  install -Dm644 "doc/old/rtorrent.1" "$pkgdir/usr/share/man/man1/$_pkgname.1"
  install -Dm644 "doc/rtorrent.rc" "$pkgdir/usr/share/doc/$_pkgname/rtorrent.rc"
  install -Dm644 "doc/rtorrent_fast_resume.pl" "$pkgdir/usr/share/doc/$_pkgname/rtorrent_fast_resume.pl"
}
