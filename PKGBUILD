# Maintainer: skydrome <skydrome@i2pmail.org>
# Contributor: skydrome <skydrome@i2pmail.org>

# Compile a debug build?
_debug=n

# Compile from a specific commit?
_commit=HEAD
_branch=feature-bind

pkgname=rtorrent-pyro-git
pkgver=20180605
pkgrel=1
pkgdesc="Ncurses BitTorrent client based on libTorrent - rTorrent-git with Pyroscope patches"
url="https://github.com/pyroscope/rtorrent-ps"
license=('GPL2')
arch=('i686' 'x86_64' 'armv7h')
depends=('libtorrent-pyro-git' 'ncurses' 'curl' 'xmlrpc-c')
makedepends=('git')
optdepends=('ttf-dejavu: for utf8 glyphs')
conflicts=('rtorrent' 'rtorrent-git' 'rtorrent-ps')
provides=('rtorrent')
install='pyroscope.install'
backup=('usr/share/doc/rtorrent/rtorrent.rc.sample')

[[ $_debug = 'n' ]] &&
    _debug='--disable-debug'
    BUILDENV+=(!check) ||
{
    _debug='--enable-extra-debug'
    depends+=('cppunit')
    options=(!strip)
}

_url="https://raw.githubusercontent.com/pyroscope/rtorrent-ps/master/patches"
source=("git://github.com/rakshasa/rtorrent.git#branch=$_branch"
        "${_url}/command_pyroscope.cc"
        "${_url}/ui_pyroscope.cc"
        "${_url}/ui_pyroscope.h"
        "${_url}/backport_0.9.6_algorithm_median.patch"
        "${_url}/ps-event-view_all.patch"
        "${_url}/ps-import.return_all.patch"
        "${_url}/ps-info-pane-xb-sizes_all.patch"
        "${_url}/ps-item-stats-human-sizes_all.patch"
        "${_url}/ps-silent-catch_all.patch"
        "${_url}/ps-ui_pyroscope_all.patch"
        "${_url}/ps-view-filter-by_all.patch"
        "${_url}/pyroscope.patch"
        "${_url}/ui_pyroscope.patch"
        "rtorrent.rc.sample")

md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'b49903d3fa25a66c72db69570dfe8b47'
         '56701bca42cc9b309637bf3f918ede12'
         'cc9bbf20acf855e551ca2f80cac91903'
         'f1539d70c74e5c74d8a15d51675aa26c'
         '2d34e8c86c1c6ed1354b55ca21819886'
         'e3f367abe42d28168008f99a9bf0f1d6'
         '7a88f8ab5d41242fdf1428de0e2ca182'
         '26faff00b306b6ef276a7d9e6d964994'
         'bd04a0699b80c8042e1cf63a7e0e4222'
         '0a2bbaf74c7160ba33876dcc2f050f14'
         '35e2c69152a3c2137c5958f9f27cb906')

pkgver() {
    cd "$srcdir/rtorrent"
    git log -1 --format="%cd" --date=short "$_commit" |tr -d -
}

prepare() {
    cd "$srcdir/rtorrent"
    #patch -Np1 -i "${startdir}/rtorrent.patch"

    sed -i ../{command_pyroscope.cc,ui_pyroscope.cc} \
        -e "s:tr1:std:" \
        -e "s:print_download_info:print_download_info_full:"
    sed -i configure.ac \
        -e "s:\\(AC_DEFINE(HAVE_CONFIG_H.*\\):\1\nAC_DEFINE(RT_HEX_VERSION, 0x000907, version checks):"
    sed -i src/ui/download_list.cc \
        -e "s:rTorrent \" VERSION:rTorrent-PS git~$(git rev-parse --short $_commit) \" VERSION:"

    for i in ${srcdir}/*.patch; do
        msg "Patching $(basename $i)"
        patch -uNlp1 -i "$i"
    done
    for i in ${srcdir}/*.{cc,h}; do
        ln -sf "$i" src
    done

    ./autogen.sh
}

build() {
    cd "$srcdir/rtorrent"
    #export CC=clang
    #export CXX=clang++ ;export CXXFLAGS+=" -Wno-unknown-warning-option"
    export CXXFLAGS+=" -fno-strict-aliasing -faligned-new -Wno-terminate -Wno-class-memaccess"
    export libtorrent_LIBS="-L/usr/lib -ltorrent"

    ./configure $_debug \
        --prefix=/usr \
        --with-xmlrpc-c
    make
}

check() {
    cd "$srcdir/rtorrent"
    make check || return 0
}

package() {
    cd "$srcdir/rtorrent"
    make DESTDIR="$pkgdir" install

    install -Dm644 "$srcdir"/rtorrent.rc.sample "${pkgdir}/usr/share/doc/rtorrent/rtorrent.rc.sample"
    install -Dm644 doc/faq.xml        "${pkgdir}/usr/share/doc/rtorrent/faq.xml"
    install -Dm644 doc/old/rtorrent.1 "${pkgdir}/usr/share/man/man1/rtorrent.1"
}
