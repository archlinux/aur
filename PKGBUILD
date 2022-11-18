# Maintainer: Cyrinux <pkgbuilds AT levis DOT name>

pkgname=vault-exfiltrate-git
_pkgname=${pkgname%-git}
pkgver=r19.28c722d
pkgrel=2
pkgdesc='Proof-of-concept for recovering the master key from a Hashicorp Vault coredump'
arch=('x86_64')
url="https://github.com/slingamn/${_pkgname}"
license=('MPL2')
depends=('glibc')
makedepends=('go' 'git')
provides=('vault-exfiltrate')
conflicts=('vault-exfiltrate')
optdepends=(
    'vault: in order to interact more with vault',
)
source=("git+https://github.com/slingamn/vault-exfiltrate.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_pkgname"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath"
    go build -o $_pkgname
}

package() {
    cd "$_pkgname"
    install -Dm755 $_pkgname "$pkgdir"/usr/bin/$_pkgname
}
