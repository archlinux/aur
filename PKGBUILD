# Maintainer: Avi Zimmerman <avi.zimmerman@gmail.com>

pkgname="webmesh-bin"
pkgver="0.7.0"
pkgrel="1"
pkgdesc="A service mesh for the web"
arch=("x86_64" "aarch64" "armv6h" "i686" "s390x" "ppc64le")
url="https://webmeshproj.github.io"
license=("Apache-2.0")

makedepends=("cosign" "curl")
optdepends=("wireguard-tools: for debugging")
conflicts=("webmesh-git")

source=("https://github.com/webmeshproj/webmesh/releases/download/v$pkgver/checksums.txt")
sha256sums=('f0240b96904ef57b1ffe019194c99faf59b8630fe5146fa76e69b29cbb3590d0')

prepare() {
    echo "==> Verifying cosign signature..."
    COSIGN_EXPERIMENTAL=1 cosign verify-blob \
        --certificate-oidc-issuer=https://token.actions.githubusercontent.com \
        --certificate-identity-regexp="github\.com/webmeshproj/webmesh" \
        --signature="https://github.com/webmeshproj/webmesh/releases/download/v$pkgver/checksums.txt.sig" \
        --certificate="https://github.com/webmeshproj/webmesh/releases/download/v$pkgver/checksums.txt.sig.cert" \
        checksums.txt
    echo "==> Downloading release package..."
    curl --silent -JL https://github.com/webmeshproj/webmesh/releases/download/v$pkgver/webmesh_Linux_$CARCH.tar.gz > webmesh_Linux_$CARCH.tar.gz
    echo "==> Verifying checksums..."
    sha256sum -c checksums.txt --ignore-missing
    # Delete the checksum files so they don't get packaged
    # and upgrades always fetch the correct version
    rm -f ../checksums.txt checksums.txt
    echo "==> Extracting release archive..."
    tar -C "$srcdir" -xzf webmesh_Linux_$CARCH.tar.gz
}

package() {
    cd "$srcdir"
    install -Dm755 webmesh-node "$pkgdir/usr/bin/webmesh-node"
    install -Dm755 wmctl "$pkgdir/usr/bin/wmctl"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
