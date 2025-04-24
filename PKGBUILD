# Maintainer: Pierre Ayoub (Drack) <pierreay@proton.me>

# TODO: Add an option to disable "MESSENGER*" and "ENCRYPTION" to free 10% of space.

_pkgname=uv-k5-firmware-custom
pkgname="kamilsss655-${_pkgname}-git"
pkgver=20.5.r40.g9aa505e
pkgrel=1
pkgdesc="Kamilsss655 (aka Nunu) firmware for UV-K5 handheld radio."
arch=("any")
url="https://github.com/kamilsss655/${_pkgname}"
license=('GPL')
depends=("make"
    "arm-none-eabi-gcc"
    "arm-none-eabi-binutils"
    "arm-none-eabi-newlib"
    "python-crcmod")
source=("${pkgname}::git+https://github.com/kamilsss655/${_pkgname}"
        "0001-Fix-CHIRP-compatibility.patch"
        "0002-Enable-DTMF-1750Hz-TX.patch"
        "0003-Enable-BYPASS-and-RAW-demods.patch")
noextract=()
sha256sums=("SKIP"
            "ef8c23df75c303dc4e83d9e0a5f5d289c80737bd8daccc37bc208c8e30cbb271"
            "7f97b6631700a0b589a7ea364a7a788d607f216fb989dd9470b1f572565419e6"
            "8ae5961c1696ef21ca8cb882ee27276e05ddd3937b9bd01bf2b39ad1aa11f89f")
validpgpkeys=()

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${pkgname}"
    patch -p1 -i "${srcdir}/0001-Fix-CHIRP-compatibility.patch"
    patch -p1 -i "${srcdir}/0002-Enable-DTMF-1750Hz-TX.patch"
    patch -p1 -i "${srcdir}/0003-Enable-BYPASS-and-RAW-demods.patch"
}

build() {
    cd "${srcdir}/${pkgname}"
    make
}

package() {
    cd "${srcdir}/${pkgname}"
    cp firmware.packed.bin "${pkgdir}/"
    echo "*** Open firmware flasher web interface at:"
    echo "https://kamilsss655.github.io/uvtools/"
    echo "*** Follow the flashing instructions at:"
    echo "https://github.com/kamilsss655/uv-k5-firmware-custom/wiki/60-%E2%80%90-Flashing-the-firmware"
    echo "*** And flash the following file:"
    echo "${pkgdir}/firmware.packed.bin"
}
