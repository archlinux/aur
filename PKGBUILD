# Maintainer: Frank Siegert < frank dot siegert at googlemail dot com >
# Contributor: Sebastien Binet binet-at-cern-ch
# Maintainer: Wainer Vandelli <wainer dot vandelli at gmail dot com>
# Contributor: Konstantin Gizdov < arch at kge dot pw >
pkgname=cvmfs
pkgver=2.7.1
pkgrel=1
pkgdesc="A client-server file system implemented in FUSE and developed to deliver software distributions onto virtual machines in a fast, scalable, and reliable way."
arch=('x86_64')
url="http://cernvm.cern.ch/portal/filesystem"
license=('BSD')
depends=('fuse2' 'curl' 'c-ares' 'leveldb' 'pacparser' 'sqlite' 'protobuf')
makedepends=('cmake' 'make' 'gtest' 'sparsehash' 'gmock')
backup=('etc/cvmfs/default.local')
install=cvmfs.install
options=('!emptydirs')
source=("https://ecsft.cern.ch/dist/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz"
        'settings.cmake'
	'externals.patch'
        )
md5sums=('632101444695dfd947b8cfafff2fc34f'
         '20dc60c61077f4a3711463e8686d260d'
         '22b41fe0f5983d35e3622c52f70b25d6')

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
