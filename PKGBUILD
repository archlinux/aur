# Maintainer: Niklas Schönberg <niklas@foonly.dev>

pkgname=jman
pkgver=5.41.0
pkgrel=1
pkgdesc="A command-line utility designed to manage WordPress sites hosted on SpinupWP."
url="https://github.com/JCO-Digital/${pkgname}"
license=("GPL-3.0-only")
arch=("x86_64")
provides=("jman")
conflicts=("jman")
depends=("wp-cli")
makedepends=("go")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
options=(!debug !lto)
sha256sums=('0f9d7aedfc6b8c20b7991ac710aff2776c676e6e7bf485272bcbd6d920031d6f')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    go build -tags noupdate -ldflags="-s -w -X github.com/JCO-Digital/jman/internal/config.AppVersion=${pkgver}" ./cmd/jman

    export XDG_CONFIG_HOME="${srcdir}/config"
    export XDG_DATA_HOME="${srcdir}/data"
    export XDG_CACHE_HOME="${srcdir}/cache"
    export JMAN_TOKENSPINUP="placeholder"

    ./jman completion bash > jman.bash
    ./jman completion zsh > _jman
    ./jman completion fish > jman.fish
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm755 jman "${pkgdir}/usr/bin/jman"
    install -Dm644 jman.bash "${pkgdir}/usr/share/bash-completion/completions/jman"
    install -Dm644 _jman "${pkgdir}/usr/share/zsh/site-functions/_jman"
    install -Dm644 jman.fish "${pkgdir}/usr/share/fish/vendor_completions.d/jman.fish"
}
