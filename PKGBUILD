# Maintainer: Filip Borkiewicz <boreq 0x46 net>

pkgname=eggplant-git
pkgver=r200.39e3734
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
    install -Dm755 "../config.toml" "${pkgdir}/etc/eggplant/config.toml"
    mkdir -pm755 "${pkgdir}/var/lib/eggplant/music/"
    install -Dm644 "../service" "${pkgdir}/usr/lib/systemd/system/eggplant.service"

    cd "${pkgname}"
    install -Dm755 "./eggplant" "${pkgdir}/usr/bin/eggplant"
}
