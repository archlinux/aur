# Maintainer: @aardbol
pkgname=picocrypt-ng-bin
_pkgname=Picocrypt-NG
pkgver=2.18
pkgrel=2
pkgdesc="A very small, very simple, yet very secure encryption tool. (GUI)"
arch=('x86_64' 'aarch64')
url="https://github.com/Picocrypt-NG/Picocrypt-NG"
license=('GPL3')
provides=('picocrypt-ng')
conflicts=('picocrypt-ng-git')
depends=(gtk3)
makedepends=(cosign)
options=('!strip' '!debug')

source=("picocrypt.desktop")
source_x86_64=(
 "${url}/releases/download/${pkgver}/${_pkgname}"
 "${url}/releases/download/${pkgver}/${_pkgname}.sigstore.json"
)
source_aarch64=(
 "${url}/releases/download/${pkgver}/${_pkgname}-arm64"
 "${url}/releases/download/${pkgver}/${_pkgname}-arm64.sigstore.json"
)

sha256sums=('d06954953bafc0fd9bb5edf609dff65ec0f0d95d971d096df7d72abe6e830e99')
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
        x86_64)  srcbin="${_pkgname}";       bundle="${_pkgname}.sigstore.json" ;;
        aarch64) srcbin="${_pkgname}-arm64"; bundle="${_pkgname}-arm64.sigstore.json" ;;
    esac

    cosign verify-blob "$srcdir/$srcbin" \
        --bundle "$srcdir/$bundle" \
        --certificate-oidc-issuer https://token.actions.githubusercontent.com \
        --certificate-identity-regexp "^${url}/\.github/workflows/"
}

package() {
    local srcbin
    case "$CARCH" in
        x86_64)  srcbin="$_pkgname" ;;
        aarch64) srcbin="$_pkgname-arm64" ;;
    esac

    install -Dm755 "$srcdir/$srcbin" "$pkgdir/usr/bin/${_pkgname,,}"
    install -Dm644 picocrypt.desktop "$pkgdir/usr/share/applications/${_pkgname,,}.desktop"
}