# Maintainer: Frank Siegert < frank dot siegert at googlemail dot com >
# Contributor: Sebastien Binet binet-at-cern-ch
# Maintainer: Wainer Vandelli <wainer dot vandelli at gmail dot com>
# Contributor: Konstantin Gizdov < arch at kge dot pw >
# Contributor: Lin Further
# Contributor: vavolkl
pkgname=cvmfs
pkgver=2.13.3
pkgrel=2
pkgdesc="A client-server file system implemented in FUSE and developed to deliver software distributions onto virtual machines in a fast, scalable, and reliable way."
arch=('x86_64')
url="http://cernvm.cern.ch/portal/filesystem"
license=('BSD')
depends=('fuse3' 'curl' 'c-ares' 'pacparser' 'sqlite' 'leveldb')
makedepends=('cmake' 'make' 'gtest' 'sparsehash' 'help2man')
backup=('etc/cvmfs/default.local')
install=cvmfs.install
options=('!emptydirs')
source=("https://github.com/cvmfs/cvmfs/archive/refs/tags/$pkgname-$pkgver.tar.gz"
        'settings.cmake' # TODO: use libcrypto from system openssl instead of building libressl here?
        'man_race.patch::https://github.com/cvmfs/cvmfs/pull/4075.patch'
       )
md5sums=('1b92cac5d44db031db4e361aeb678112'
         '2c0adcc2f67d0294d47583a77c06a88b'
         'da3550a4ad0dcbe8e4c5bdde740610e1')

prepare() {
    #Temporary pull patch for a race condition occasionally
    #breaking the man page generation
    #https://github.com/cvmfs/cvmfs/pull/4075
    #!!TO BE REMOVED FOR THE NEXT OFFICIAL RELEASE!!
    patch -d $pkgname-$pkgname-$pkgver -Np1 -i ../man_race.patch
}

build() {
    # github tarballs have naming convention projectname-tagname, and tags are called cvmfs-2.XX.Y
    cd "$srcdir/$pkgname-$pkgname-$pkgver"
    mkdir -p build
    cd build
    cmake -C "${srcdir}/settings.cmake" -DCMAKE_BUILD_TYPE=Release ../

    make
}

package() {
    cd "$srcdir/$pkgname-$pkgname-$pkgver/build"
    make DESTDIR="$pkgdir/" install
    sed -e "s/\/etc\/auto.master/\/etc\/autofs\/auto.master/g" -i $pkgdir/usr/bin/cvmfs_config
    sed "s/\/etc\/auto.cvmfs/\/etc\/autofs\/auto.cvmfs/g" -i $pkgdir/usr/bin/cvmfs_config
    install -Dm644 "${srcdir}/${pkgname}-${pkgname}-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/cvmfs/COPYING"
    mkdir -p ${pkgdir}/etc/autofs
    ln -s /usr/lib/${pkgname}/auto.cvmfs ${pkgdir}/etc/autofs/auto.cvmfs

    echo "CVMFS_REPOSITORIES=atlas.cern.ch,atlas-condb.cern.ch,grid.cern.ch,sft.cern.ch,lhcb.cern.ch,lhcbdev.cern.ch" > $pkgdir/etc/cvmfs/default.local
    echo "CVMFS_HTTP_PROXY=DIRECT" >> $pkgdir/etc/cvmfs/default.local
}
