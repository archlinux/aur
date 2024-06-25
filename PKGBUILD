# Maintainer: taotieren <admin@taotieren.com>

pkgname=fx2eeprom-git
pkgver=r7.9b36acd
pkgrel=1
pkgdesc="FX2 EZ USB eeprom reader/writer for libusb"
arch=(x86_64
    aarch64
    riscv64)
url="https://github.com/ribalda/fx2eeprom"
license=('GPL-2.0-or-later')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
depends=(
    glibc
    libusb)
makedepends=(git)
optdepends=('fxload: fxload firmware loader. Used with udev or devfs/hotplug.')
backup=()
options=()
install=
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

pkgver() {
    cd "${srcdir}/${pkgname}"
    ( set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

build() {
    cd "${srcdir}/${pkgname}"
    make
}

package() {
    cd "${srcdir}/${pkgname}"
    install -Dm0755 fx2eeprom -t "$pkgdir/usr/bin/"
}
