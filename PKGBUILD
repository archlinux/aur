# Maintainer: hosua <joshortiga777@gmail.com>
pkgname=claws-git
_pkgname=claws
pkgver=0.18.0.r0.g7a0a8ea
pkgrel=1
pkgdesc="k9s-inspired TUI for AWS resource management with vim-style navigation (git version)"
arch=('x86_64' 'aarch64')
url="https://github.com/clawscli/claws"
license=('Apache-2.0')
depends=('glibc')
makedepends=('git' 'go')
optdepends=('xclip: clipboard support on X11'
            'wl-clipboard: clipboard support on Wayland')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')
options=('!debug')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags --abbrev=7 2>/dev/null \
        | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
        || printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "$_pkgname"
    export CGO_ENABLED=0
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build -ldflags "-X main.version=${pkgver}" -o "$_pkgname" ./cmd/claws
}

check() {
    cd "$_pkgname"
    export CGO_ENABLED=0
    go test ./... -short
}

package() {
    cd "$_pkgname"
    install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
