# Maintainer: Filip Matzner <filip.matzner@iterait.com>

pkgname=libedgetpu
pkgver=12.1
pkgrel=1
pkgdesc='Google Coral Edge TPU library and headers.'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://coral.withgoogle.com/'
license=('Apache')
options=(!strip)
depends=()
makedepends=('dpkg' 'gcc')
source_x86_64=(
    'libedgetpu-dev_12-1_amd64.deb::https://packages.cloud.google.com/apt/pool/libedgetpu-dev_12-1_amd64_9d235ea1e53aee2f8ea05f68410c63234c766b8f821e5d1a91d7ed62f96ffdd2.deb'
    'libedgetpu1-max_12-1_amd64.deb::https://packages.cloud.google.com/apt/pool/libedgetpu1-max_12-1_amd64_1fd32c18d97bf76a0856f8677132b7919b21eabaf930c40a395f15fefaaf759e.deb'
)
noextract_x86_64=(
    'libedgetpu-dev_12-1_amd64.deb'
    'libedgetpu1-max_12-1_amd64.deb'
)
sha256sums_x86_64=(
    '9d235ea1e53aee2f8ea05f68410c63234c766b8f821e5d1a91d7ed62f96ffdd2'
    '1fd32c18d97bf76a0856f8677132b7919b21eabaf930c40a395f15fefaaf759e'
)

build() {
    mkdir -p ${srcdir}/libedgetpu/
    dpkg -x ${srcdir}/libedgetpu-dev_12-1_*.deb ${srcdir}/libedgetpu/
    dpkg -x ${srcdir}/libedgetpu1-max_12-1_*.deb ${srcdir}/libedgetpu/
    # Get rid of extra folder for the current linux architecture.
    find ${srcdir}/libedgetpu/usr/lib/ -name "*.so*" -exec mv -v {} ${srcdir}/libedgetpu/usr/lib/ \;
    find ${srcdir}/libedgetpu/usr/lib/ -mindepth 1 -type d -delete;
    # Do not use /lib (it is a symlink), but /usr/lib.
    cp -rv ${srcdir}/libedgetpu/lib/* ${srcdir}/libedgetpu/usr/lib/
    rm -rv ${srcdir}/libedgetpu/lib/
    # Make sure the permissions are correct.
    chmod -R go+rX ${srcdir}/libedgetpu/
}

package() {
    mv ${srcdir}/libedgetpu/* ${pkgdir}/
}
