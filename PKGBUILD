# Maintainer: taotieren <admin@taotieren.com>

pkgbase=ufprog-git
pkgname=ufprog-git
pkgver=1.0.2023.09.18.r77.gb3f0d64
pkgrel=2
groups=()
pkgdesc="Universal Flash Programmer - SPI-NOR/NAND ECC/SPI-NAND/WCH CH341 CH347/FTDI MPSSE FT232H FT2232H FT4232H FT4222H/SPI (Single/Dual/Quad/QPI using SPI-MEM)"
arch=(x86_64
  aarch64
  riscv64)
url="https://github.com/hackpascal/ufprog"
license=('GPL-2.0-only AND LGPL-2.0-only')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
depends=(glibc
    libusb
    hidapi
    json-c)
makedepends=(git
    cmake
    ninja)
optdepends=()
source=(
    "${pkgname}::git+${url}.git"
)
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    ( set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare()
{
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgname}"

    cmake -DCMAKE_BUILD_TYPE=None \
    -DBUILD_PORTABLE=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -B build \
    -G Ninja

    ninja -C build
}

package() {
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgname}/build install
}
