# Maintainer: Sarat Chandra <me at saratchandra dot in>

pkgname=doggo-bin
pkgver=1.0.5
pkgrel=1
pkgdesc="Command-line DNS client for humans "
arch=('x86_64' 'aarch64')
url="https://github.com/mr-karan/doggo"
license=('MIT')
depends=()
makedepends=()
provides=('doggo')
conflicts=('doggo')
source_x86_64=("https://github.com/mr-karan/doggo/releases/download/v${pkgver}/doggo_${pkgver}_Linux_x86_64.tar.gz")
source_aarch64=("https://github.com/mr-karan/doggo/releases/download/v${pkgver}/doggo_${pkgver}_Linux_arm64.tar.gz")
sha256sums_x86_64=('3e9047da1c473c3895230e4bf3303b1b7a5d1c82cc688043be431984e1de697d')
sha256sums_aarch64=('999eca7a590e4230fb63cc4390a74355ad16023b3103914c6c051b3f6bf8973d')

package() {
    cd "${srcdir}"

    # Determine the correct subfolder based on architecture
    if [ "$CARCH" = "x86_64" ]; then
        subfolder="doggo_${pkgver}_Linux_x86_64"
    elif [ "$CARCH" = "aarch64" ]; then
        subfolder="doggo_${pkgver}_Linux_arm64"
    else
        echo "Unsupported architecture: $CARCH"
        exit 1
    fi

    # Install doggo
    install -D -m0755 "${subfolder}/doggo" \
        "${pkgdir}/usr/bin/doggo"

    # Copy license
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    cp "${subfolder}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}"

    # Copy README.md
    mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
    cp "${subfolder}/README.md" \
        "${pkgdir}/usr/share/doc/${pkgname}"

    # Install completions
    mkdir -p "${pkgdir}/usr/share/zsh/site-functions"
    "${pkgdir}/usr/bin/doggo" completions zsh > "${pkgdir}/usr/share/zsh/site-functions/_doggo"

    mkdir -p "${pkgdir}/usr/share/fish/vendor_completions.d"
    "${pkgdir}/usr/bin/doggo" completions fish > "${pkgdir}/usr/share/fish/vendor_completions.d/doggo.fish"
}