# Maintainer: taotieren <admin@taotieren.com>

pkgname=deeplx-git
pkgver=1.2.2.r8.g770f63b
pkgrel=1
pkgdesc="DLX - Self-hosted translation API server. Unofficial; not affiliated with DeepL SE"
arch=($CARCH)
url="https://github.com/OwO-Network/DLX"
license=('MIT')
provides=(dlx)
conflicts=(dlx)
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
            'e8544a1bf2c25684212a7f55cca88748636bacedadf7e2ac7bb0d55285f96f1f')

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
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    export GO111MODULE=on
    export GOPROXY=https://goproxy.cn,direct

    mkdir -pv build/
    go build -o build/dlx
}

package() {
    cd "${srcdir}/${pkgname}"

    install -Dm755 build/dlx -t "${pkgdir}/usr/bin/"
    install -Dm644 *.service -t "${pkgdir}/usr/lib/systemd/system/"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
