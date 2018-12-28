# Maintainer: Nissar Chababy <funilrys at outlook dot com>
# Ex-Maintainer: K0n24d <konrad AT knauber DOT net>
pkgname=urbackup2-client
pkgver=2.3.4
pkgrel=1
pkgdesc="Client Server backup system"
arch=('i686' 'x86_64' 'armv5' 'armv6h' 'armv6' 'armv7h' 'armv7' 'aarch64')
url="http://www.urbackup.org/"
license=("GPL")
makedepends=('gcc-libs' 'gcc' 'make')
depends=('wxgtk' 'crypto++' 'zlib')
conflicts=('urbackup2-client-no-gui' 'urbackup-client-no-gui' 'urbackup-client')
source=("https://www.urbackup.org/downloads/Client/${pkgver}/urbackup-client-${pkgver}.0.tar.gz"
    'btrfs_create_filesystem_snapshot'
    'btrfs_remove_filesystem_snapshot'
    'dattobd_create_filesystem_snapshot'
    'dattobd_remove_filesystem_snapshot'
    'defaults_client'
    'lvm_create_filesystem_snapshot'
'lvm_remove_filesystem_snapshot')

sha512sums=('76f300f1df87f5ccd48a6c4d4174c05cceda36d05c0428dc645cfa3acc835944b0f97b29a801dbaaa39a15e7ff88e8e9f7672da1889b98b6a0ee69c6a5c59c8e'
    '416fb8f5f3687a3c369cc2b199d4c8b4170494f0a119566a91ac6a0c2f202dc5049804c10508b66ba657011b39be5ddd055091cd531a665b4398899f404086ca'
    '860021ce5b8d92ff58e8286991162c7bab45493c3b9c87577a43764f6b416397448bb99b8fcb850c4c5853927cb0a8637792b75ff53ee7ee257da3f5d29ae3a7'
    'fde5912b589a495dc03a26d174d7673ff746eed34d6b1ed64758b2dc2ec2ec53e02e6a28b04734a7112f16687b31d25123e99dbc69e9dcab48773675382ec582'
    'a8b58bba1b8b0a6b70395f9fe4277eeee60a0ba534f4eddb999d719915c76b76facb54172e03b7b29b9f725a4d720e9b676b05e5081f7528570956e903fe59bd'
    '238c286d451474a8721292f7e98b4f13600cb430c16a27ceb9551cc83705b8268a3f1202785fb5b61523f372b4e7e804fd20b7db62677621983d79a271aa106b'
    'a2d4ba03ae15582d2cd74ff68c38ff0f90d75a6eb5c241f9a022b0652fa2dc9b184439f6bda9a9538645925f739503ee7b3fc7bb232589583cdeb6dc27d74e5c'
'9bdfefccdd9d6e37a77975324a7c417f3de2aa59e6da0bfde3c318b8c6f3d7f4629f3a41eebee548b9c572b8ed39640434cc08bd020d25362fddffc4426438de')

CFLAGS="-march=native -O2 -pipe -fstack-protector-strong"
CXXFLAGS="${CFLAGS} -ansi -std=gnu++11"
CPPFLAGS="${CPPFLAGS} -DNDEBUG"
MAKEFLAGS="-j$(nproc)"

build() {
    sed  -i '/\#include \"cryptopp_inc.h\"/a #include "assert.h"' "${srcdir}/urbackup-client-${pkgver}.0/cryptoplugin/AESGCMDecryption.h"
    
    patch -d"${srcdir}/urbackup-client-${pkgver}.0" -p0 < ../md5-bytes.patch
    
    cd "${srcdir}/urbackup-client-${pkgver}.0"
    ./configure --prefix=/usr --sbindir=/usr/bin --localstatedir=/var --sysconfdir=/etc
    make
}

package() {
    cd "${srcdir}/urbackup-client-${pkgver}.0"
    make DESTDIR="${pkgdir}" install
    sed -i 's/\/usr\/local\/sbin/\/usr\/bin/gi' urbackupclientbackend-debian.service
    install -Dm644 urbackupclientbackend-debian.service \
    "${pkgdir}"/usr/lib/systemd/system/urbackupclientbackend.service
    install -Dm644 docs/urbackupclientbackend.1 \
    "${pkgdir}"/usr/share/man/man1/urbackupclientbackend.1
    
    cd "${srcdir}"
    install -Dm644 defaults_client "${pkgdir}/etc/default/urbackupclient"
    install -Dm700 btrfs_create_filesystem_snapshot "${pkgdir}/usr/share/urbackup"
    install -Dm700 btrfs_remove_filesystem_snapshot "${pkgdir}/usr/share/urbackup"
    install -Dm700 lvm_create_filesystem_snapshot "${pkgdir}/usr/share/urbackup"
    install -Dm700 lvm_remove_filesystem_snapshot "${pkgdir}/usr/share/urbackup"
    install -Dm700 dattobd_create_filesystem_snapshot "${pkgdir}/usr/share/urbackup"
    install -Dm700 dattobd_remove_filesystem_snapshot "${pkgdir}/usr/share/urbackup"
}
# vim: ts=2
