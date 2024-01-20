# Maintainer: Evine Deng <evinedeng@hotmail.com>

pkgname="frp-panel"
pkgver=0.0.10
pkgrel=1
pkgdesc="A multi node frp webui and for frp server and client management"
arch=("any")
url="https://github.com/VaalaCat/${pkgname}"
backup=(
    "etc/${pkgname}/client.env"
    "etc/${pkgname}/master.env"
    "etc/${pkgname}/server.env"
)
license=("unkown")
depends=("glibc" "systemd")
makedepends=("npm" "go")
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}.tmpfiles"
        "${pkgname}@.service"
        "client.env"
        "master.env"
        "server.env")
sha256sums=('2aa83c1d3236cb891d10aa551e223568b116924a8102e3c17946bd2b6daeaaa6'
            'd909eac5b51218404824363ce35886fcd2a8065773ffecde8f64855a107369a0'
            'a82a0d6fb9498a283137a90862a4bf65486368cfe88c25f7b901d4d914da7ca4'
            'f2fc53b07bf23f1f4a75c6df2c4823129ed25540f9bee6984241bfa682613667'
            '2badfc944453e83520f4f65a74dd013127c50fcf9b47d32dd924fc0924604551'
            '51d40f4cf57cddea09fd888790dc16682057fc5583235e55134673bcc60915f8')

build() {
    cd "${pkgname}-${pkgver}"

    npm --prefix www install
    npm --prefix www run build

    go mod download

    local ldflags="-s -w -extldflags '${LDFLAGS}'"

    go build \
        -trimpath \
        -ldflags="$ldflags" \
        -o "${pkgname}" \
        ./cmd/*.go
    
    ./frp-panel completion zsh > _zsh
    ./frp-panel completion bash > _bash
    ./frp-panel completion fish > _fish
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 _zsh "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
    install -Dm644 _bash "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
    install -Dm644 _fish "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"

    install -Dm644 "../${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
    install -Dm644 "../${pkgname}@.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}@.service"
    install -Dm644 -t "${pkgdir}/etc/${pkgname}" ../*.env
}
