# Maintainer: Filip Matzner <filip.matzner@iterait.com>

pkgname=libedgetpu-max
pkgver=13.0
pkgrel=1
pkgdesc='Google Coral Edge TPU library and headers (max speed).'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://coral.withgoogle.com/'
license=('Apache')
options=(!strip)
depends=('gcc' 'libusb')
makedepends=('binutils')
provides=('libedgetpu')
conflicts=('libedgetpu' 'libedgetpu-std')
# The links to the files are taken from:
# https://packages.cloud.google.com/apt/dists/coral-edgetpu-stable/main
source_x86_64=(
    'libedgetpu-dev_13-0.deb::https://packages.cloud.google.com/apt/pool/libedgetpu-dev_13.0_amd64_9bcb5b54ee56c4909c0d7d8dc444df6674c81d164be94c759832c0b78f7db458.deb'
    'libedgetpu1-max_13-0.deb::https://packages.cloud.google.com/apt/pool/libedgetpu1-max_13.0_amd64_a66fabc4fb8fd49b8835a27550821e2e873489f50a0284edbee298b81fd98ee5.deb'
)
source_armv7h=(
    'libedgetpu-dev_13-0.deb::https://packages.cloud.google.com/apt/pool/libedgetpu-dev_13.0_armhf_2f0b37cab8dffa19a4cda548660cfa4c23ac9f6c314178c1a2ad2cce529e26ef.deb'
    'libedgetpu1-max_13-0.deb::https://packages.cloud.google.com/apt/pool/libedgetpu1-max_13.0_armhf_fd1bb9d1232a08bd28c2611fc37bd73b71731745a15acc2db13cec542b724f88.deb'
)
source_aarch64=(
    'libedgetpu-dev_13-0.deb::https://packages.cloud.google.com/apt/pool/libedgetpu-dev_13.0_arm64_1c5d3c1799d1409e46496627141f52fdc3a944eb7b643e830de4d1512bbbb43e.deb'
    'libedgetpu1-max_13-0.deb::https://packages.cloud.google.com/apt/pool/libedgetpu1-max_13.0_arm64_af879dd656f1f40f479c596b0707378e156c2b8a3eb5df57360733c3ea028837.deb'
)
sha256sums_x86_64=(
    '9bcb5b54ee56c4909c0d7d8dc444df6674c81d164be94c759832c0b78f7db458'
    'a66fabc4fb8fd49b8835a27550821e2e873489f50a0284edbee298b81fd98ee5'
)
sha256sums_armv7h=(
    '2f0b37cab8dffa19a4cda548660cfa4c23ac9f6c314178c1a2ad2cce529e26ef'
    'fd1bb9d1232a08bd28c2611fc37bd73b71731745a15acc2db13cec542b724f88'
)
sha256sums_aarch64=(
    '1c5d3c1799d1409e46496627141f52fdc3a944eb7b643e830de4d1512bbbb43e'
    'af879dd656f1f40f479c596b0707378e156c2b8a3eb5df57360733c3ea028837'
)
noextract=(
    'libedgetpu-dev_13-0.deb'
    'libedgetpu1-max_13-0.deb'
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
