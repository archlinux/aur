# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
#
# There is no way to get notifications on the binary update at the moment but
# one can do it manually with the following request.
#
#    curl "https://storage.yandexcloud.net/yandexcloud-yc/release/stable"

pkgname=yandex-cloud-bin
pkgver=0.158.0
pkgrel=1
pkgdesc='Yandex.Cloud CLI'
arch=('x86_64')
url='https://cloud.yandex.ru/docs/cli/'
license=('unknown')
provides=('yandex-cloud')
source=("yc-$pkgver::https://storage.yandexcloud.net/yandexcloud-yc/release/${pkgver}/linux/amd64/yc")
sha256sums=('9a71938720221ed1fc9351573f44a230bb2a2420d62c6acb383c2bcf823dc669')

prepare() {
    mkdir -p "${pkgname}-${pkgver}"
    chmod +x "yc-${pkgver}"
}

build() {
    cd "${pkgname}-${pkgver}"
    ../yc-${pkgver} completion bash > yc
    ../yc-${pkgver} completion fish > yc.fish
    ../yc-${pkgver} completion zsh > _yc
    ../yc-${pkgver} components post-update
    cp /usr/bin/docker-credential-yc .
}

package() {
    cd "${pkgname}-${pkgver}"
    # install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm755 "../yc-${pkgver}" "$pkgdir/usr/bin/yc"
    install -Dm755 'docker-credential-yc' "$pkgdir/usr/bin/docker-credential-yc"
    install -Dm644 yc "$pkgdir/usr/share/bash-completion/completions/yc"
    install -Dm644 yc.fish "$pkgdir/usr/share/fish/vendor_completions.d/yc.fish"
    install -Dm644 _yc "$pkgdir/usr/share/zsh/site_functions/_yc"
}
