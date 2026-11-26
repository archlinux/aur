# Maintainer: taotieren <admin@taotieren.com>

pkgname=openrockcli-git
pkgver=1+r0+g039ed3a
pkgrel=2
epoch=
pkgdesc="A command-line and lightweight TUI firmware flashing tool for Rockchip SoCs"
arch=($CARCH)
url="https://github.com/dshanpi/openrockcli"
license=('MIT')
depends=(
    libusb
)
makedepends=(
    git
)
optdepends=(
    "rkbin: Rockchip update.img flashing through the SDK bundled upgrade_tool"
)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/+/g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    git -C "${srcdir}/${pkgname%-git}" clean -dfx
    cd "${srcdir}/${pkgname%-git}"
    sed -i 's|MODE="0666", GROUP="users"|TAG+="uaccess",|g' 99-openrockcli.rules
}

build() {
    cd "${srcdir}/${pkgname%-git}"
    make
}

package() {
    cd "${srcdir}/${pkgname%-git}"
    install -vDm0755 ${pkgname%-git} -t"${pkgdir}/usr/bin/"
    install -vDm0644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -vDm0644 *.rules -t "${pkgdir}/usr/lib/udev/rules.d/"
    install -vDm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
