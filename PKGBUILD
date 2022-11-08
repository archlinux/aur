# Maintainer: Frank Siegert < frank dot siegert at googlemail dot com >
# Contributor: Sebastien Binet binet-at-cern-ch
# Maintainer: Wainer Vandelli <wainer dot vandelli at gmail dot com>
# Contributor: Konstantin Gizdov < arch at kge dot pw >
# Contributor: Lin Further 
pkgname=cvmfs
pkgver=2.10.0
pkgrel=1
pkgdesc="A client-server file system implemented in FUSE and developed to deliver software distributions onto virtual machines in a fast, scalable, and reliable way."
arch=('x86_64')
url="http://cernvm.cern.ch/portal/filesystem"
license=('BSD')
depends=('fuse2' 'curl' 'c-ares' 'pacparser' 'sqlite' 'protobuf' 'leveldb')
makedepends=('cmake' 'make' 'gtest' 'sparsehash')
backup=('etc/cvmfs/default.local')
install=cvmfs.install
options=('!emptydirs')
source=("https://ecsft.cern.ch/dist/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz"
        'settings.cmake'
        'externals.patch' # TODO: use libcrypto from system openssl instead of building libressl here?
       )
md5sums=('bdcb429933c35a28ea0f157e2966a507'
         '20dc60c61077f4a3711463e8686d260d'
         'b6f47be4cf99ca4ee6a4c183fc6ba92a')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"

    # Tweak external packages
    # We remove all those that are provided by Arch/AUR and leave only
    # the ones not currently available
    patch -Np1 -i "$srcdir/externals.patch"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    mkdir -p build
    cd build
    cmake -C "${srcdir}/settings.cmake" -DCMAKE_BUILD_TYPE=Release ../

    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver/build"
    make DESTDIR="$pkgdir/" install
    sed -e "s/\/etc\/auto.master/\/etc\/autofs\/auto.master/g" -i $pkgdir/usr/bin/cvmfs_config
    sed "s/\/etc\/auto.cvmfs/\/etc\/autofs\/auto.cvmfs/g" -i $pkgdir/usr/bin/cvmfs_config
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/cvmfs/COPYING"
    mkdir -p ${pkgdir}/etc/autofs
    ln -s /usr/lib/${pkgname}/auto.cvmfs ${pkgdir}/etc/autofs/auto.cvmfs

    echo "CVMFS_REPOSITORIES=atlas.cern.ch,atlas-condb.cern.ch,grid.cern.ch,sft.cern.ch,lhcb.cern.ch,lhcbdev.cern.ch" > $pkgdir/etc/cvmfs/default.local
    echo "CVMFS_HTTP_PROXY=DIRECT" >> $pkgdir/etc/cvmfs/default.local
}
