# Maintainer: Wuxxin <wuxxin@example.com>
# Contributor: @kjlsai <zhangjian@sipeed.com>

pkgname=picoclaw-git
_pkgname=picoclaw
pkgver=0.2.9.nightly.20260528.28ec5793
pkgrel=1
pkgdesc="Ultra-Efficient AI Assistant in Go (Nightly Git build)"
arch=('x86_64' 'aarch64' 'armv7h' 'riscv64' 'loong64')
url="https://github.com/sipeed/picoclaw"
license=('MIT')
options=('!debug')
install=picoclaw-git.install
depends=('glibc' 'ca-certificates' 'libolm' 'hicolor-icon-theme')
makedepends=('go>=1.25' 'nodejs' 'pnpm' 'git')
provides=('picoclaw')
conflicts=('picoclaw')
source=(
    "picoclaw::git+https://github.com/sipeed/picoclaw.git#tag=nightly"
    "picoclaw.service"
)
sha256sums=('SKIP'
    '4a982c31b007b6c787b14d05f60b01aaf242d5dd73fa3e273df895c9115f0ec8')

pkgver() {
    cd "${srcdir}/picoclaw"
    local tagver
    if tagver=$(git show --quiet nightly 2>/dev/null | grep -oP 'Nightly build v\K[0-9a-zA-Z.-]+'); then
        echo "${tagver}" | tr '-' '.'
    else
        git describe --long --tags --exclude=nightly nightly 2>/dev/null | sed 's/^v//;s/-/.nightly./;s/-/./g'
    fi
}

build() {
    cd "${srcdir}/picoclaw"

    export CGO_ENABLED=1
    local build_time
    local go_version
    local ldflags
    local commit_hash

    build_time="$(date -u +%Y-%m-%dT%H:%M:%SZ)"
    go_version="$(go version | awk '{print $3}')"
    commit_hash="$(git rev-parse HEAD)"
    ldflags="-s -w -X github.com/sipeed/picoclaw/pkg/config.Version=v${pkgver} -X github.com/sipeed/picoclaw/pkg/config.GitCommit=${commit_hash} -X github.com/sipeed/picoclaw/pkg/config.BuildTime=${build_time} -X github.com/sipeed/picoclaw/pkg/config.GoVersion=${go_version}"

    go generate ./...

    pushd web/frontend >/dev/null
    pnpm install --frozen-lockfile
    pnpm build:backend
    popd >/dev/null

    go build -buildvcs=false -trimpath -tags stdjson -ldflags "${ldflags}" -o picoclaw ./cmd/picoclaw
    go build -buildvcs=false -trimpath -tags stdjson -ldflags "-s -w" -o picoclaw-launcher ./web/backend
}

package() {
    cd "${srcdir}/picoclaw"

    install -Dm755 picoclaw "${pkgdir}/usr/bin/picoclaw"
    install -Dm755 picoclaw-launcher "${pkgdir}/usr/bin/picoclaw-launcher"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 config/config.example.json "${pkgdir}/usr/share/${pkgname}/examples/config.example.json"
    install -Dm644 web/picoclaw-launcher.desktop "${pkgdir}/usr/share/applications/picoclaw-launcher.desktop"
    install -Dm644 web/picoclaw-launcher.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/picoclaw-launcher.png"

    install -Dm644 "${srcdir}/picoclaw.service" "${pkgdir}/usr/lib/systemd/user/picoclaw.service"
}
