# Maintainer: devome <evinedeng@hotmail.com>

pkgname="frp-panel"
pkgver=0.1.28
pkgrel=1
pkgdesc="A multi node frp webui and for frp server and client management"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://github.com/VaalaCat/${pkgname}"
backup=("etc/${pkgname}/"{client,master,server}.env)
license=("GPL-3.0-or-later")
makedepends=("go" "nodejs-lts" "pnpm" "unzip")
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.zip::${url}/archive/refs/tags/v${pkgver}.zip"
        "${pkgname}.tmpfiles"
        "${pkgname}@.service")
sha256sums=('121b8c752dd17175c34ab382bdd72d98d8b2d4484102149033e6099141f00b8f'
            'd909eac5b51218404824363ce35886fcd2a8065773ffecde8f64855a107369a0'
            'd9a6f0f90fa446d2c7f34a7a1a36a21402ccf1db6a0d56cea5b7218117a9e84e')

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    
    cd "${pkgname}-${pkgver}"
    
    # generate env file
    go run ../../extract_env.go
    sed -i "s|#DB_DSN=.*|DB_DSN=\"data\.db\"|" .env.example

    pnpm --prefix www install --no-frozen-lockfile
    pnpm --prefix www build

    go mod download

    local build_date="$(date -u +'%Y-%m-%dT%H:%M:%SZ')"
    local git_commit="$(unzip -zq ../"${pkgname}-${pkgver}.zip" | cut -c1-7)"
    local conf_prefix="${url//https:\/\//}/conf"
    local ldflags=" \
        -s -w \
        -X '${conf_prefix}.buildDate=${build_date}' \
        -X '${conf_prefix}.gitCommit=${git_commit}'
        -X '${conf_prefix}.gitVersion=${pkgver}' \
        -extldflags '${LDFLAGS}'
    "

    go build \
        -trimpath \
        -ldflags="$ldflags" \
        -o "${pkgname}" \
        ./cmd/frpp/*.go
    
    ./"${pkgname}" completion zsh  > completion.zsh
    ./"${pkgname}" completion bash > completion.bash
    ./"${pkgname}" completion fish > completion.fish
}

package() {
    install -Dm644 "${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
    install -Dm644 "${pkgname}@.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}@.service"

    cd "${pkgname}-${pkgver}"
    install -Dm755 "${pkgname}"          "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 .env.example          "${pkgdir}/etc/${pkgname}/master.env"
    install -Dm644 .env.example          "${pkgdir}/etc/${pkgname}/server.env"
    install -Dm644 .env.example          "${pkgdir}/etc/${pkgname}/client.env"
    install -Dm644 completion.zsh        "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
    install -Dm644 completion.bash       "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
    install -Dm644 completion.fish       "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
    install -Dm644 README*.md         -t "${pkgdir}/usr/share/doc/${pkgname}"
}
