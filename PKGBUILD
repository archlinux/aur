# Maintainer: taotieren <admin@taotieren.com>

pkgname=dockroot-git
pkgver=r6.345af06
pkgrel=1
pkgdesc="Run docker in any root linux system"
arch=($CARCH)
url="https://github.com/kspeeder/dockroot"
license=('LicenseRef-dockroot')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
#replaces=(${pkgname%-git})
depends=(
    glibc
    gpgme
)
makedepends=(
    btrfs-progs
    git
    go
)
optdepends=()
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
    go build -o build/${pkgname%-git} ./cmd/dockroot
}

package() {
    cd "${srcdir}/${pkgname}"

    install -vDm755 build/${pkgname%-git} -t ${pkgdir}/usr/bin/
    install -vDm644 README.md -t ${pkgdir}/usr/share/doc/${pkgname}/
    # install -Dm0644 "${srcdir}/${pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname%-git}/"
}
