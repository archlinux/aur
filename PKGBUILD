# Maintainer: Filip Matzner <filip.matzner@iterait.com>

pkgname=libedgetpu-std
pkgver=15.0
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
    'libedgetpu-dev_15-0.deb::https://packages.cloud.google.com/apt/pool/libedgetpu-dev_15.0_amd64_4b445f6d810f535d80da2dcee447f888d023d3562022da97de8aa0888339504c.deb'
    'libedgetpu1-std_15-0.deb::https://packages.cloud.google.com/apt/pool/libedgetpu1-std_15.0_amd64_2e34d83244799891462a28a0630c1d2155831b2213743ec8a87c22bdb09bed4c.deb'
)
source_armv7h=(
    'libedgetpu-dev_15-0.deb::https://packages.cloud.google.com/apt/pool/libedgetpu-dev_15.0_armhf_19d7db40fee019d503e2d31404f4b72827e65b4ad4ea9d1ae727262d11a3dce8.deb'
    'libedgetpu1-std_15-0.deb::https://packages.cloud.google.com/apt/pool/libedgetpu1-std_15.0_armhf_0e4839fd4f71979aa1e339be2301517615566160e914db1d702d9d7a54609b24.deb'
)
source_aarch64=(
    'libedgetpu-dev_15-0.deb::https://packages.cloud.google.com/apt/pool/libedgetpu-dev_15.0_arm64_26c63bbbf027eb0fe6ab5802323241f523a4a7e3fe2b72e4bf8f6f5333f6b7ba.deb'
    'libedgetpu1-std_15-0.deb::https://packages.cloud.google.com/apt/pool/libedgetpu1-std_15.0_arm64_c4d25f80165a1ef1b5660cf4e0a8dd2b656da552d0e6d6ff6e65620d34eaa924.deb'
)
sha256sums_x86_64=(
    '4b445f6d810f535d80da2dcee447f888d023d3562022da97de8aa0888339504c'
    '2e34d83244799891462a28a0630c1d2155831b2213743ec8a87c22bdb09bed4c'
)
sha256sums_armv7h=(
    '19d7db40fee019d503e2d31404f4b72827e65b4ad4ea9d1ae727262d11a3dce8'
    '0e4839fd4f71979aa1e339be2301517615566160e914db1d702d9d7a54609b24'
)
sha256sums_aarch64=(
    '26c63bbbf027eb0fe6ab5802323241f523a4a7e3fe2b72e4bf8f6f5333f6b7ba'
    'c4d25f80165a1ef1b5660cf4e0a8dd2b656da552d0e6d6ff6e65620d34eaa924'
)
noextract=(
    'libedgetpu-dev_15-0.deb'
    'libedgetpu1-std_15-0.deb'
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
