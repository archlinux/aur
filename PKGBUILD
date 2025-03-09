# Maintainer: taotieren <admin@taotieren.com>

pkgbase=icesugar-git
pkgname=(
    icesugar-git
    icesugar-dapprog-git
    icesugar-demo-git
    icesugar-doc-git
    icesugar-icesprog-git
    icesugar-nano-git
    icesugar-nano-demo-git
    icesugar-nano-doc-git
    icesugar-pro-git
    icesugar-pro-demo-git
    icesugar-pro-doc-git
)
pkgver=1.1a.r29.ga8c4b15
pkgrel=5
epoch=
pkgdesc="iCESugar FPGA Board (base on iCE40UP5k) "
arch=($CARCH)
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
source=("${pkgbase}::git+${url}.git"
    "${pkgbase/git/pro}::git+${url}-pro.git"
    "${pkgbase/git/nano}::git+${url}-nano.git")
noextract=()
sha256sums=('SKIP'
    'SKIP'
    'SKIP')
#validpgpkeys=()

pkgver() {
    cd "${srcdir}/${pkgbase}"
    git describe --long --tags | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    git -C "${srcdir}/${pkgbase}" clean -dfx
    rm -rf "${srcdir}/${pkgbase}/tools/src/icesprog"
}

build() {
    cd "${srcdir}/${pkgbase}/tools/src"
    head -n 18 icesprog.c >LICENSE
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
    arch=(any)
    depends=(
        #         arachne-pnr
        icesugar-demo
        icesugar-doc
        icesugar-icesprog
        icestorm
        #         icestorm-nightly
        nextpnr
        #         nextpnr-ice40-nightly
        riscv64-linux-gnu-gcc
        sbt
        yosys
        #         yosys-nightly
    )
}

package_icesugar-demo-git() {
    pkgdesc+=" - demo & firmware"
    provides=(${pkgname%-git})
    conflicts=(${pkgname%-git})
    arch=(any)

    cd ${srcdir}/${pkgbase}
    install -dm0755 "${pkgdir}/usr/share/${pkgbase%-git}"
    cp -rva demo firmware "${pkgdir}/usr/share/${pkgbase%-git}/"
}

package_icesugar-doc-git() {
    pkgdesc+=" - doc & schematic"
    provides=(${pkgname%-git})
    conflicts=(${pkgname%-git})
    arch=(any)

    cd ${srcdir}/${pkgbase}
    install -dm0755 "${pkgdir}/usr/share/${pkgbase%-git}"
    cp -rva doc schematic "${pkgdir}/usr/share/${pkgbase%-git}/"
}

package_icesugar-icesprog-git() {
    pkgdesc+=" - icesprog"
    provides=(${pkgname%-git} icesprog)
    conflicts=(${pkgname%-git} icesprog)
    arch=($CARCH)
    depends=(
        gcc-libs
        glibc
        hidapi
        libcap
        libusb
        systemd-libs)
    optdepends=(
        'openocd: Debugging, in-system programming and boundary-scan testing for embedded target devices')

    cd "${srcdir}/${pkgbase}/tools/src"
    install -Dm0755 icesprog -t "${pkgdir}/usr/bin"
    install -Dm0644 README.md -t "${pkgdir}/usr/share/${pkgbase%-git}/icesprog"
    install -Dm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgbase%-git}"
    install -Dm0644 60-icesugar.rules -t "${pkgdir}/usr/lib/udev/rules.d/"
}

package_icesugar-nano-git() {
    pkgdesc+="iCESugar-nano FPGA board (base on iCE40LP1K) -  Development Environments"
    provides=(${pkgname%-git})
    conflicts=(${pkgname%-git})
    arch=(any)
    depends=(
        #         arachne-pnr
        icesugar-icesprog
        icesugar-nano-demo
        icesugar-nano-doc
        icestorm
        #         icestorm-nightly
        nextpnr
        #         nextpnr-ice40-nightly
        riscv64-linux-gnu-gcc
        sbt
        yosys
        #         yosys-nightly
    )
}

package_icesugar-nano-demo-git() {
    pkgdesc="iCESugar-nano FPGA board (base on iCE40LP1K) - demo & firmware"
    provides=(${pkgname%-git})
    conflicts=(${pkgname%-git})
    arch=(any)

    cd ${srcdir}/${pkgbase/git/nano}
    install -dm0755 "${pkgdir}/usr/share/${pkgbase/git/nano}"
    cp -rva demo firmware "${pkgdir}/usr/share/${pkgbase/git/nano}/"
}

package_icesugar-nano-doc-git() {
    pkgdesc="iCESugar-nano FPGA board (base on iCE40LP1K) - doc & schematic"
    provides=(${pkgname%-git})
    conflicts=(${pkgname%-git})
    arch=(any)

    cd ${srcdir}/${pkgbase/git/nano}
    install -dm0755 "${pkgdir}/usr/share/${pkgbase/git/nano}"
    cp -rva doc schematic "${pkgdir}/usr/share/${pkgbase/git/nano}/"
}

package_icesugar-pro-git() {
    pkgdesc+="iCESugar-pro is a FPGA board base on Lattice LFE5U-25F-6BG256C -  Development Environments"
    provides=(${pkgname%-git})
    conflicts=(${pkgname%-git})
    arch=(any)
    depends=(
        #         arachne-pnr
        dtc
        icesugar-dapprog
        icesugar-icesprog
        icesugar-pro-demo
        icesugar-pro-doc
        icestorm
        #         icestorm-nightly
        nextpnr
        #         nextpnr-ice40-nightly
        riscv64-linux-gnu-gcc
        sbt
        yosys
        #         yosys-nightly
    )
}

package_icesugar-pro-demo-git() {
    pkgdesc="iCESugar-pro is a FPGA board base on Lattice LFE5U-25F-6BG256C - demo & firmware"
    provides=(${pkgname%-git})
    conflicts=(${pkgname%-git})
    arch=(any)

    cd ${srcdir}/${pkgbase/git/pro}
    install -dm0755 "${pkgdir}/usr/share/${pkgbase/git/pro}"
    cp -rva demo firmware "${pkgdir}/usr/share/${pkgbase/git/pro}/"
}

package_icesugar-pro-doc-git() {
    pkgdesc="iCESugar-pro is a FPGA board base on Lattice LFE5U-25F-6BG256C - doc & schematic"
    provides=(${pkgname%-git})
    conflicts=(${pkgname%-git})
    arch=(any)

    cd ${srcdir}/${pkgbase/git/pro}
    install -dm0755 "${pkgdir}/usr/share/${pkgbase/git/pro}"
    cp -rva doc schematic "${pkgdir}/usr/share/${pkgbase/git/pro}/"
}

package_icesugar-dapprog-git() {
    pkgdesc+="iCESugar-pro is a FPGA board base on Lattice LFE5U-25F-6BG256C - dapprog"
    provides=(${pkgname%-git} dapprog)
    conflicts=(${pkgname%-git} dapprog)
    depends=(openocd)
    arch=($CARCH)

    cd "${srcdir}/${pkgbase/git/pro}"
    install -dm0755 "${pkgdir}/usr/share/${pkgbase/git/pro}"
    cp -rva tools "${pkgdir}/usr/share/${pkgbase/git/pro}/"
    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/dapprog" <<EOF
#!/bin/bash

cd /usr/share/icesugar-pro/tools

CURRENT_DIR=\$(pwd)
export PATH=\${PATH}:\${CURRENT_DIR}

./dapprog \$@
EOF
}
