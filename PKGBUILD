# Maintainer: taotieren <admin@taotieren.com>

pkgname=probe-go-git
pkgver=r28.779d56b
pkgrel=1
pkgdesc="A full-platform NAT type detection tool written in pure Go language"
arch=($CARCH)
url="https://github.com/xiaoqidun/probe"
license=('Apache-2.0')
provides=(${pkgname%-git} ${pkgname%-go-git})
conflicts=(${pkgname%-git} ${pkgname%-go-git})
#replaces=(${pkgname})
depends=(glibc)
optdepends=()
makedepends=(
    git
    go
)
backup=()
options=('!strip' '!debug')
#install=${pkgname}.install
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
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    export GO111MODULE=on
    export GOPROXY=https://goproxy.cn,direct

    mkdir -pv build/
    go build -o build/${pkgname%-go-git}
}

package() {
    cd "${srcdir}/${pkgname}"

    install -vDm755 build/${pkgname%-go-git} -t ${pkgdir}/usr/bin/
    install -vDm0644 "${srcdir}/${pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname%-git}/"
}
