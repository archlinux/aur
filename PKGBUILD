# Maintainer: mahoshojoHCG <hcgstd@proton.me>
pkgname=certimate
pkgver=0.4.22
pkgrel=1
pkgdesc='Self-hosted ACME tool for visual SSL certificate issuance, deployment, renewal, and monitoring'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/certimate-go/certimate'
license=('MIT')
depends=('glibc')
makedepends=('go>=1.25' 'nodejs>=24' 'npm' 'git')
optdepends=('ca-certificates: TLS root certificates for outbound ACME requests')
provides=("${pkgname}=${pkgver}")
conflicts=("${pkgname}-bin")
backup=()
install="${pkgname}.install"
options=('!lto')

source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.service"
    "${pkgname}.sysusers"
    "${pkgname}.tmpfiles"
)
sha256sums=(
    'ee28716e5460313f24c5f9dce4bf0555b000cfd44562a835eb682139edeae158'
    'SKIP'
    'SKIP'
    'SKIP'
)

prepare() {
    cd "${pkgname}-${pkgver}"
    # Download Go modules with the network still available; offline `go build`
    # in build() will fail otherwise.
    export GOFLAGS="-mod=mod -modcacherw"
    export GOPATH="${srcdir}/gopath"
    go mod download
}

build() {
    cd "${pkgname}-${pkgver}"

    echo '==> Building Web UI (vite)...'
    pushd ui >/dev/null
    npm install --no-fund --no-audit --no-progress
    npm run build
    popd >/dev/null

    echo '==> Building Go binary...'
    export CGO_ENABLED=0
    export GOPATH="${srcdir}/gopath"
    export GOFLAGS="-mod=mod -modcacherw"
    go build -trimpath -buildmode=pie \
        -ldflags="-s -w -linkmode=internal" \
        -o "${pkgname}" .
}

package() {
    cd "${pkgname}-${pkgver}"

    install -Dm0755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    install -Dm0644 "${srcdir}/${pkgname}.service"  "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm0644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm0644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"

    install -Dm0644 LICENSE      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm0644 README.md    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm0644 CHANGELOG.md "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
