# Maintainer: devome <evinedeng@hotmail.com>

pkgname=ikuai-cli
pkgver=1.0.16
pkgrel=1
pkgdesc="CLI tool for managing iKuai routers — network, VPN, firewall, users, QoS and more from the terminal."
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://github.com/ikuaidev/${pkgname}"
license=("MIT")
makedepends=("go" "unzip")
source=("${pkgname}-${pkgver}.zip::${url}/archive/refs/tags/v${pkgver}.zip")
sha256sums=('5a7df8795e42134e22d1cf7ee59f65d5679ec94e9850d0dcc495526581986bbc')

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    local _commit=$(unzip -qz "${pkgname}-${pkgver}.zip" | cut -c1-7)
    local _build_date=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
    local ldflags="
        -s -w \
        -X '${url//https:\/\//}/internal/buildinfo.Version=${pkgver}' \
        -X '${url//https:\/\//}/internal/buildinfo.Commit=${_commit}' \
        -X '${url//https:\/\//}/internal/buildinfo.Date=${_build_date}' \
    "

    cd "${pkgname}-${pkgver}"
    go build -ldflags="${ldflags}" -o "${pkgname}" "./cmd/${pkgname}"
    "./${pkgname}" completion bash > "${pkgname}.bash"
    "./${pkgname}" completion fish > "${pkgname}.fish"
    "./${pkgname}" completion zsh  > "${pkgname}.zsh"
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "${pkgname}"      "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
    install -Dm644 "${pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions/${pkgname}.fish"
    install -Dm644 "${pkgname}.zsh"  "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
    install -Dm644 "LICENSE"         "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    find docs scripts/smoke.sh skills *.md -type f -exec install -Dm644 {} "${pkgdir}/usr/share/doc/${pkgname}/{}" \;
}
