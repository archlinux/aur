# Maintainer: skydrome <skydrome@i2pmail.org>
# Contributor: skydrome <skydrome@i2pmail.org>

# Compile a debug build?
_debug=n

# Compile from a specific commit?
_commit=HEAD
_branch=master

pkgname=libtorrent-pyro-git
pkgver=20191021
pkgrel=1
pkgdesc='BitTorrent library written in C++ (git version)'
url='https://rakshasa.github.io/rtorrent'
license=('GPL2')
arch=('i686' 'x86_64' 'armv7h')
depends=('openssl')
makedepends=('git' 'clang')
conflicts=('libtorrent' 'libtorrent-git' 'libtorrent-ps')
provides=('libtorrent')
install=libtorrent-pyro.install

[[ $_debug = 'n' ]] &&
    _debug='--disable-debug'
    BUILDENV+=(!check) ||
{
    _debug='--enable-extra-debug'
    depends+=('cppunit')
    options=(!strip)
}

_url='https://raw.githubusercontent.com/chros73/rtorrent-ps-ch/master/patches'
source=("git://github.com/rakshasa/libtorrent.git#branch=$_branch"
        "$_url/backport_lt_all_01-partially_done_and_choke_group_fix.patch")
md5sums=('SKIP'
         '2a8eb09877e81e3e72bd544c27b45dbb')

pkgver() {
    cd libtorrent
    git log -1 --format="%cd" --date=short "$_commit" |tr -d -
}

prepare() {
    cd libtorrent
    #patch -Np1 -i "$startdir/libtorrent.patch"

    for i in $srcdir/*.patch; do
        msg "Patching $(basename $i)"
        patch -uNp1 -i "$i"
    done

    ./autogen.sh
}

build() {
    cd libtorrent
    export CC=clang
    export CXX=clang++
    export CXXFLAGS+=" -Wno-exceptions"

    ./configure $_debug \
        --prefix=/usr \
        --with-posix-fallocate
    make
}

check() {
    make -C libtorrent check
}

package() {
    make -C libtorrent DESTDIR="$pkgdir" install
}
