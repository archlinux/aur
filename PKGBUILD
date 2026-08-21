# Maintainer: Your Name <you@example.com>

pkgname=atomgit-cli
pkgver=0.7.2
pkgrel=1
pkgdesc="AtomGit CLI (ag) - 基于 AtomGit API 的命令行工具，参考 GitHub CLI (gh) 开发"
arch=('x86_64' 'aarch64' 'loong64')
url="https://atomgit.com/hust-open-atom-club/atomgit-cli"
license=('custom:MulanPSL-2.0')
depends=('glibc')
makedepends=('go')
provides=('ag')
conflicts=('ag' 'ag-bin' 'atomgit-cli-bin')
source=("git+https://atomgit.com/hust-open-atom-club/atomgit-cli.git#tag=v${pkgver}")
sha256sums=('SKIP')

_commit=fd2d0c29349e2251732711e877a1a58fabbeec54
_builddate="$(date -u +%Y-%m-%dT%H:%M:%SZ)"

build() {
    cd "${srcdir}/atomgit-cli"
    export CGO_ENABLED=0
    go build -trimpath -o ag \
        -ldflags "-s -w \
        -X atomgit.com/hust-open-atom-club/atomgit-cli/internal/version.Version=v${pkgver} \
        -X atomgit.com/hust-open-atom-club/atomgit-cli/internal/version.Commit=${_commit} \
        -X atomgit.com/hust-open-atom-club/atomgit-cli/internal/version.BuildDate=${_builddate}" \
        ./cmd/ag
}

package() {
    cd "${srcdir}/atomgit-cli"
    install -Dm755 "ag" "${pkgdir}/usr/bin/ag"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
