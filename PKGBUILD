# Maintainer: taotieren <admin@taotieren.com>

pkgname=translater-git
pkgver=0.7.0.r8.g25d3a61
pkgrel=2
pkgdesc="command line translate tools, Use headless firefox internally, support Linux/Mac for now."
arch=($CARCH)
url="https://github.com/crystal-china/translater"
license=('MIT')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
depends=(
    glibc
    gc
    gcc-libs
    sqlite
    openssl
    pcre2
    zlib
)
makedepends=(
    git
    crystal
    shards
    pkgconf
)
optdepends=(
    "goldendict: Feature-rich dictionary lookup program supporting multiple dictionary formats"
    "firefox: Fast, Private & Safe Web Browser"
    "geckodriver: Proxy for using W3C WebDriver-compatible clients to interact with Gecko-based browsers. "
)
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
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

build() {
    cd "${srcdir}/${pkgname}"
    export LDFLAGS+=" -Wl,-z,relro,-z,now -Wl,-z,shstk"
    mkdir -p bin
    make release
}

package() {
    cd "${srcdir}/${pkgname}"
    DESTDIR=${pkgdir}/usr make install
    install -Dm644 ${srcdir}/${pkgbase}/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
