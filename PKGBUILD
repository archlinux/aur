# Maintainer: Filip Matzner <filip.matzner@iterait.com>

pkgname=libedgetpu
pkgver=12.1
pkgrel=2
pkgdesc='Google Coral Edge TPU library and headers.'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://coral.withgoogle.com/'
license=('Apache')
options=(!strip)
depends=('gcc' 'libusb')
makedepends=('dpkg')
source_x86_64=(
    'libedgetpu-dev_12-1_amd64.deb::https://packages.cloud.google.com/apt/pool/libedgetpu-dev_12-1_amd64_9d235ea1e53aee2f8ea05f68410c63234c766b8f821e5d1a91d7ed62f96ffdd2.deb'
    'libedgetpu1-max_12-1_amd64.deb::https://packages.cloud.google.com/apt/pool/libedgetpu1-max_12-1_amd64_1fd32c18d97bf76a0856f8677132b7919b21eabaf930c40a395f15fefaaf759e.deb'
)
source_armv7h=(
    'libedgetpu-dev_12-1_amd64.deb::https://packages.cloud.google.com/apt/pool/libedgetpu-dev_12-1_armhf_baddaad9895ea1efe3393b04ad5b6b9a9d3febec748b1d583450e3b29feda1b1.deb'
    'libedgetpu1-max_12-1_amd64.deb::https://packages.cloud.google.com/apt/pool/libedgetpu1-max_12-1_armhf_bc9b8954aadd2c89d579afc1cfdba3bd3842aa88332ae8ce885699a78f41ca26.deb'
)
source_aarch64=(
    'libedgetpu-dev_12-1_amd64.deb::https://packages.cloud.google.com/apt/pool/libedgetpu-dev_12-1_arm64_8abbe6722603e10f138d1ce5776276be1bb11eed0bc9507cee77f09919392522.deb'
    'libedgetpu1-max_12-1_amd64.deb::https://packages.cloud.google.com/apt/pool/libedgetpu1-max_12-1_arm64_df8c803f976e5a6260f56d8acfbd08aa71470b584bc808b8dadf7b5a0e3f8a02.deb'
)
sha256sums_x86_64=(
    '9d235ea1e53aee2f8ea05f68410c63234c766b8f821e5d1a91d7ed62f96ffdd2'
    '1fd32c18d97bf76a0856f8677132b7919b21eabaf930c40a395f15fefaaf759e'
)
sha256sums_armv7h=(
    'baddaad9895ea1efe3393b04ad5b6b9a9d3febec748b1d583450e3b29feda1b1'
    'bc9b8954aadd2c89d579afc1cfdba3bd3842aa88332ae8ce885699a78f41ca26'
)
sha256sums_aarch64=(
    '8abbe6722603e10f138d1ce5776276be1bb11eed0bc9507cee77f09919392522'
    'df8c803f976e5a6260f56d8acfbd08aa71470b584bc808b8dadf7b5a0e3f8a02'
)
noextract=(
    'libedgetpu-dev_12-1_amd64.deb'
    'libedgetpu1-max_12-1_amd64.deb'
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
