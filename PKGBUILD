# Maintainer: skydrome <skydrome@i2pmail.org>
# Contributor: skydrome <skydrome@i2pmail.org>

# Compile a debug build?
_debug=n

# Compile from a specific commit?
#_commit=4202ad3  #0.13.3
#_commit=51cd5ea  #0.13.4
_commit=HEAD

# Add the following to your rtorrent.rc if your
# filesystem supports the fallocate() function
# system.file.allocate.set = yes
[[ $(stat -Lfc %T /home) = @(ext4|xfs|btrfs) ]] &&
    _falloc='--with-posix-fallocate'

pkgname=libtorrent-pyro-git
pkgver=20140703
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
    export CXXFLAGS+=" -std=c++11"

    ./configure $_falloc $_debug \
        --prefix=/usr

    make
}

package() {
    make -C "$srcdir/libtorrent" DESTDIR="$pkgdir" install
}
