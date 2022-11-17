# Maintainer: Cyrinux <pkgbuilds AT levis DOT name>

pkgname=vault-exfiltrate-git
pkgver=0.1
pkgrel=1
pkgdesc='Proof-of-concept for recovering the master key from a Hashicorp Vault coredump'
arch=('x86_64')
url="https://github.com/slingamn/${pkgname}"
license=('MPL2')
depends=('glibc')
provides=('vault-exfiltrate')
conflicts=('vault-exfiltrate')
optdepends=(
    'vault: in order to interact more with vault',
)
source=("git+https://github.com/slingamn/vault-exfiltrate.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname-$pkgver"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname-$pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o $pkgname
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
