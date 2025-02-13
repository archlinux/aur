# Maintainer: taotieren <admin@taotieren.com>

pkgname=zteonu-git
pkgver=0.0.7.r1.g1e9b8e5
pkgrel=3
pkgdesc="A tool that can open ZTE onu device factory mode: F677V9/F7607P/F4607P/G7615"
arch=($CARCH)
url="https://github.com/Septrum101/zteOnu"
license=('AGPL-3.0-only')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
#replaces=(${pkgname})
depends=(glibc)
makedepends=(git
    go)
optdepends=()
backup=()
options=()
#install=${pkgname}.install
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}/"
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
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    export GO111MODULE=on
    export GOPROXY=https://goproxy.cn,direct

    mkdir -pv build/
    go build -o build
}

package() {
    cd "${srcdir}/${pkgname}"

    install -Dm755 build/zteOnu ${pkgdir}/usr/bin/${pkgname%-git}
}
