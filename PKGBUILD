# Maintainer: Carsten Burgard <cburgard@cern.ch>
pkgname=cvmfs-git
_gitname=cvmfs
pkgver=0.7289.c158f99
pkgrel=1
pkgdesc="CERN VM Filesystem"
arch=('i686' 'x86_64')
url="http://cernvm.cern.ch/portal/filesystem"
license=('BSD')
depends=('fuse' 'sqlite3' 'curl' 'pacparser' 'zlib' 'sparsehash' 'leveldb' 'gtest' 'geoip' 'python-geoip' 'intel-tbb' 'c-ares')
makedepends=('cmake' 'git')
conflicts=('cvmfs')
provides=('cvmfs')
source=('git://github.com/reneme/cvmfs')
md5sums=('SKIP')
_branch="HEAD"
backup=('etc/cvmfs/default.local')
install=cvmfs.install

pkgver() {
  cd "$srcdir/$_gitname"
  echo "0.$(git rev-list --count $_branch).$(git describe --always)"
}

build() {
	cd "$srcdir/$_gitname"
        mkdir -p build
        cd build
        cmake -DBUILD_SERVER=OFF ../ 
}

package() {
	cd "$srcdir/$_gitname/build"
	make DESTDIR="$pkgdir/" install
        sed -e "s/\/etc\/auto.master/\/etc\/autofs\/auto.master/g" -i $pkgdir/usr/bin/cvmfs_config
        echo "CVMFS_REPOSITORIES=atlas.cern.ch,atlas-condb.cern.ch,grid.cern.ch" > $pkgdir/etc/cvmfs/default.local
        echo "CVMFS_HTTP_PROXY=DIRECT" >> $pkgdir/etc/cvmfs/default.local
}