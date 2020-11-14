# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Kuan-Yen Chou <kuanyenchou@gmail.com>

_pkgname=netopeer2
pkgname=netopeer2-git
pkgver=1.1.39.r29.g63be3b5
pkgrel=1
pkgdesc='A set of network configuration tools based on the NETCONF protocol.'
url='https://github.com/CESNET/netopeer2'
arch=('x86_64' 'i686')
license=('BSD')
provides=("${_pkgname}=${pkgver%%.r*}-${pkgrel}")
conflicts=("${_pkgname}")
depends=('libnetconf2' 'sysrepo' 'zlib' 'curl')
makedepends=('git' 'cmake')
source=("$pkgname::git+https://github.com/CESNET/$_pkgname#branch=devel")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
    cd "$pkgname"
    mkdir "build"
    sed -i -e '/SYSREPOCTL=/s,SYSREPOCTL=.*,SYSREPOCTL=`which sysrepoctl`,' scripts/setup.sh
    sed -i -e '/SYSREPOCFG=/s,SYSREPOCFG=.*,SYSREPOCFG=`which sysrepocfg`,' scripts/merge_config.sh
    sed -i -e '/SYSREPOCFG=/s,SYSREPOCFG=.*,SYSREPOCFG=`which sysrepocfg`,' scripts/merge_hostkey.sh
    sed -i -e '/OPENSSL=/s,OPENSSL=.*,OPENSSL=`which openssl`,' scripts/merge_hostkey.sh

}

build() {
    cd "$pkgname/build"
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
    cd "$pkgname/build"
    make DESTDIR="$pkgdir" install
    install -Dm644 "../LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set sw=4 ts=4 et:
