# Maintainer: taotieren <admin@taotieren.com>

pkgname=translater-git
pkgver=0.6.2.r1.gb3ea816
pkgrel=1
pkgdesc="command line translate tools, Use headless firefox internally, support Linux/Mac for now."
arch=(x86_64
    aarch64
    riscv64)
url="https://github.com/crystal-china/translater"
license=('MIT')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
depends=(
    firefox
    geckodriver
    glibc
    gc
    gcc-libs
    libevent
    sqlite
    openssl
    pcre2
    zlib)
makedepends=(git
    crystal
    shards)
optdepends=("goldendict: Feature-rich dictionary lookup program supporting multiple dictionary formats")
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
    export LDFLAGS+=" -Wl,-z,relro,-z,now -Wl,-z,shstk"
    make release
}

package() {
    cd "${srcdir}/${pkgname}"
    DESTDIR=${pkgdir}/usr make install
}
