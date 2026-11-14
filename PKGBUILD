# Maintainer: devome <evinedeng@hotmail.com>

pkgname=workbuddy2api-panel
pkgver=2026.11.12.1729
pkgrel=1
pkgdesc="把腾讯WorkBuddy账号变成 OpenAI 兼容 API 的多账号网关，同时自动完成任务中心全部任务，附 Web 管理面板（账号池可视化 / 积分任务 / 配置热更新）"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://github.com/misakano7545/${pkgname}"
license=("MIT")
makedepends=("go")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}.service"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles")
sha256sums=('4d07853bdcc4b811a720d44abf74f58f1db2f99a336acc9f2cbf477291c1fdc4'
            '180aeebcbe93072875e4637c29878dda9efab7c2bd0d9f566b0fbb461d1707e5'
            'e576f876660bd5428c5210b2ed6472a86e0c6454ce93d4cdfd13eb79b9580c25'
            '0c1be5bab0af9077c9ad01181c8a0e75d1fc9fb1eccc02bc812e3a308b3b5c49')

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    cd "${pkgname}-${pkgver}"
    go build -ldflags="-s -w -X main.appVersion=${pkgver}" -o "${pkgname}" "./cmd/server"
}

package() {
    install -Dm644 "${pkgname}.service"  "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm644 "${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm644 "${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"

    cd "${pkgname}-${pkgver}"
    install -Dm755 "${pkgname}"          "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "LICENSE"             "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "README.md"           "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "config.example.json" "${pkgdir}/usr/share/doc/${pkgname}/config.example.json"
}
