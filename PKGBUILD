# Maintainer: unknowndev <unknowndevQwQ@proton.me>

_pkgname=v2ray-exporter
#pkgname=prometheus-${_pkgname}
pkgname=${_pkgname}
pkgrel=1
pkgver=0.6.0
_commit=62d9e881b7139e72149b013ec3266111a23beb96 #refs/tags/v0.6.0{}
pkgdesc="An exporter that collect V2Ray metrics over its Stats API and export them to Prometheus"
arch=('x86_64')
url="https://github.com/wi1dcard/v2ray-exporter"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
optdepends=('v2ray: provide v2ray status')
source=("git+${url}#commit=${_commit}?signed")
sha512sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    git describe --tags | sed 's/^v//;s/-/+/g'
}

# From see the commit history
validpgpkeys=(
    5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23  # Github.com
)

build() {
    cd "${_pkgname}"

    export GOFLAGS="-buildmode=pie -trimpath"
    export GO111MODULE=on
    export CGO_ENABLED=0 # build full static binary
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"

    export GOPATH="${srcdir}"
    # $ver-$commit-aur
    # version suffix need modify buildCommit
    go build \
        -ldflags "-X main.buildCommit="$(git rev-parse --short HEAD)-aur" \
                  -X main.buildDate=$(date -u +"%Y-%m-%dT%TZ") \
                  -X main.buildVersion=$(git describe --tags --abbrev=0 HEAD)" \
        -o v2ray-exporter ./...
}

package() {
    cd "${_pkgname}"
#    sed -i '7 s/#Type=exec/Type=exec/'              "v2ray-exporter.service"
#    sed -i '8 s/Type=simple/#Type=simple/'          "v2ray-exporter.service"
#    install -Dm644 "v2ray-exporter.service" -t      "$pkgdir/usr/lib/systemd/system"
#    install -Dm644 "v2ray-exporter@.service" -t     "$pkgdir/usr/lib/systemd/system"
    install -Dm755 "LICENSE" -t                     "${pkgdir}/usr/share/licenses/v2ray-exporter"
    install -Dm755 "v2ray-exporter" -t              "${pkgdir}/usr/bin"
#    ln -sr                                          "${pkgdir}/usr/bin/"{,prometheus-}v2ray-exporter
}
