# Maintainer: Castle <support@castlehq.com>
pkgname=castle-bin
pkgver=0.1.4
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
sha256sums_x86_64=('212f54b39110d73b5ff8a6ac4aa035d69842126832d1873024bb6bbcf099f4cb')
sha256sums_aarch64=('df598f1e60b6591662e20af31e616cd11c18205a2970d5f34c1165bf42bb6c12')

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
