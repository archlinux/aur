# Maintainer: skydrome <skydrome@i2pmail.org>
# Contributor: skydrome <skydrome@i2pmail.org>

# Compile a debug build?
_debug=n

# Compile from a specific commit?
_commit=HEAD
_branch=feature-bind

pkgname=libtorrent-pyro-git
pkgver=20180130
pkgrel=1
pkgdesc='BitTorrent library written in C++ (git version)'
url='https://rakshasa.github.io/rtorrent'
license=('GPL2')
arch=('i686' 'x86_64' 'armv7h')
depends=('openssl')
makedepends=('git')
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

source=("git://github.com/rakshasa/libtorrent.git#branch=$_branch")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/libtorrent"
    git log -1 --format="%cd" --date=short "$_commit" |tr -d -
}

prepare() {
    cd "$srcdir/libtorrent"
    #patch -Np1 -i "${startdir}/libtorrent.patch"

    ./autogen.sh
}

build() {
    cd "$srcdir/libtorrent"
    #export CC=clang
    #export CXX=clang++ ;export CXXFLAGS+=" -Wno-unknown-warning-option"
    export CXXFLAGS+=" -fno-strict-aliasing -faligned-new -Wno-terminate -Wno-class-memaccess"

    ./configure $_debug \
        --prefix=/usr \
        --with-posix-fallocate
    make
}

check() {
    cd "$srcdir/libtorrent"
    make check
}

package() {
    make -C "$srcdir/libtorrent" DESTDIR="$pkgdir" install
}
