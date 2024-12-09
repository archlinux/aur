# Maintainer: taotieren <admin@taotieren.com>

pkgname=deeplx-git
pkgver=1.0.1.r1.gf2fa902
pkgrel=1
pkgdesc="DeepL Free API (No TOKEN required)"
arch=($CARCH)
url="https://github.com/OwO-Network/DeepLX"
license=('MIT')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
depends=(glibc)
optdepends=()
makedepends=(go git)
backup=()
options=()
install=${pkgname}.install
source=("${pkgname}::git+${url}.git"
    ${pkgname}.install)
sha256sums=('SKIP'
            '3962c9e75073e0dac0088a55d3574cc8cb104031837876422281081a32d332d3')

export CGO_CPPFLAGS="${CPPFLAGS}"
export CGO_CFLAGS="${CFLAGS}"
export CGO_CXXFLAGS="${CXXFLAGS}"
export CGO_LDFLAGS="${LDFLAGS}"
export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

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

    mkdir -pv build/
    go build -o build
}

package() {
    cd "${srcdir}/${pkgname}"

    install -Dm755 build/DeepLX ${pkgdir}/usr/bin/${pkgname%-git}
    install -Dm0644 deeplx.service -t "${pkgdir}/usr/lib/systemd/system/"
}
