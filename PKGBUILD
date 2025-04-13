# Maintainer: Maxr1998 <aur@maxr1998.de>
_pkgname=s3share-cli
pkgname=$_pkgname-git
pkgver=27.9d1740c
pkgrel=1
pkgdesc="CLI for s3share, an end-to-end-encrypted file-sharing platform built on an S3-compatible object storage."
arch=('x86_64' 'aarch64')
url="https://github.com/Maxr1998/$_pkgname"
license=('AGPL-3.0-or-later')
depends=()
makedepends=('git' 'go>=1.22')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_pkgname"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    go build -o "$_pkgname" .

    mkdir -p completions
    for shell in bash zsh fish; do
        go run . completion "$shell" > "completions/$shell"
    done
}

package() {
    cd "$_pkgname"
    install -Dm755 "$_pkgname" -T "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$_pkgname/"

    install -Dm644 "completions/bash" -T "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
    install -Dm644 "completions/zsh"  -T "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
    install -Dm644 "completions/fish" -T "$pkgdir/usr/share/fish/vendor_completions.d/$_pkgname.fish"
}
