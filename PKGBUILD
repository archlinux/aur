# Maintainer: @aardbol
pkgname=picocrypt-ng-bin
pkgver=2.18
pkgrel=1
pkgdesc="A very small, very simple, yet very secure encryption tool. (GUI)"
arch=('x86_64' 'aarch64')
url="https://github.com/Picocrypt-NG/Picocrypt-NG"
license=('GPL3')
provides=('picocrypt-ng')
conflicts=('picocrypt-ng-git')
depends=(gtk3)
makedepends=(cosign)
options=('!strip' '!debug')
source=(
    "picocrypt.desktop"
)
source_x86_64=(
 "${url}/releases/download/${pkgver}/Picocrypt-NG"
 "${url}/releases/download/${pkgver}/Picocrypt-NG.sigstore.json"
)
source_aarch64=(
 "${url}/releases/download/${pkgver}/Picocrypt-NG-arm64"
 "${url}/releases/download/${pkgver}/Picocrypt-NG-arm64.sigstore.json"
)
sha256sums=(
 'd06954953bafc0fd9bb5edf609dff65ec0f0d95d971d096df7d72abe6e830e99'
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
        x86_64)  srcbin="Picocrypt-NG";       bundle="Picocrypt-NG.sigstore.json" ;;
        aarch64) srcbin="Picocrypt-NG-arm64"; bundle="Picocrypt-NG-arm64.sigstore.json" ;;
    esac

    cosign verify-blob "$srcdir/$srcbin" \
        --bundle "$srcdir/$bundle" \
        --certificate-oidc-issuer https://token.actions.githubusercontent.com \
        --certificate-identity-regexp '^https://github.com/Picocrypt-NG/Picocrypt-NG/\.github/workflows/'
}

package() {
    local srcbin
    case "$CARCH" in
        x86_64)  srcbin="Picocrypt-NG" ;;
        aarch64) srcbin="Picocrypt-NG-arm64" ;;
    esac

    install -Dm755 "$srcdir/$srcbin" "$pkgdir/usr/bin/picocrypt-ng"
    install -Dm644 picocrypt.desktop "$pkgdir/usr/share/applications/picocrypt-ng.desktop"
}