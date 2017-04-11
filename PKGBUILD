# Maintainer: Frank Siegert <frank.siegert@googlemail.com>
# Maintainer: Wainer Vandelli <wainer dot vandelli at gmail dot com>
# Contributor: Sebastien Binet binet-at-cern-ch
pkgname=cvmfs
pkgver=2.3.5
pkgrel=1
pkgdesc="A client-server file system implemented in FUSE and developed to deliver software distributions onto virtual machines in a fast, scalable, and reliable way."
arch=('x86_64' 'i686')
url="http://cernvm.cern.ch/portal/filesystem"
license=('BSD')
depends=('fuse' 'sqlite3' 'curl')
makedepends=('cmake')
backup=('etc/cvmfs/default.local')
install=cvmfs.install
source=(https://ecsft.cern.ch/dist/cvmfs/cvmfs-$pkgver/$pkgname-$pkgver.tar.gz
        python-geoip.patch)
md5sums=('bd54a1e45ef86d0a3cb6eefa44a89b5b'
         'f77643b657aadead78c2b33d2aa4610b')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
        sed -e "s/\/sbin/\/usr\/bin/g" -i CMakeLists.txt mount/CMakeLists.txt
        patch -Np1 -i "$srcdir/python-geoip.patch"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
        mkdir -p build
        cd build
        cmake ../ -DCMAKE_INSTALL_LIBDIR:PATH=lib
        make
}

package() {
	cd "$srcdir/$pkgname-$pkgver/build"
	make DESTDIR="$pkgdir/" install
        sed -e "s/\/etc\/auto.master/\/etc\/autofs\/auto.master/g" -i $pkgdir/usr/bin/cvmfs_config
        echo "CVMFS_REPOSITORIES=atlas.cern.ch,atlas-condb.cern.ch,grid.cern.ch,sft.cern.ch" > $pkgdir/etc/cvmfs/default.local
        echo "CVMFS_HTTP_PROXY=DIRECT" >> $pkgdir/etc/cvmfs/default.local
}
