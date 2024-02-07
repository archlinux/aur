# Maintainer: Evine Deng <evinedeng@hotmail.com>

pkgname="chinesesubfinder"
_reponame=ChineseSubFinder
pkgver=0.55.3
pkgrel=2
pkgdesc="Automated Chinese subtitle download | 自动化中文字幕下载"
arch=("any")
url="https://github.com/${_reponame}/${_reponame}"
license=("MIT")
install="${pkgname}.install"
depends=("ffmpeg" "gcc-libs" "glibc" "systemd")
makedepends=("npm" "git" "go")
source=("${pkgname}::git+${url}.git#tag=v${pkgver}"
        "${pkgname}.service"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles"
        "${pkgname}.user.service")
sha256sums=('SKIP'
            'cc25beda2192dec17dfe75cd4bb4a7feba21e11db4768da8ab288f00e8cc9fa9'
            'd8c780bdf927d5535a9ddd34e391866a8d81981a68890a7a043efaeadb7437ee'
            '4ddd99ba5b6722a66f27762614320cd700b044b8e983962c83e208f5610d960a'
            '62d4d41b51f4a65c7d20a8f7216b5c999f4a765019c07fc20d307068a95fe3f0')

build() {
    cd "${pkgname}"
    npm --prefix frontend install
    npm --prefix frontend run build
    go mod tidy

    local ldflags=" \
        -s -w \
        -X main.AppVersion=v${pkgver} \
        -X main.LiteMode=true \
        -extldflags '${LDFLAGS}'
    "
    go build \
        -ldflags="$ldflags" \
        -o chinesesubfinder \
        ./cmd/chinesesubfinder
}

package() {
    install -Dm755 "${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm644 "${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
    install -Dm644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm644 "${pkgname}.user.service" "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"
    install -Dm644 "${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
