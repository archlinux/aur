# Maintainer: taotieren <admin@taotieren.com>

pkgbase=miassistanttool-git
pkgname=miassistanttool-git
pkgver=1.2.r0.g0912888
pkgrel=2
pkgdesc="MiAssistantTool"
arch=($CARCH)
url="https://github.com/offici5l/MiAssistantTool"
license=('Apache-2.0')
groups=()
provides=(${pkgbase%-git})
conflicts=(${pkgbase%-git})
replaces=()
depends=(
    curl
    glibc
    libusb
    openssl
    tiny-json)
makedepends=(
    git
)
checkdepends=()
optdepends=(
    'miunlocktool: MiUnlockTool developed to retrieve encryptData(token) for Xiaomi devices for unlocking bootloader, It is compatible with all platforms.'
)
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')
options=()

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
    cd "${srcdir}/${pkgname}"
    gcc -o ${pkgname%-git} *.c /usr/include/tiny-json/tiny-json.c \
        -I/usr/include/openssl -lssl -lcrypto -lcurl \
        -lusb-1.0 -lcurl
}

package() {
    cd "${srcdir}/${pkgname}"
    install -Dm755 ${pkgname%-git} ${pkgdir}/usr/bin/${pkgname%-git}
}
