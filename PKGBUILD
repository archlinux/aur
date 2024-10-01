# Maintainer: xsmile <>

# Based on the current rtorrent version with the following additions:
# - updated pyroscope/rtorrent-ps patchset with several fixes from chros73/rtorrent-ps-ch
# - patches to fix compilation issues and crashes
_pkgname=rtorrent
pkgname=rtorrent-ps
_pkgver=0.9.8
pkgver=1.1.r71.gee296b1
pkgrel=2
pkgdesc='Extended rTorrent distribution with UI enhancements, colorization, and some added features'
url='https://github.com/pyroscope/rtorrent-ps'
license=('GPL-2.0-only')
arch=('any')
depends=('curl' 'libtorrent-ps' 'ncurses' 'xmlrpc-c')
provides=('rtorrent')
conflicts=('rtorrent')
source=("$_pkgname-$_pkgver.tar.gz::https://github.com/rakshasa/$_pkgname/archive/v$_pkgver.tar.gz"
        'command_pyroscope.cc'
        'ps-close_lowdisk_normal_all.patch'
        'ps-dl-ui-find_all.patch'
        'ps-import.return_all.patch'
        'ps-info-pane-is-default_all.patch'
        'ps-info-pane-xb-sizes_all.patch'
        'ps-issue-515_all.patch'
        'ps-item-stats-human-sizes_all.patch'
        'ps-log_messages_all.patch'
        'ps-object_std-map-serialization_all.patch'
        'ps-silent-catch_all.patch'
        'ps-ui_pyroscope_all.patch'
        'pyroscope.patch'
        'rt-avoid-stack-overflow-for-lockfile-buffer.patch'
        'rt-fix-critical-memory-leak.patch'
        'rt-fix-possible-crash-with-save_input_history.patch'
        'rt-fix-session-file-data-corruption.patch'
        'ui_pyroscope.cc'
        'ui_pyroscope.h'
        'ui_pyroscope.patch')
sha256sums=('bc889ce1dde475ec56aa72ae996912ff58723226a4f4256fef4f1f8636d991d4'
            '444de25e5fb0e42d516799637047f6081f93e789db11018231b725b334ea66b5'
            'bad5ef67100e18866cf80bd7dbd4e36a19468c7825129eb494e156fbc2e82c7f'
            '6984b56fa923edb5226b03f49eb6849d8c046e5221e7a1a86b2d68e9b1186ce5'
            '4c6d7b688ec5ec97f07b9f408e8c11484d37aa23900eab840f666e51985ac4cd'
            '159ee3b802d3eec5107af970343c1b59fc5410cb383bb16e2847241fca11e754'
            '0b1e4ea263b0237236b5709baf88864fde75bdd2b90f9f47c63be798fc6f1404'
            'e31886ea031af518a56a9d228fc9f9de9c132324e02512b287362180ce51b63c'
            '86b6cce6042b461dc005d724aae636d2f0e0746d07fb22dd56b7d0124db04f7d'
            '0749508475a55dc448cab20c76786af068e0bc0535b144ccf2f4a6add92dc1b2'
            'da1af0b5bfc393caf9e6c428e7cd5640bdc28eff1b4bea2a41e4707301c3c1e5'
            '28b2d3e08930e505858c977766455a998530b094ff312930484c1f277b30e8a7'
            '19b32f933ec0f3f8dc841c50557c44b9300e2b0add2403f47fb99636b98d8072'
            '18cf8395bef353db44521177cce8caab8a0b11543f79e41269a55b6d085b208f'
            '3cb7843ead68c778e3c9a46269e712a0605fcaa151f58cd5242228b203ba9941'
            '167746cbd931301fe097fc7d4e73bfa116e2a23df35b7d280c2eb85d0ef8760f'
            '294a7e9bd261e4657e19b6dc71cab71d01a43ba79f4c0dc69762234050c1a5d5'
            '20b1b05d2b9844f81f5d9e96467eb68992f5c914cf4d0235ba294915631f59f2'
            'e2ae0fce316a1d20eb045840e0460895be3dce33174f034c1443fe3f0fb98fe0'
            '55cff4d33bae90d9d9c03f063c2b65fe5a5fd47053961b89de35793bc9c7945a'
            '23d5d8561d5e4a6f2872b57bbf0e1183a6caa46e0124ef907d4f47eec0bc8a3e')

prepare() {
  cd "$srcdir/$_pkgname-$_pkgver"

  # Version handling
  RT_HEX_VERSION=$(printf "0x%02X%02X%02X" ${_pkgver//./ })
  sed -i -e "s:\\(AC_DEFINE(HAVE_CONFIG_H.*\\):\1  AC_DEFINE(RT_HEX_VERSION, "$RT_HEX_VERSION", for CPP if checks):" configure.ac
  grep "AC_DEFINE.*API_VERSION" configure.ac >/dev/null || \
    sed -i -e "s:\\(AC_DEFINE(HAVE_CONFIG_H.*\\):\1  AC_DEFINE(API_VERSION, 0, api version):" configure.ac

  RT_BASE_PATCHES=(
    # https://github.com/rakshasa/rtorrent/pull/1169
    rt-avoid-stack-overflow-for-lockfile-buffer.patch
    # https://github.com/rakshasa/rtorrent/pull/1294
    rt-fix-critical-memory-leak.patch
    # https://github.com/rakshasa/rtorrent/pull/929
    rt-fix-possible-crash-with-save_input_history.patch
    # https://github.com/rakshasa/rtorrent/pull/1293
    rt-fix-session-file-data-corruption.patch
  )
  RT_PATCHES=()

  # Patch rTorrent
  for corepatch in "${RT_BASE_PATCHES[@]/#/$srcdir/}" \
                   "$srcdir"/ps-*_{${_pkgver},all}.patch "${RT_PATCHES[@]/#/$srcdir/}"; do
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

  autoreconf -fiv
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

  install -Dm644 "doc/old/rtorrent.1" "$pkgdir/usr/share/man/man1/$_pkgname.1"
  install -Dm644 "doc/rtorrent.rc" "$pkgdir/usr/share/doc/$_pkgname/rtorrent.rc"
}
