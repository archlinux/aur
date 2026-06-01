# Maintainer: Castle <support@castlehq.com>
pkgname=castle-bin
pkgver=0.1.6
pkgrel=1
pkgdesc="CLI for Castle project management"
arch=('x86_64' 'aarch64')
url="https://castlehq.com"
license=('custom')
provides=('castle')
conflicts=('castle')

source_x86_64=("castle-linux-x86_64-${pkgver}::https://a.castlehq.com/dl/cli/${pkgver}/castle-linux-x86_64")
source_aarch64=("castle-linux-aarch64-${pkgver}::https://a.castlehq.com/dl/cli/${pkgver}/castle-linux-aarch64")

# Update checksums after each release with: updpkgsums
sha256sums_x86_64=('1dec29253c67d7604a39a2c742cbf75534e2be559e915976eb5642ea9eebbc6e')
sha256sums_aarch64=('1c9004faafed6faccbd8b820746af79a5ffcd0d8aa00e0e8a6c199e383df9b85')

package() {
    if [[ "$CARCH" == "x86_64" ]]; then
        install -Dm755 "castle-linux-x86_64-${pkgver}" "${pkgdir}/usr/bin/castle"
    else
        install -Dm755 "castle-linux-aarch64-${pkgver}" "${pkgdir}/usr/bin/castle"
    fi

    # Generate shell completions
    "${pkgdir}/usr/bin/castle" completions bash > castle.bash 2>/dev/null || true
    "${pkgdir}/usr/bin/castle" completions zsh > _castle 2>/dev/null || true
    "${pkgdir}/usr/bin/castle" completions fish > castle.fish 2>/dev/null || true

    if [[ -s castle.bash ]]; then
        install -Dm644 castle.bash "${pkgdir}/usr/share/bash-completion/completions/castle"
    fi
    if [[ -s _castle ]]; then
        install -Dm644 _castle "${pkgdir}/usr/share/zsh/site-functions/_castle"
    fi
    if [[ -s castle.fish ]]; then
        install -Dm644 castle.fish "${pkgdir}/usr/share/fish/vendor_completions.d/castle.fish"
    fi
}
