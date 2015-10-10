# Maintainer: skydrome <skydrome@i2pmail.org>
# Contributor: skydrome <skydrome@i2pmail.org>

# Compile a debug build?
_debug=n

# Compile from a specific commit?
#_commit=51cd5ea  #0.13.4
#_commit=a7857b2  #0.13.5
_commit=HEAD

pkgname=libtorrent-pyro-git
pkgver=20150908
pkgrel=1
pkgdesc='BitTorrent library written in C++ (git version)'
url='http://libtorrent.rakshasa.no'
license=('GPL')
arch=('i686' 'x86_64')
depends=('openssl')
makedepends=('git' 'cppunit')
conflicts=('libtorrent' 'libtorrent-git')
provides=('libtorrent')
install=libtorrent-pyro.install

[[ $_debug = 'n' ]] &&
    _debug='--disable-debug' || options=(!strip)

source=("git://github.com/rakshasa/libtorrent.git#commit=$_commit")
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
    #export CXX=clang++

    ./configure $_debug \
        --prefix=/usr \
        --with-posix-fallocate

    make
}

package() {
    make -C "$srcdir/libtorrent" DESTDIR="$pkgdir" install
}
