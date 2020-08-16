# Maintainer: Filip Matzner <filip.matzner@iterait.com>

pkgname=libedgetpu-std
pkgver=14.1
pkgrel=1
pkgdesc='Google Coral Edge TPU library and headers (standard speed).'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://coral.withgoogle.com/'
license=('Apache')
options=(!strip)
depends=('gcc' 'libusb')
makedepends=('binutils')
provides=('libedgetpu')
conflicts=('libedgetpu' 'libedgetpu-max')
# The links to the files are taken from:
# https://packages.cloud.google.com/apt/dists/coral-edgetpu-stable/main
source_x86_64=(
    'libedgetpu-dev_14-1.deb::https://packages.cloud.google.com/apt/pool/libedgetpu-dev_14.1_amd64_2eb1100e364a203ce6b55f294676534c4c79aa4c9337f8e50e1ddaa07edd2ada.deb'
    'libedgetpu1-std_14-1.deb::https://packages.cloud.google.com/apt/pool/libedgetpu1-std_14.1_amd64_c6cb84801d41bb06490d9ee18a0175c2a0b855a5d2865ae76e215a0ca2b9d1a4.deb'
)
source_armv7h=(
    'libedgetpu-dev_14-1.deb::https://packages.cloud.google.com/apt/pool/libedgetpu-dev_14.1_armhf_dfd9af34ba1554319d084f5b43acce8e2f9fe7dc3e5c2e4811b340baa49d34ea.deb'
    'libedgetpu1-std_14-1.deb::https://packages.cloud.google.com/apt/pool/libedgetpu1-std_14.1_armhf_5b62e9b3539306553411c434853b76b36732254a61ed19b77e59763e579145ce.deb'
)
source_aarch64=(
    'libedgetpu-dev_14-1.deb::https://packages.cloud.google.com/apt/pool/libedgetpu-dev_14.1_arm64_498e64beaac88b3de363dbf26fd20d98aa02db58d3e377945c7ed4127b8f139d.deb'
    'libedgetpu1-std_14-1.deb::https://packages.cloud.google.com/apt/pool/libedgetpu1-std_14.1_arm64_4669a44bd6d6f3b7d33c356182ceaeb29e1c981843629adeb77ac1283dbd498e.deb'
)
sha256sums_x86_64=(
    '2eb1100e364a203ce6b55f294676534c4c79aa4c9337f8e50e1ddaa07edd2ada'
    'c6cb84801d41bb06490d9ee18a0175c2a0b855a5d2865ae76e215a0ca2b9d1a4'
)
sha256sums_armv7h=(
    'dfd9af34ba1554319d084f5b43acce8e2f9fe7dc3e5c2e4811b340baa49d34ea'
    '5b62e9b3539306553411c434853b76b36732254a61ed19b77e59763e579145ce'
)
sha256sums_aarch64=(
    '498e64beaac88b3de363dbf26fd20d98aa02db58d3e377945c7ed4127b8f139d'
    '4669a44bd6d6f3b7d33c356182ceaeb29e1c981843629adeb77ac1283dbd498e'
)
noextract=(
    'libedgetpu-dev_14-1.deb'
    'libedgetpu1-std_14-1.deb'
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
