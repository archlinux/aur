# Maintainer: qdesjardin <qdesjardin gmail com>

_pkgname=rtorrent
pkgname=rtorrent-ps-ch
_pkgver=0.9.8
pkgver=1.8.3
pkgrel=2
pkgdesc='Extended rTorrent-ps with additional UI patches, general fixes and enhancements'
license=('GPL2')
arch=('any')
url='https://github.com/chros73/rtorrent-ps-ch'
depends=('curl>=7.15.4' 'ncurses' 'xmlrpc-c' 'libtorrent-ps-ch')
provides=('rtorrent')
conflicts=('rtorrent' 'rtorrent-ps')

source=("https://github.com/rakshasa/$_pkgname/archive/v$_pkgver.tar.gz"
	'backport_rt_all_02-display_throttle_speed.patch'
	'backport_rt_all_04-partially_done_and_choke_group_fix.patch'
	'backport_rt_all_05-honor_system_file_allocate_fix.patch'
	'backport_rt_all_08-info_pane_xb_sizes.patch'
	'backport_rt_all_09-inotify_mod.patch'
	'backport_rt_all_80-ps-dl-ui-find.patch'
	'command_pyroscope.cc'
	'ps-import.return_all.patch'
	'ps-include-timestamps_all.patch'
	'ps-info-pane-is-default_all.patch'
	'ps-issue-515_all.patch'
	'ps-item-stats-human-sizes_all.patch'
	'ps-log_messages_all.patch'
	'ps-object_std-map-serialization_all.patch'
	'ps-silent-catch_all.patch'
	'ps-ui_pyroscope_all.patch'
	'pyroscope_all.patch'
	'ui_pyroscope_all.patch'
	'ui_pyroscope.cc'
	'ui_pyroscope.h')

md5sums=('ca17bdc9eeec19a8dd50cc5c5cf5daf1'
         'ce66d01d8f2a340a40620c579f568fd7'
         'b0fb83dbb862afe535ad60effe8aea1f'
         '9b4fee1aaeb4174edea92b2227ba708b'
         'b78b77a7a757bfd49bc280d07470c09e'
         '81bc9756831d54e2f2960a20cda1d049'
         '4861fe6f9530436490f8a6e70a5d7fac'
         'd68073da455851d628b587b852b4b54a'
         'cc9bbf20acf855e551ca2f80cac91903'
         'af57d10774c66c9cc0e9d3a74fff226d'
         '398c132d99dcf9f45252043ece176dd6'
         'c4b419c3ebdb856ab02d68955d66eea8'
         '2d34e8c86c1c6ed1354b55ca21819886'
         'a4f5a4da3397e4b1d71eb59a5e8e0279'
         '0fa551b7cba264bd906e32827d06700c'
         'e3f367abe42d28168008f99a9bf0f1d6'
         '7a88f8ab5d41242fdf1428de0e2ca182'
         'bd04a0699b80c8042e1cf63a7e0e4222'
         'b9578a640f5ee30c1a50dccf7531064c'
         '5befaa2e705a550a6dcd7f397060df81'
         '0e9791d796e2185279d7f109b064576b')

prepare() {
  cd "$srcdir/$_pkgname-$_pkgver"

  # Version Handling
  rt_hex_version=$(printf "0x%02X%02X%02X" ${pkgver//./ })
  sed -i "s:\\(AC_DEFINE(HAVE_CONFIG_H.*\\):\1  AC_DEFINE(RT_HEX_VERSION, $rt_hex_version, for CPP if checks):" configure.ac

  sed -i "s%rTorrent \\\" VERSION \\\"/\\\"%$pkgname $pkgver \\\"%" src/ui/download_list.cc
  sed -i "s%std::string(torrent::version()) + \\\" - \\\" +%%" src/ui/download_list.cc

  # Patching to rtorrent-ps-ch
  for corepatch in "$srcdir"/ps-*.patch; do
    test ! -e "$corepatch" || { msg2 "$(basename $corepatch)"; patch -uNp1 -i "$corepatch"; }
  done

  for backport in "$srcdir"/{backport,misc}_rt_*.patch; do
    test ! -e "$backport" || { msg2 "$(basename $backport)"; patch -uNp1 -i "$backport"; }
  done

  for pyropatch in "$srcdir"/pyroscope_*.patch; do
    test ! -e "$pyropatch" || { msg2 "$(basename $pyropatch)"; patch -uNp1 -i "$pyropatch"; }
  done

  for i in "$srcdir"/*.{cc,h}; do
    ln -nfs "$i" src
  done

  for uipyropatch in "$srcdir"/ui_pyroscope_*.patch; do
    test ! -e "$uipyropatch" || { msg2 "$(basename $uipyropatch)"; patch -uNp1 -i "$uipyropatch"; }
  done

  ./autogen.sh
}

build() {
  cd "$srcdir/$_pkgname-$_pkgver"

  ./configure \
    --prefix=/usr \
    --with-ncursesw \
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
