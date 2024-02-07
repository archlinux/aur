# Maintainer: Evine Deng <evinedeng@hotmail.com>

pkgname="backrest"
pkgver=0.11.0
pkgrel=1
pkgdesc="A web UI and orchestrator for restic backup."
arch=("any")
url="https://github.com/garethgeorge/${pkgname}"
license=("GPL3")
depends=("glibc" "restic")
makedepends=("npm" "git" "go" "go.rice")
source=("${pkgname}::git+${url}.git#tag=v${pkgver}"
        "${pkgname}@.service")
sha256sums=('SKIP'
            '54d7ceddc2d3abb1c00a3f45ff7dd43b5fdc05c6be1019ead7f7cbf4a40ab926')
options=(!strip)

build() {
    local ldflags="-s -w -extldflags '${LDFLAGS}'"

    cd "${pkgname}"
    npm --prefix webui install
    npm --prefix webui run build
    find webui/dist -name '*.map' -exec rm ./{} \;
    gzip webui/dist/*
    go mod tidy
    go generate ./...
    go build -trimpath -ldflags="$ldflags" -o "${pkgname}" .
    strip "${pkgname}"
    rice append --exec "${pkgname}"
}

package() {
    install -Dm644 "${pkgname}@.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}@.service"

    cd "${pkgname}"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
