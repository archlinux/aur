# Maintainer: @aardbol
pkgname=picocrypt-ng-cli-bin
pkgver=2.18
pkgrel=1
pkgdesc="A very small, very simple, yet very secure encryption tool. (CLI)"
arch=('x86_64' 'aarch64')
url="https://github.com/Picocrypt-NG/Picocrypt-NG"
license=('GPL3')
provides=('picocrypt-ng-cli')
conflicts=('picocrypt-ng-cli-git')
depends=('glibc')
makedepends=(cosign)
source_x86_64=(
 "${url}/releases/download/${pkgver}/Picocrypt-NG-cli"
 "${url}/releases/download/${pkgver}/Picocrypt-NG-cli.sigstore.json"
)
source_aarch64=(
 "${url}/releases/download/${pkgver}/Picocrypt-NG-cli-arm64"
 "${url}/releases/download/${pkgver}/Picocrypt-NG-cli-arm64.sigstore.json"
)
# Verified by cosign below instead
sha256sums_x86_64=(
 'SKIP'
 'SKIP'
)
# Verified by cosign below instead
sha256sums_aarch64=(
 'SKIP'
 'SKIP'
)

prepare() {
    local srcbin bundle
    case "$CARCH" in
        x86_64)  srcbin="Picocrypt-NG-cli";       bundle="Picocrypt-NG-cli.sigstore.json" ;;
        aarch64) srcbin="Picocrypt-NG-cli-arm64"; bundle="Picocrypt-NG-cli-arm64.sigstore.json" ;;
    esac

    cosign verify-blob "$srcdir/$srcbin" \
        --bundle "$srcdir/$bundle" \
        --certificate-oidc-issuer https://token.actions.githubusercontent.com \
        --certificate-identity-regexp '^https://github.com/Picocrypt-NG/Picocrypt-NG/\.github/workflows/'
}

package() {
    local srcbin
    case "$CARCH" in
        x86_64)  srcbin="Picocrypt-NG-cli" ;;
        aarch64) srcbin="Picocrypt-NG-cli-arm64" ;;
    esac

    install -Dm755 "$srcdir/$srcbin" "$pkgdir/usr/bin/picocrypt-ng-cli"
}