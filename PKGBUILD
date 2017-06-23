# Maintainer: Frank Siegert < frank dot siegert at googlemail dot com >
# Contributor: Sebastien Binet binet-at-cern-ch
# Contributor: Wainer Vandelli
# Contributor: Konstantin Gizdov < arch at kge dot pw >
pkgname=cvmfs
pkgver=2.3.5
pkgrel=4
pkgdesc="A client-server file system implemented in FUSE and developed to deliver software distributions onto virtual machines in a fast, scalable, and reliable way."
arch=('x86_64' 'i686')
url="http://cernvm.cern.ch/portal/filesystem"
license=('BSD')
depends=('fuse2' 'sqlite' 'curl' 'python' 'c-ares' 'intel-tbb' 'leveldb' 'openssl-1.0' 'pacparser')
makedepends=('cmake' 'python' 'unzip' 'gtest' 'python-geoip' 'sparsehash')
backup=('etc/cvmfs/default.local')
install=cvmfs.install
options=('!emptydirs')
source=("https://ecsft.cern.ch/dist/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz"
        'libexec.patch'
        'settings.cmake')
md5sums=('bd54a1e45ef86d0a3cb6eefa44a89b5b'
         'bc39c58e3aadf32789e6ff51087c7570'
         '50f8179ff88eb7227b262e8e1c9b10b6')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
        msg2 'Fixing libexec to lib...'
        patch -p1 -i "${srcdir}/libexec.patch"
        msg2 'Fixing /sbin to /usr/bin'
        sed -e "s/\/sbin/\/usr\/bin/g" -i CMakeLists.txt mount/CMakeLists.txt
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
        mkdir -p build
        cd build
        cmake -C "${srcdir}/settings.cmake" ../

        make
}

package() {
	cd "$srcdir/$pkgname-$pkgver/build"
	make DESTDIR="$pkgdir/" install
        sed -e "s/\/etc\/auto.master/\/etc\/autofs\/auto.master/g" -i $pkgdir/usr/bin/cvmfs_config
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/cvmfs/COPYING"

        echo "CVMFS_REPOSITORIES=atlas.cern.ch,atlas-condb.cern.ch,grid.cern.ch,sft.cern.ch,lhcb.cern.ch,lhcbdev.cern.ch" > $pkgdir/etc/cvmfs/default.local
        echo "CVMFS_HTTP_PROXY=DIRECT" >> $pkgdir/etc/cvmfs/default.local
}
