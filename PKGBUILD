# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Maintainer: parhelia

pkgname=throne
pkgver=1.1.4
pkgrel=1
pkgdesc="Cross-platform GUI proxy utility (Empowered by sing-box)"
arch=('i686' 'pentium4' 'x86_64' 'armv7h' 'aarch64' 'loongarch64' 'riscv64')
url="https://throneproj.github.io"
license=('GPL-3.0-or-later')
conflicts=(throne-bin throne-git throne-sysqt-bin)
depends=('glibc' 'qt6-base')
makedepends=('cmake' 'gendesk' 'git' 'go' 'lld' 'protobuf' 'qt6-tools' 'vulkan-headers')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/throneproj/Throne/archive/${pkgver}.tar.gz"
        "${pkgname}.sh"
        "git+https://github.com/throneproj/routeprofiles.git#branch=rule-set")
sha256sums=('6b4cf2ebc4500f3fbd2ab192b83c20a7c6fdb2b14ab43233b6c251ca4d69412f'
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
    export CGO_CFLAGS="${CFLAGS} -fno-lto"
    export CGO_CXXFLAGS="${CXXFLAGS} -fno-lto"
    export CGO_LDFLAGS="${LDFLAGS} -fuse-ld=lld -fno-lto"

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
