# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>

pkgname=throne
pkgver=1.0.0_beta.3
pkgrel=1
pkgdesc="Cross-platform GUI proxy utility (Empowered by sing-box)"
arch=('x86_64')
url="https://github.com/throneproj/Throne"
license=('GPL-3.0-or-later')
depends=('bash' 'gcc-libs' 'glibc' 'libx11' 'qt6-base')
makedepends=('cmake' 'gendesk' 'go' 'protobuf' 'qt6-tools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver//_/-}.tar.gz"
        "${pkgname}.sh")
sha256sums=('5e1a0a51fa98c0fc31f92186133a621f5148feac82aec273682f8beec48870d3'
            'b0797f3a45d1c94f5ef93f3dc5979cee633ca1bbcaf5a3c15b3bcf139af8dc62')

prepare() {
    gendesk -f -n \
        --pkgname "${pkgname}" \
        --pkgdesc "${pkgdesc}" \
        --name "${pkgname^}" \
        --categories 'Network'

    cd "${pkgname^}-${pkgver//_/-}/core/server"
    export GOBIN="${srcdir}/bin"
    export PATH="${PATH}:${GOBIN}"

    go install github.com/golang/protobuf/protoc-gen-go@latest
    go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest

    cd gen
    protoc -I . --go_out=. --go_opt paths=source_relative --go-grpc_out=. --go-grpc_opt paths=source_relative libcore.proto
}

build() {
    cmake -B build -S "${pkgname^}-${pkgver//_/-}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
    cmake --build build

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"

    cd "${pkgname^}-${pkgver//_/-}/core/server"
    VERSION_SINGBOX=$(go list -m -f '{{.Version}}' github.com/sagernet/sing-box)
    go build -o ../../../build \
        -buildmode=pie \
        -trimpath \
        -ldflags "-linkmode=external -w -s -X 'github.com/sagernet/sing-box/constant.Version=${VERSION_SINGBOX}'" \
        -mod=readonly \
        -modcacherw \
        -tags "with_clash_api,with_gvisor,with_quic,with_wireguard,with_utls,with_ech,with_dhcp"
}

package() {
    install -Dm755 build/{Core,Throne} -t "${pkgdir}/usr/lib/${pkgname}"
    install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"

    cd "${pkgname^}-${pkgver//_/-}"
    install -Dm644 res/public/Throne.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
