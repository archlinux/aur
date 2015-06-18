# Maintainer: Frank Siegert <frank.siegert@googlemail.com>
# Contributor: Sebastien Binet binet-at-cern-ch
pkgname=cvmfs
pkgver=2.1.19
pkgrel=1
pkgdesc="A client-server file system implemented in FUSE and developed to deliver software distributions onto virtual machines in a fast, scalable, and reliable way."
arch=('x86_64' 'i686')
url="http://cernvm.cern.ch/portal/filesystem"
license=('BSD')
depends=('fuse' 'sqlite3' 'curl')
makedepends=('cmake')
backup=('etc/cvmfs/default.local')
install=cvmfs.install
source=(https://ecsft.cern.ch/dist/cvmfs/cvmfs-2.1.19/$pkgname-$pkgver.tar.gz)
md5sums=('57b3dd1687af498803a1dcb4f22382d6')

build() {
	cd "$srcdir/$pkgname-$pkgver"
        mkdir -p build
        cd build
        cmake ../
        make
}

package() {
	cd "$srcdir/$pkgname-$pkgver/build"
	make DESTDIR="$pkgdir/" install
        sed -e "s/\/etc\/auto.master/\/etc\/autofs\/auto.master/g" -i $pkgdir/usr/bin/cvmfs_config
        echo "CVMFS_REPOSITORIES=atlas.cern.ch,atlas-condb.cern.ch,grid.cern.ch" > $pkgdir/etc/cvmfs/default.local
        echo "CVMFS_HTTP_PROXY=DIRECT" >> $pkgdir/etc/cvmfs/default.local
}
