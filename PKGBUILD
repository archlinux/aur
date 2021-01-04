# Maintainer: Hsiu-Ming Chang <cges30901@gmail.com>
# Contributor: axionl <axionl@aosc.io>
pkgname=baidupcs-go-git
pkgver=3.7.1.r3.ga0a694b
pkgrel=1
pkgdesc="The terminal utility for Baidu Network Disk (Golang Version)."
arch=('x86_64')
depends=('glibc')
makedepends=('git' 'go-pie')
conflicts=("baidupcs")
provides=("baidupcs")
url="https://github.com/qjfoidnh/BaiduPCS-Go"
license=("Apache")

source=("${pkgname}::git+https://github.com/qjfoidnh/BaiduPCS-Go.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"

    ( set -o pipefail
      git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "${pkgname}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    go build -buildmode=pie -trimpath -ldflags "-linkmode external -X main.Version=${pkgver} -s -w"
}

package() {
    cd "${pkgname}"
    install -Dm755 BaiduPCS-Go "${pkgdir}/usr/bin/baidupcs"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
