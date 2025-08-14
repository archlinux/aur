# Maintainer: taotieren <admin@taotieren.com>

pkgname=myip-git
pkgver=0.5.2.r0.gf3fb342
pkgrel=1
pkgdesc="Returns your public IP and the public IP to access the extranet."
arch=($CARCH)
url="https://github.com/crystal-china/myip"
license=('MIT')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
depends=(
    glibc
    gc
    gcc-libs
    libevent
    openssl
    pcre2
    zlib
)
makedepends=(
    cmake
    git
    crystal
    shards
)
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
    (
        set -o pipefail
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
