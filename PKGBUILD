# Maintainer: Benigno Batista Jr <benignobjunior@gmail.com>
pkgname=lockenv
pkgver=0.1.8
pkgrel=2
pkgdesc='Simple, password-based encrypted vault for .env and infrastructure secrets'
arch=('x86_64' 'aarch64')
url='https://github.com/illarion/lockenv'
license=('MIT')
makedepends=('go')
provides=('lockenv')
conflicts=('lockenv-bin')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('9d14eff0b5f2310e95a145e069aafa50e530a24f9beb7eb40dc8e5d4694d3ab5')

build() {
    cd "${pkgname}-${pkgver}"
    export CGO_ENABLED=0
    go build -buildmode=pie -trimpath -mod=readonly \
        -ldflags="-w -s" -o "${pkgname}" .
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "${pkgname}" "$pkgdir/usr/bin/${pkgname}"

    "$pkgdir/usr/bin/${pkgname}" completion bash > lockenv.bash
    "$pkgdir/usr/bin/${pkgname}" completion zsh > _lockenv
    "$pkgdir/usr/bin/${pkgname}" completion fish > lockenv.fish
    install -Dm644 lockenv.bash "$pkgdir/usr/share/bash-completion/completions/lockenv"
    install -Dm644 _lockenv "$pkgdir/usr/share/zsh/site-functions/_lockenv"
    install -Dm644 lockenv.fish "$pkgdir/usr/share/fish/vendor_completions.d/lockenv.fish"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
