# Maintainer: Filip Matzner <filip.matzner@iterait.com>

pkgname=libedgetpu-max
pkgver=16.0
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
    'libedgetpu-dev_16-0.deb::https://packages.cloud.google.com/apt/pool/libedgetpu-dev_16.0_amd64_f647861f3ae6406f101c975b419af4c479889d99c4d41ef83593c9b67503fc58.deb'
    'libedgetpu1-max_16-0.deb::https://packages.cloud.google.com/apt/pool/libedgetpu1-max_16.0_amd64_707ca6c21f4506a5753ad3f7fbdfef442a28056daf8e0b64dec3f58e97f520b9.deb'
)
source_armv7h=(
    'libedgetpu-dev_16-0.deb::https://packages.cloud.google.com/apt/pool/libedgetpu-dev_16.0_armhf_4b74b127ed8d8c48b986373df32069ff76f39bf35865f83001685cc552a2eb9b.deb'
    'libedgetpu1-max_16-0.deb::https://packages.cloud.google.com/apt/pool/libedgetpu1-max_16.0_armhf_9a0aba1c790bc7de0ff9997ba78310d8c5146c94ce5c141eba378b7542fa98fa.deb'
)
source_aarch64=(
    'libedgetpu-dev_16-0.deb::https://packages.cloud.google.com/apt/pool/libedgetpu-dev_16.0_arm64_0b4fb43e4f7b44a0ce1f13b0736b3b7f03b09a24fca7e81bdb40185e98527325.deb'
    'libedgetpu1-max_16-0.deb::https://packages.cloud.google.com/apt/pool/libedgetpu1-max_16.0_arm64_e07bb1a21da8e7ee464cbe2b2923d58dd727b0700ee067b6d5d36c2cd715dcc5.deb'
)
sha256sums_x86_64=(
    'f647861f3ae6406f101c975b419af4c479889d99c4d41ef83593c9b67503fc58'
    '707ca6c21f4506a5753ad3f7fbdfef442a28056daf8e0b64dec3f58e97f520b9'
)
sha256sums_armv7h=(
    '4b74b127ed8d8c48b986373df32069ff76f39bf35865f83001685cc552a2eb9b'
    '9a0aba1c790bc7de0ff9997ba78310d8c5146c94ce5c141eba378b7542fa98fa'
)
sha256sums_aarch64=(
    '0b4fb43e4f7b44a0ce1f13b0736b3b7f03b09a24fca7e81bdb40185e98527325'
    'e07bb1a21da8e7ee464cbe2b2923d58dd727b0700ee067b6d5d36c2cd715dcc5'
)
noextract=(
    'libedgetpu-dev_16-0.deb'
    'libedgetpu1-max_16-0.deb'
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
