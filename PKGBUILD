# Maintainer: moyigeek <moyi@openatom.club>

pkgname=atomgit-cli
pkgver=0.7.4
pkgrel=1
pkgdesc="AtomGit CLI (ag-cli) - 基于 AtomGit API 的命令行工具，参考 GitHub CLI (gh) 开发"
arch=('x86_64' 'aarch64' 'loong64')
url="https://atomgit.com/hust-open-atom-club/atomgit-cli"
license=('custom:MulanPSL-2.0')
depends=('glibc')
makedepends=('go')
provides=('ag-cli')
conflicts=('ag' 'ag-bin' 'ag-cli' 'ag-cli-bin' 'atomgit-cli-bin')
source=("git+https://atomgit.com/hust-open-atom-club/atomgit-cli.git#tag=v${pkgver}")
sha256sums=('SKIP')

_builddate="$(date -u +%Y-%m-%dT%H:%M:%SZ)"

build() {
    cd "${srcdir}/atomgit-cli"
    export CGO_ENABLED=0
    go build -trimpath -o ag-cli \
        -ldflags "-s -w \
        -X atomgit.com/hust-open-atom-club/atomgit-cli/internal/version.Version=v${pkgver} \
        -X atomgit.com/hust-open-atom-club/atomgit-cli/internal/version.Commit=$(git rev-parse HEAD) \
        -X atomgit.com/hust-open-atom-club/atomgit-cli/internal/version.BuildDate=${_builddate}" \
        ./cmd/ag-cli

    go run ./scripts/generate-manpages --output "${srcdir}/man/man1"
}

package() {
    cd "${srcdir}/atomgit-cli"
    install -Dm755 "ag-cli" "${pkgdir}/usr/bin/ag-cli"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/man/man1/"*.1 -t "${pkgdir}/usr/share/man/man1/"
}
