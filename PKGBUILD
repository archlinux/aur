# Maintainer: Avi Zimmerman <avi.zimmerman@gmail.com>

pkgname="webmesh-bin"
pkgver="0.0.24"
pkgrel="2"
pkgdesc="A service mesh for the web"
arch=("x86_64" "aarch64" "armv6h" "i686" "s390x" "ppc64le")
url="https://webmeshproj.github.io"
license=("Apache-2.0")

makedepends=("cosign" "curl")
optdepends=("wireguard-tools: for debugging")
conflicts=("webmesh-git")

source=(
    "https://github.com/webmeshproj/webmesh/releases/download/v$pkgver/checksums.txt"
)
sha256sums=('b9dfceef36163967de11143b892cfa188f856999b03c3f9c3b676dc82b39d7e5')

prepare() {
    echo "==> Verifying cosign signatures..."
    COSIGN_EXPERIMENTAL=1 cosign verify-blob \
        --certificate-oidc-issuer=https://token.actions.githubusercontent.com \
        --certificate-identity-regexp="github\.com/webmeshproj/webmesh" \
        --signature="https://github.com/webmeshproj/webmesh/releases/download/v$pkgver/checksums.txt.sig" \
        --certificate="https://github.com/webmeshproj/webmesh/releases/download/v$pkgver/checksums.txt.sig.cert" \
        "$srcdir/checksums.txt"
    curl -JL https://github.com/webmeshproj/webmesh/releases/download/v$pkgver/webmesh_Linux_$CARCH.tar.gz > webmesh_Linux_$CARCH.tar.gz
    sha256sum -c checksums.txt --ignore-missing
    rm -f ../checksums.txt "$srcdir/checksums.txt"
    tar -C "$srcdir" -xzf webmesh_Linux_$CARCH.tar.gz
}

package() {
    cd "$srcdir"
    install -Dm755 webmesh-node "$pkgdir/usr/bin/webmesh-node"
    install -Dm755 wmctl "$pkgdir/usr/bin/wmctl"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
