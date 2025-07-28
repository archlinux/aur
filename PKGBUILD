# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>

pkgname=throne
pkgver=1.0.0_beta.5
pkgrel=1
pkgdesc="Cross-platform GUI proxy utility (Empowered by sing-box)"
arch=('x86_64')
url="https://github.com/throneproj/Throne"
license=('GPL-3.0-or-later')
depends=('bash' 'gcc-libs' 'glibc' 'libx11' 'qt6-base')
makedepends=('cmake' 'gendesk' 'go' 'protobuf' 'qt6-tools' 'vulkan-headers')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver//_/-}.tar.gz"
        "${pkgname}.sh")
sha256sums=('690c302fbc1f21e7c221c2532265ab99c146cce89cb2195df87eb196cddb4e46'
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
        -D CMAKE_BUILD_TYPE=Release \
        -D CMAKE_INSTALL_PREFIX=/usr \
        -W no-dev
    cmake --build build

    cd "${pkgname^}-${pkgver//_/-}/core/server"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

    VERSION_SINGBOX=$(go list -m -f '{{.Version}}' github.com/sagernet/sing-box)
    go build -o "${srcdir}/build" \
        -ldflags="-linkmode=external -w -s -X 'github.com/sagernet/sing-box/constant.Version=${VERSION_SINGBOX}'" \
        -tags="with_clash_api,with_gvisor,with_quic,with_wireguard,with_utls,with_ech,with_dhcp"
}

package() {
    install -Dm755 build/{Core,Throne} -t "${pkgdir}/usr/lib/${pkgname}"
    install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"

    cd "${pkgname^}-${pkgver//_/-}"
    install -Dm644 res/public/Throne.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
