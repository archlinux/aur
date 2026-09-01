# Maintainer: hosua <joshortiga777@gmail.com>
pkgname=tfplantui-git
_pkgname=tfplantui
pkgver=r3.fc76395
pkgrel=1
pkgdesc="Interactive terminal UI for exploring Terraform plans as a dependency graph (git version)"
arch=('x86_64' 'aarch64')
url="https://github.com/omarismail/terraform-plan-tui"
license=('MIT')
depends=('glibc')
optdepends=('terraform: open binary .tfplan files directly (runs terraform show -json)'
            'xclip: clipboard paste support on X11'
            'wl-clipboard: clipboard paste support on Wayland')
makedepends=('git' 'go')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')
options=('!debug')

pkgver() {
    cd "$_pkgname"
    # 0.1.0.r5.g1a2b3c4 — sorts correctly with vercmp; falls back if no tags
    local _desc
    if _desc=$(git describe --long --tags --abbrev=7 2>/dev/null); then
        printf '%s' "$_desc" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    else
        printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    fi
}

build() {
    cd "$_pkgname"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build -o "$_pkgname" ./cmd/tfplantui
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
