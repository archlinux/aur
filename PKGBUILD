# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Kuan-Yen Chou <kuanyenchou@gmail.com>

pkgname=netopeer2
pkgver=1.1.39
pkgrel=1
pkgdesc='A set of network configuration tools based on the NETCONF protocol.'
url='https://github.com/CESNET/netopeer2'
arch=('x86_64' 'i686')
license=('BSD')
depends=('libnetconf2' 'sysrepo' 'zlib' 'curl')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/CESNET/netopeer2/archive/v$pkgver.tar.gz")
sha256sums=('e983683eda68792fedd73af54a5c7997496091489aa921f2a9e0dd27f2f6e19a')

prepare() {
    cd "$pkgname-$pkgver"
    mkdir "build"
    sed -i -e '/SYSREPOCTL=/s,SYSREPOCTL=.*,SYSREPOCTL=`which sysrepoctl`,' scripts/setup.sh
    sed -i -e '/SYSREPOCFG=/s,SYSREPOCFG=.*,SYSREPOCFG=`which sysrepocfg`,' scripts/merge_config.sh
    sed -i -e '/SYSREPOCFG=/s,SYSREPOCFG=.*,SYSREPOCFG=`which sysrepocfg`,' scripts/merge_hostkey.sh
    sed -i -e '/OPENSSL=/s,OPENSSL=.*,OPENSSL=`which openssl`,' scripts/merge_hostkey.sh

}

build() {
    cd "$pkgname-$pkgver/build"
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_SYSCONFDIR=/etc \
        -DCMAKE_BUILD_TYPE=Release \
        -DINSTALL_MODULES=OFF \
        -DGENERATE_HOSTKEY=OFF \
        -DMERGE_LISTEN_CONFIG=OFF \
        ..
    make
}

package() {
    cd "$pkgname-$pkgver/build"
    make DESTDIR="$pkgdir" install
    install -Dm644 "../LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set sw=4 ts=4 et:
