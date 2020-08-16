# Maintainer: Filip Matzner <filip.matzner@iterait.com>

pkgname=libedgetpu-max
pkgver=14.1
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
    'libedgetpu-dev_14-1.deb::https://packages.cloud.google.com/apt/pool/libedgetpu-dev_14.1_amd64_2eb1100e364a203ce6b55f294676534c4c79aa4c9337f8e50e1ddaa07edd2ada.deb'
    'libedgetpu1-max_14-1.deb::https://packages.cloud.google.com/apt/pool/libedgetpu1-max_14.1_amd64_6f06f9f9e06aa960ef07e772339cd6d85672db7ea291b5cde37e0d7483414a1c.deb'
)
source_armv7h=(
    'libedgetpu-dev_14-1.deb::https://packages.cloud.google.com/apt/pool/libedgetpu-dev_14.1_armhf_dfd9af34ba1554319d084f5b43acce8e2f9fe7dc3e5c2e4811b340baa49d34ea.deb'
    'libedgetpu1-max_14-1.deb::https://packages.cloud.google.com/apt/pool/libedgetpu1-max_14.1_armhf_28cf2218217463ffec97cea55ae062e68dd41b1dd415ee5463852eeb22d3cbdf.deb'
)
source_aarch64=(
    'libedgetpu-dev_14-1.deb::https://packages.cloud.google.com/apt/pool/libedgetpu-dev_14.1_arm64_498e64beaac88b3de363dbf26fd20d98aa02db58d3e377945c7ed4127b8f139d.deb'
    'libedgetpu1-max_14-1.deb::https://packages.cloud.google.com/apt/pool/libedgetpu1-max_14.1_arm64_795e7f49c81b1f9586f43b1978dd938b192df3e5e4939e1e8deb965d64ca41e6.deb'
)
sha256sums_x86_64=(
    '2eb1100e364a203ce6b55f294676534c4c79aa4c9337f8e50e1ddaa07edd2ada'
    '6f06f9f9e06aa960ef07e772339cd6d85672db7ea291b5cde37e0d7483414a1c'
)
sha256sums_armv7h=(
    'dfd9af34ba1554319d084f5b43acce8e2f9fe7dc3e5c2e4811b340baa49d34ea'
    '28cf2218217463ffec97cea55ae062e68dd41b1dd415ee5463852eeb22d3cbdf'
)
sha256sums_aarch64=(
    '498e64beaac88b3de363dbf26fd20d98aa02db58d3e377945c7ed4127b8f139d'
    '795e7f49c81b1f9586f43b1978dd938b192df3e5e4939e1e8deb965d64ca41e6'
)
noextract=(
    'libedgetpu-dev_14-1.deb'
    'libedgetpu1-max_14-1.deb'
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
