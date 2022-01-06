# Maintainer: Filip Matzner <filip.matzner@iterait.com>

pkgname=libedgetpu-std
pkgver=16.0
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
    'libedgetpu-dev_16-0.deb::https://packages.cloud.google.com/apt/pool/libedgetpu-dev_16.0_amd64_f647861f3ae6406f101c975b419af4c479889d99c4d41ef83593c9b67503fc58.deb'
    'libedgetpu1-std_16-0.deb::https://packages.cloud.google.com/apt/pool/libedgetpu1-std_16.0_amd64_1c4767d1dc4d7509a2b10b2c1e9a61e7efec7d13d19eddf1106047e53b376fab.deb'
)
source_armv7h=(
    'libedgetpu-dev_16-0.deb::https://packages.cloud.google.com/apt/pool/libedgetpu-dev_16.0_armhf_4b74b127ed8d8c48b986373df32069ff76f39bf35865f83001685cc552a2eb9b.deb'
    'libedgetpu1-std_16-0.deb::https://packages.cloud.google.com/apt/pool/libedgetpu1-std_16.0_armhf_0f33d2bd9b48ef62483ca73340fc6f0009914c298fd8837f103d69ebe6177f73.deb'
)
source_aarch64=(
    'libedgetpu-dev_16-0.deb::https://packages.cloud.google.com/apt/pool/libedgetpu-dev_16.0_arm64_0b4fb43e4f7b44a0ce1f13b0736b3b7f03b09a24fca7e81bdb40185e98527325.deb'
    'libedgetpu1-std_16-0.deb::https://packages.cloud.google.com/apt/pool/libedgetpu1-std_16.0_arm64_df3da492418f2011048818d44a41e205774726b7f1076e3d7971c35b681b54de.deb'
)
sha256sums_x86_64=(
    'f647861f3ae6406f101c975b419af4c479889d99c4d41ef83593c9b67503fc58'
    '1c4767d1dc4d7509a2b10b2c1e9a61e7efec7d13d19eddf1106047e53b376fab'
)
sha256sums_armv7h=(
    '4b74b127ed8d8c48b986373df32069ff76f39bf35865f83001685cc552a2eb9b'
    '0f33d2bd9b48ef62483ca73340fc6f0009914c298fd8837f103d69ebe6177f73'
)
sha256sums_aarch64=(
    '0b4fb43e4f7b44a0ce1f13b0736b3b7f03b09a24fca7e81bdb40185e98527325'
    'df3da492418f2011048818d44a41e205774726b7f1076e3d7971c35b681b54de'
)
noextract=(
    'libedgetpu-dev_16-0.deb'
    'libedgetpu1-std_16-0.deb'
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
