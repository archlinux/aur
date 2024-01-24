# Maintainer: taotieren <admin@taotieren.com>

pkgbase=rkflashtool-git
pkgname=rkflashtool-git
pkgver=r210.5bc3cbf
pkgrel=13
pkgdesc="Tools for flashing Rockchip devices"
arch=(x86_64
    aarch64
    riscv64)
url="https://github.com/linux-rockchip/rkflashtool"
license=('BSD-2-Clause')
groups=()
provides=(${pkgbase%-git})
conflicts=(${pkgbase%-git})
replaces=()
depends=(libusb)
makedepends=(
    git
)
checkdepends=()
optdepends=('rkbin'
    'rkdeveloptool')
source=("${pkgname}::git+${url}.git"
    "51-rockchip.rules")
sha256sums=('SKIP'
            '832ac47a3fe6a397822697099c1780ed223273fc43c23b933e89f05b5d68c63c')
install="${pkgname}.install"
options=()

pkgver() {
    cd "${srcdir}/${pkgname}/"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare()
{
    git -C "${srcdir}/${pkgname}" clean -dfx
}

package() {
    cd "${srcdir}/${pkgname}"
    make DESTDIR=${pkgdir} PREFIX=/usr install
    mkdir -p "${pkgdir}/etc/udev/rules.d/"
    head -n 26 rkflashtool.c > LICENSE
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm 644 ${srcdir}/51-rockchip.rules "${pkgdir}/etc/udev/rules.d/51-rockchip.rules"
}
