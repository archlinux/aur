# Maintainer: Aaron Bockelie <aaronsb@gmail.com>
pkgname=yay-friend-git
_pkgname=yay-friend
pkgver=0.1.0.r42.g72aa09e
pkgrel=1
pkgdesc="Security-focused wrapper around yay that uses Claude Code to analyze AUR PKGBUILDs for security entropy (git version)"
arch=('x86_64' 'aarch64')
url="https://github.com/aaronsb/yay-friend"
license=('MIT')
# Go binary is built stripped (-s -w); no debug symbols to package.
options=('!debug')
depends=(
    'git'
    'yay'
)
makedepends=(
    'go>=1.23'
)
optdepends=(
    'claude-code: default AI provider for security analysis (any `claude` CLI on PATH also works)'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/aaronsb/yay-friend.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "0.1.0.r%s.g%s" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_pkgname"
    export CGO_ENABLED=0
    export GOPATH="$srcdir/gopath"
    export GOFLAGS="-trimpath -mod=readonly -modcacherw"

    local commit build_date
    commit="$(git rev-parse --short HEAD)"
    build_date="$(date -u -d "@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y-%m-%dT%H:%M:%SZ)"

    go build \
        -ldflags="-s -w \
            -X github.com/aaronsb/yay-friend/internal/version.Version=${pkgver} \
            -X github.com/aaronsb/yay-friend/internal/version.GitCommit=${commit} \
            -X github.com/aaronsb/yay-friend/internal/version.BuildDate=${build_date}" \
        -o "$_pkgname" ./cmd/yay-friend
}

package() {
    cd "$_pkgname"
    install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
