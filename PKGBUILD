# Maintainer: taotieren <admin@taotieren.com>

pkgbase=ts-litex-driver-git
pkgname=ts-litex-driver-git
pkgver=r24.0414118
pkgrel=2
epoch=
pkgdesc="Linux Driver for the LiteX-based Thunderscope"
arch=(any)
url="https://github.com/EEVengers/ts_litex_driver_linux"
license=("LicenseRef-custom")
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
depends=(
    sh
    dkms
    glibc
)
makedepends=(
    git
)
optdepends=(
    'ts.net-git: Thunderscope-compatible PC-host software written in C# using high-performing primitives & SIMD.'
)
backup=()
options=(!debug !strip)
install=
source=(
    "${pkgname}::git+${url}.git"
)
sha256sums=('SKIP')
noextract=()

pkgver() {
    cd "${srcdir}/${pkgname}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd ${srcdir}/${pkgname}
    make user
}

package() {
    cd ${srcdir}/${pkgname}
    install -vDm0644 *.rules -t ${pkgdir}/usr/lib/udev/rules.d/ 
    sed "s/^PACKAGE_VERSION=.*/PACKAGE_VERSION=\"${pkgver}\"/" dkms.conf.in > dkms.conf
    install -vDm644 dkms.conf -t "${pkgdir}/usr/src/${pkgname}-${pkgver}/"
    install -vDm644 kernel/* -t "${pkgdir}/usr/src/${pkgname}-${pkgver}/"
    install -vDm644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -vDm755 build/user/litepcie_util ${pkgdir}/usr/bin/litepcie-util
    install -vDm755 build/user/litepcie_test ${pkgdir}/usr/bin/litepcie-test
#     install -Dm644 "LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
