# Maintainer: moyigeek <moyi@openatom.club>

pkgname=atomgit-cli-git
_pkgname=atomgit-cli
pkgver=0.7.4.r5.gc6d9b9f
pkgrel=1
pkgdesc="AtomGit CLI (ag-cli) - 基于 AtomGit API 的命令行工具，参考 GitHub CLI (gh) 开发 (git version)"
arch=('x86_64' 'aarch64' 'loong64')
url="https://atomgit.com/hust-open-atom-club/atomgit-cli"
license=('custom:MulanPSL-2.0')
depends=('glibc')
makedepends=('go' 'git')
provides=('ag-cli')
conflicts=('ag' 'ag-bin' 'ag-cli' 'ag-cli-bin' 'atomgit-cli' 'atomgit-cli-bin')
source=("${_pkgname}::git+https://atomgit.com/hust-open-atom-club/atomgit-cli.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgname}"
    export CGO_ENABLED=0
    local _commit _builddate
    _commit="$(git rev-parse --short=12 HEAD)"
    _builddate="$(date -u +%Y-%m-%dT%H:%M:%SZ)"
    go build -trimpath -o ag-cli \
        -ldflags "-s -w \
        -X atomgit.com/hust-open-atom-club/atomgit-cli/internal/version.Version=v${pkgver} \
        -X atomgit.com/hust-open-atom-club/atomgit-cli/internal/version.Commit=${_commit} \
        -X atomgit.com/hust-open-atom-club/atomgit-cli/internal/version.BuildDate=${_builddate}" \
        ./cmd/ag-cli

    go run ./scripts/generate-manpages --output "${srcdir}/man/man1"
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -Dm755 "ag-cli" "${pkgdir}/usr/bin/ag-cli"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/man/man1/"*.1 -t "${pkgdir}/usr/share/man/man1/"
}