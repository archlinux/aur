# Maintainer: devome <evinedeng@hotmail.com>

pkgname="chinesesubfinder"
_reponame=ChineseSubFinder
pkgver=0.55.3
pkgrel=2
pkgdesc="Automated Chinese subtitle download | 自动化中文字幕下载"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://github.com/${_reponame}/${_reponame}"
license=("MIT")
install="${pkgname}.install"
depends=("ffmpeg")
makedepends=("npm" "git" "go")
source=("${pkgname}::git+${url}.git#tag=v${pkgver}"
        "${pkgname}.service"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles"
        "${pkgname}.user.service")
sha256sums=('SKIP'
            'cc25beda2192dec17dfe75cd4bb4a7feba21e11db4768da8ab288f00e8cc9fa9'
            'cc3df12c95f8e467ef7cbf8a4e2abd7f863320be6f914ac0c1e77e68afaee1f8'
            '4ddd99ba5b6722a66f27762614320cd700b044b8e983962c83e208f5610d960a'
            'baae520a0946a43bb796c3e3e24d2c62d94108f4aa90380d5cfb17daaac9edda')

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"

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
        -trimpath \
        -ldflags="$ldflags" \
        -o "${pkgname}" \
        ."/cmd/${pkgname}"
}

package() {
    install -Dm755 "${pkgname}/${pkgname}"   "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${pkgname}.sysusers"     "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm644 "${pkgname}.tmpfiles"     "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
    install -Dm644 "${pkgname}.service"      "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm644 "${pkgname}.user.service" "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"
    install -Dm644 "${pkgname}/LICENSE"      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
