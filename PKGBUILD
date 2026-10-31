# Maintainer: hosua <joshortiga777@gmail.com>
pkgname=terraprism-git
_pkgname=terraprism
pkgver=0.13.0.r0.g8acf2ff
pkgrel=1
pkgdesc="Terminal UI for viewing Terraform and OpenTofu plans (git version)"
arch=('x86_64' 'aarch64')
url="https://github.com/CaptShanks/terraprism"
license=('AGPL-3.0-or-later')
depends=('glibc')
optdepends=('terraform: plan, apply and state modes'
            'opentofu: plan, apply and state modes with tofu')
makedepends=('git' 'go')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')
options=('!debug')

pkgver() {
    cd "$_pkgname"
    local _desc
    if _desc=$(git describe --long --tags --abbrev=7 2>/dev/null); then
        # v0.13.0-4-gabcdef0 -> 0.13.0.r4.gabcdef0 (sorts correctly with vercmp)
        sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' <<<"$_desc"
    else
        printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    fi
}

build() {
    cd "$_pkgname"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    # Upstream's version is a const in main.go, so there is no -X main.version to set.
    go build -o "$_pkgname" ./cmd/terraprism
}

check() {
    cd "$_pkgname"
    go test ./... -short
}

package() {
    cd "$_pkgname"
    install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
