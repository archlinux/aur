# Maintainer: Ondřej Svoboda <ondrej@svobodasoft.cz>
pkgname=finlib
provides=(finlib)
conflicts=(finlib)
pkgver=2.36.5
pkgrel=1
arch=(x86_64)
url="https://nlp.fi.muni.cz/trac/noske"
pkgdesc="Fast indexing library for the Manatee corpus management tool (a part of NoSketch Engine)"
license=(GPL)
depends=(pcre)
source=("http://corpora.fi.muni.cz/noske/src/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('5a7914633676eb348b9ca6bf09dc0c78a5b8b4a97d280263f14f8c8140934452')

build()
{
    cd "$srcdir/$pkgname-$pkgver"
    ./configure --prefix=/usr --with-pcre
    # TODO: are these two changes to libtool (removal of rpaths) necessary?
    # They were introduced to the RPM's specfile in release 2.11-1.
    # https://fedoraproject.org/wiki/Packaging:Guidelines?rd=Packaging/Guidelines#Removing_Rpath
    sed -i 's|^hardcode_libdir_flag_spec=.*|hardcode_libdir_flag_spec=""|g' libtool
    sed -i 's|^runpath_var=LD_RUN_PATH|runpath_var=DIE_RPATH_DIE|g' libtool
    make
}

package()
{
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}

# ldconfig is said to be run by pacman after installation:
# https://bugs.archlinux.org/task/35744
# https://bbs.archlinux.org/viewtopic.php?id=7808
