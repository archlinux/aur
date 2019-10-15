# Maintainer: Filip Matzner <filip.matzner@iterait.com>

pkgname=libedgetpu-std
pkgver=12.1
pkgrel=4
pkgdesc='Google Coral Edge TPU library and headers (standard speed).'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://coral.withgoogle.com/'
license=('Apache')
options=(!strip)
depends=('gcc' 'libusb')
makedepends=('binutils')
provides=('libedgetpu')
conflicts=('libedgetpu' 'libedgetpu-max')
source_x86_64=(
    'libedgetpu-dev_12-1.deb::https://packages.cloud.google.com/apt/pool/libedgetpu-dev_12-1_amd64_9d235ea1e53aee2f8ea05f68410c63234c766b8f821e5d1a91d7ed62f96ffdd2.deb'
    'libedgetpu1-std_12-1.deb::https://packages.cloud.google.com/apt/pool/libedgetpu1-std_12-1_amd64_46a4f29eb4ac6f862c3d68b37c1eceec62e24c7d7c741aed81cca05cbccf9e2e.deb'
)
source_armv7h=(
    'libedgetpu-dev_12-1.deb::https://packages.cloud.google.com/apt/pool/libedgetpu-dev_12-1_armhf_baddaad9895ea1efe3393b04ad5b6b9a9d3febec748b1d583450e3b29feda1b1.deb'
    'libedgetpu1-std_12-1.deb::https://packages.cloud.google.com/apt/pool/libedgetpu1-std_12-1_armhf_99b783b7a9ec7879e010727c92ee92d96f2e6f16d0999099ea05e61fef23d297.deb'
)
source_aarch64=(
    'libedgetpu-dev_12-1.deb::https://packages.cloud.google.com/apt/pool/libedgetpu-dev_12-1_arm64_8abbe6722603e10f138d1ce5776276be1bb11eed0bc9507cee77f09919392522.deb'
    'libedgetpu1-std_12-1.deb::https://packages.cloud.google.com/apt/pool/libedgetpu1-std_12-1_arm64_be5a2b324841afdacb20c0f2bb23b69d3e8e278b740e59a9b6c13046a6ab3ea6.deb'
)
sha256sums_x86_64=(
    '9d235ea1e53aee2f8ea05f68410c63234c766b8f821e5d1a91d7ed62f96ffdd2'
    '46a4f29eb4ac6f862c3d68b37c1eceec62e24c7d7c741aed81cca05cbccf9e2e'
)
sha256sums_armv7h=(
    'baddaad9895ea1efe3393b04ad5b6b9a9d3febec748b1d583450e3b29feda1b1'
    '99b783b7a9ec7879e010727c92ee92d96f2e6f16d0999099ea05e61fef23d297'
)
sha256sums_aarch64=(
    '8abbe6722603e10f138d1ce5776276be1bb11eed0bc9507cee77f09919392522'
    'be5a2b324841afdacb20c0f2bb23b69d3e8e278b740e59a9b6c13046a6ab3ea6'
)
noextract=(
    'libedgetpu-dev_12-1.deb'
    'libedgetpu1-std_12-1.deb'
)

build() {
    mkdir -p ${srcdir}/libedgetpu/
    # Unpack the deb files.
    for deb in ${srcdir}/*.deb; do
        ar x ${deb}
        tar -xJf data.tar.xz -C ${srcdir}/libedgetpu/
    done
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
