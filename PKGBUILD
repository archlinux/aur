## Maintainer: Thermi <noel[ at ] familie-kuntze.de>
# Submitter: nullie
pkgname=lsyncd
pkgver=2.1.6
pkgrel=1
pkgdesc="Live Syncing (Mirror) Daemon"
arch=('i686' 'x86_64')
url="https://github.com/axkibe/lsyncd"
license=('GPL2')
depends=('lua52' 'rsync')
makedepends=('asciidoc' 'lua52' 'cmake')
source=("https://github.com/axkibe/lsyncd/archive/release-$pkgver.tar.gz"
        "CMakeLists.txt.patch"
        "FindLua.cmake.patch"
	"lsyncd.service")

sha256sums=('02c241ee71b6abb23a796ac994a414e1229f530c249b838ae72d2ef74ae0f775'
            '72ad10f3e06b932713dd92e6ad8f5931ead34135d48e8a2e6dfd2e20bb1a9a87'
            '60bc61193c367adef43e0e376507e4a88e93b1b266146aa4e0768ba83e0a668d'
            '538072a4505abbdf8c4d16c9200810d4a2253f892a71fc16b5cd7f35ebe1ae57')

build() {
    cd $srcdir/$pkgname-release-$pkgver
    patch -p1 < $srcdir/CMakeLists.txt.patch
    patch -p1 < $srcdir/FindLua.cmake.patch
    mkdir -p build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
    make
}

package() {
    cd $srcdir/$pkgname-release-$pkgver/build
    make DESTDIR=$pkgdir install
    # fix the path of the man page. Urgh.
    install -D ${pkgdir}/usr/man/lsyncd.1 ${pkgdir}/usr/share/man/man1/lsyncd.1
    rm -rf ${pkgdir}/usr/man
    install -D ${srcdir}/lsyncd.service ${pkgdir}/usr/lib/systemd/system/lsyncd.service
}
