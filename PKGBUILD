# Maintainer: devome <evinedeng@hotmail.com>

pkgname="webhookd"
pkgver=1.22.0
pkgrel=1
pkgdesc="A very simple webhook server launching scripts."
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://github.com/ncarlier/${pkgname}"
license=("MIT")
makedepends=("go" "unzip")
backup=("etc/default/${pkgname}")
source=("${pkgname}-${pkgver}.zip::${url}/archive/refs/tags/v${pkgver}.zip"
        "${pkgname}.service"
        "${pkgname}.user.service")
sha256sums=('9f7feb2ebd907a3b3e35c5b50ef2c508fd2ed8d4b0692ecea85cb5a393be8e14'
            '245ea528ce9217ae6255c2b6f2f61ad91d22544822a43e2d4f652f5aef4d65e6'
            'b2fb27f5082b9442ff8aea858f6e5fbe3392bb63299e5debd34e4f9c34fc54f2')

build() {
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    local git_commit=$(unzip -qz "${pkgname}-${pkgver}.zip" | cut -c1-7)
    local build_time="$(date -u +'%Y-%m-%dT%H:%M:%SZ')"
    local ldflags=" \
        -s -w \
        -X ${url/https:\/\//}/pkg/version.Version=v${pkgver} \
        -X ${url/https:\/\//}/pkg/version.GitCommit=${git_commit} \
        -X ${url/https:\/\//}/pkg/version.Built=${build_time} \
        -extldflags '${LDFLAGS}'
    "

    cd "${pkgname}-${pkgver}"
    go build \
        -tags osusergo,netgo \
        -trimpath \
        -ldflags="$ldflags" \
        -o "${pkgname}"
}

package() {
    install -Dm644 "${pkgname}.service"         "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm644 "${pkgname}.user.service"    "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"

    cd "${pkgname}-${pkgver}"
    install -Dm755 "${pkgname}"                 "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "LICENSE"                    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "etc/default/${pkgname}.env" "${pkgdir}/etc/default/${pkgname}"
    install -Dm644 {README.md,scripts/*.sh,scripts/examples/*} -t "${pkgdir}/usr/share/doc/${pkgname}"
}
