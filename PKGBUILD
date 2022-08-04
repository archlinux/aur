# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=clair-git
pkgver=4.4.4.r52.g9612ee67
pkgrel=1
pkgdesc="Vulnerability Static Analysis for Containers"
arch=(x86_64)
url="https://github.com/quay/clair.git"
license=(Apache)
makedepends=('git' 'go')
source=("${pkgname}::git+${url}#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"

    version="$(git tag -l --sort=-v:refname | sed 's/v\([^-].*\)/\1/g' | head -1)"
    release="$(git describe --long --tags | sed 's/\([^-].*\)-\([0-9]*\)-\(g.*\)/r\2.\3/g')"

    echo "${version}.${release}" | sed -re 's/-//g' # strip hyphen
}

prepare() {
    cd "${srcdir}/${pkgname}"

    install -m755 -d "${srcdir}/go/src/github.com/quay/"
    ln -sf "${srcdir}/${pkgname}" "${srcdir}/go/src/github.com/quay/clair"
}

build() {
    cd "${srcdir}/go/src/github.com/quay/clair"

    mkdir -p build

    export GOPATH="${srcdir}/go"
    go build -trimpath -modcacherw \
        -ldflags "-s -w -X main.Version=${pkgver}" \
        -o ./build/clair ./cmd/clair

    go build -trimpath -modcacherw \
        -ldflags "-s -w -X main.Version=${pkgver}" \
        -o ./build/clairctl ./cmd/clairctl
}

package() {
    cd "${srcdir}/go/src/github.com/quay/clair"

    install -Dm755 "build/clair" "${pkgdir}/usr/bin/clair"
    install -Dm755 "build/clairctl" "${pkgdir}/usr/bin/clair"
    install -Dm755 "config.yaml.sample" "${pkgdir}/etc/clair/config.yaml"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
