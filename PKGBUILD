# Maintainer: taotieren <admin@taotieren.com>

pkgbase=icesugar-git
pkgname=(icesugar{,-{doc,icesprog}}-git)
pkgver=1.1a.r20.g2f2a1db
pkgrel=2
epoch=
pkgdesc="iCESugar FPGA Board (base on iCE40UP5k) "
arch=(x86_64
    aarch64
    riscv64)
url="https://github.com/wuxx/icesugar"
license=('GPL')
groups=()
depends=(
    gcc-libs
    glibc
    hidapi
    libcap
    libusb
    systemd-libs)
makedepends=(
    git
    pkgconf)
checkdepends=()
optdepends=()
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=("${pkgbase}::git+${url}.git")
noextract=()
sha256sums=('SKIP')
#validpgpkeys=()

pkgver() {
    cd "${srcdir}/${pkgbase}"
    git describe --long --tags | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare()
{
    git -C "${srcdir}/${pkgbase}" clean -dfx
    rm -rf "${srcdir}/${pkgbase}/tools/src/icesprog"
}

build() {
    cd "${srcdir}/${pkgbase}/tools/src"
    head -n 18 icesprog.c > LICENSE
    make
}

# check() {
#     cd "${srcdir}/${pkgbase}/tools/src"
#     make test1
#     make test2
#     make test3
# }

package_icesugar-git() {
    pkgdesc+=" - Development Environments"
    provides=(${pkgname%-git})
    conflicts=(${pkgname%-git})
    depends=(
        icesugar-doc
        icesugar-icesprog
        icestorm
        nextpnr
        nextpnr-ice40-nightly
        riscv64-linux-gnu-gcc
        yosys)
}

package_icesugar-doc-git() {
    pkgdesc+=" - doc"
    provides=(${pkgname%-git})
    conflicts=(${pkgname%-git})
    cd ${srcdir}/${pkgbase}
    install -dm0755 "${pkgdir}/usr/share/${pkgname%-git}"
    cp -rva doc schematic  "${pkgdir}/usr/share/${pkgname%-git}/"
}

package_icesugar-icesprog-git() {
    pkgdesc+=" - icesprog"
    provides=(${pkgname%-git})
    conflicts=(${pkgname%-git})
    depends=(
        gcc-libs
        glibc
        hidapi
        libcap
        libusb
        systemd-libs)

    cd "${srcdir}/${pkgbase}/tools/src"
    install -Dm0755 icesprog -t "${pkgdir}/usr/bin"
    install -Dm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname%-git}"
}
