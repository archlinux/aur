# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Maintainer: parhelia

pkgname=throne
pkgver=1.1.2
pkgrel=3
pkgdesc="Qt based cross-platform GUI proxy configuration manager (backend: sing-box)"
arch=('i686' 'pentium4' 'x86_64' 'armv7h' 'aarch64' 'loongarch64' 'riscv64')
url="https://throneproj.github.io"
license=('GPL-3.0-or-later')
conflicts=('nekoray')
replaces=('nekoray')
depends=('glibc' 'qt6-base')
makedepends=('cmake' 'gendesk' 'git' 'go=2:1.25.7-1' 'lld' 'protobuf' 'qt6-tools' 'vulkan-headers')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/throneproj/Throne/archive/fb35c38d4fb8775e8f8e617e4f55c8d91e0b63bf.tar.gz"
        "${pkgname}.sh"
        "git+https://github.com/throneproj/routeprofiles.git#branch=rule-set")
sha256sums=('b03958029be53693302c6edd34ca65a4b27c9e3379ca82e0e6dea57fb2dee98c'
            '3bb765a93afa8c4f3b4fbf4440507c79ba32e4e4600e94706ccd7705209e0c34'
            'SKIP')

prepare() {
    mkdir -p build
    cp routeprofiles/srslist.h build

    gendesk -f -n \
        --pkgname "${pkgname}" \
        --pkgdesc "${pkgdesc}" \
        --name "${pkgname^}" \
        --categories 'Network'

    cd "${pkgname^}-${pkgver}/core/server"
    export GOBIN="${srcdir}/bin"
    export PATH="${PATH}:${GOBIN}"
    go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
    go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest

    cd gen
    protoc -I . --go_out=. --go-grpc_out=. libcore.proto
}

build() {
    export INPUT_VERSION="${pkgver}"
    cmake -B build -S "${pkgname^}-${pkgver}" \
        -D CMAKE_BUILD_TYPE=Release \
        -D CMAKE_INSTALL_PREFIX=/usr \
        -W no-dev
    cmake --build build

    cd "${pkgname^}-${pkgver}/core/server"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS} -fuse-ld=lld"

    VERSION_SINGBOX=$(go list -m -f '{{.Version}}' github.com/sagernet/sing-box)
    go build -o "${srcdir}/build" \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -ldflags="-linkmode=external -w -s -X 'github.com/sagernet/sing-box/constant.Version=${VERSION_SINGBOX}' -X 'internal/godebug.defaultGODEBUG=multipathtcp=0' -checklinkname=0" \
        -tags="with_clash_api,with_gvisor,with_quic,with_wireguard,with_utls,with_dhcp,with_tailscale,badlinkname,tfogo_checklinkname0,with_naive_outbound"
}

package() {
    install -Dm755 build/Throne{,Core} -t "${pkgdir}/usr/lib/${pkgname}"
    install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"

    cd "${pkgname^}-${pkgver}"
    install -Dm644 res/public/Throne.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
