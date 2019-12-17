# Maintainer: Andrew J. Hesford <ajh+arch AT sideband DOT org>

pkgname=ifmetric
pkgver=0.3
pkgrel=1
pkgdesc="A tool to adjust the routing metric for a network interface"
arch=("x86_64")
url="http://0pointer.de/lennart/projects/ifmetric/"
license=("GPL2")
# Debian patches for proper functionality
patchurl="https://deb.debian.org/debian/pool/main/i/ifmetric/"
patchver="5"

source=("${url}${pkgname}-${pkgver}.tar.gz"
        "${patchurl}${pkgname}_${pkgver}-${patchver}.debian.tar.xz")
sha256sums=('0fa8510a4e34e555f136f9df81d26618313f2d69a4880c0fb5967f19502f1aec'
            '5aa7b4df05e88edfd3704e3255c588da0b74ab984b2abaca4d1a14c0a65aa4e7')

prepare() {
    cd "${pkgname}-${pkgver}"

    # Apply patches from Debian package
    while read PATCH; do
        patch -Np1 < "${srcdir}/debian/patches/${PATCH}";
    done < "${srcdir}/debian/patches/series"
}

build() {
    cd "${pkgname}-${pkgver}"
    ./configure --prefix=/usr --sbindir=/usr/bin --disable-static
    make
}

check() {
    cd "${pkgname}-${pkgver}"
    make check
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
