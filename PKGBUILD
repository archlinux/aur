# Maintainer: Filip Borkiewicz <boreq 0x46 net>

pkgname=eggplant-git
pkgver=r185.eda4590
pkgrel=1
pkgdesc='a self-hosted music streaming service'
arch=('x86_64')
url='https://github.com/boreq/eggplant'
license=('AGPL3')
makedepends=(
    'git'
    'make'
    'go'
)
depends=('ffmpeg')
source=("${pkgname}::git+https://github.com/boreq/eggplant.git")
sha512sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${pkgname}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o ./eggplant ./cmd/eggplant
}

package() {
    cd "${pkgname}"
    install -Dm755 eggplant "${pkgdir}"/usr/bin/eggplant
}
