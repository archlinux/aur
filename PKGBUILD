# Maintainer: Sarat Chandra <me at saratchandra dot in>

pkgname=doggo-bin
pkgver=1.1.2
pkgrel=2
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
sha256sums_x86_64=('187d2a23402427aed8ab7c6fa704ffc1534bd594535c64f318f8904229f00647')
sha256sums_aarch64=('a0452c5b62c1e44691922b9456ada777eed85ac1f501fcc975f38e109d557be7')

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
    mkdir -p "${pkgdir}/usr/share/bash-completion/completions"
    "${pkgdir}/usr/bin/doggo" completions bash > "${pkgdir}/usr/share/bash-completion/completions/doggo"

    mkdir -p "${pkgdir}/usr/share/zsh/site-functions"
    "${pkgdir}/usr/bin/doggo" completions zsh > "${pkgdir}/usr/share/zsh/site-functions/_doggo"

    mkdir -p "${pkgdir}/usr/share/fish/vendor_completions.d"
    "${pkgdir}/usr/bin/doggo" completions fish > "${pkgdir}/usr/share/fish/vendor_completions.d/doggo.fish"
}
