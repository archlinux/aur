# Maintainer: Kostiantyn Kushnir <chpock@gmail.com>
pkgname=gen-commit-msg-git
pkgver=0.0.1.r144.g8dc07fd
pkgrel=1
pkgdesc="Generate git commit message candidates from staged changes (git version)"
arch=('x86_64' 'aarch64')
url="https://github.com/chpock/gen-commit-msg"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
optdepends=('git: collect staged change context' 'opencode: generate commit messages')
provides=("gen-commit-msg=$pkgver")
conflicts=('gen-commit-msg')
source=("git+https://github.com/chpock/gen-commit-msg.git")
sha256sums=('SKIP')

pkgver() {
    cd "gen-commit-msg"

    local tag commits hash
    tag=$(git describe --tags --abbrev=0 2>/dev/null || true)
    commits=$(git rev-list --count HEAD)
    hash=$(git rev-parse --short HEAD)

    if [ -n "$tag" ]; then
        printf "%s.r%s.g%s\n" "${tag#v}" "$commits" "$hash"
    else
        printf "0.0.0.r%s.g%s\n" "$commits" "$hash"
    fi
}

build() {
    cd "gen-commit-msg"
    local tag commits hash build_version
    tag=$(git describe --tags --abbrev=0 2>/dev/null || true)
    commits=$(git rev-list --count HEAD)
    hash=$(git rev-parse --short HEAD)

    if [ -n "$tag" ]; then
        build_version="${tag#v}+${commits}.g${hash}"
    else
        build_version="0.0.0+${commits}.g${hash}"
    fi

    go build -ldflags "-X main.version=${build_version}" -o gen-commit-msg ./cmd/gen-commit-msg
}

package() {
    cd "gen-commit-msg"

    install -Dm755 "gen-commit-msg" "$pkgdir/usr/bin/gen-commit-msg"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
