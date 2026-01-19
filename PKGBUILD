# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
#
# There is no way to get notifications on the binary update at the moment but
# one can do it manually with the following request.
#
#    curl "https://storage.yandexcloud.net/yandexcloud-yc/release/stable"

pkgname=yandex-cloud-bin
pkgver=0.186.0
pkgrel=1
pkgdesc='Yandex.Cloud CLI'
arch=('x86_64')
url='https://cloud.yandex.ru/docs/cli/'
license=('unknown')
provides=('yandex-cloud')
source=("yc-$pkgver::https://storage.yandexcloud.net/yandexcloud-yc/release/${pkgver}/linux/amd64/yc")
sha256sums=('820ad056beec8040b90f02828a01c616c60f911d31b13d34d2deb464e9fd07a6')

prepare() {
    mkdir -p "${pkgname}-${pkgver}"
    chmod +x "yc-${pkgver}"
}

build() {
    cd "${pkgname}-${pkgver}"
    ../yc-${pkgver} completion bash > yc
    ../yc-${pkgver} completion fish > yc.fish
    ../yc-${pkgver} completion zsh > _yc
}

package() {
    cd "${pkgname}-${pkgver}"
    # install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm755 "../yc-${pkgver}" "$pkgdir/usr/bin/yc"
    install -Dm644 yc "$pkgdir/usr/share/bash-completion/completions/yc"
    install -Dm644 yc.fish "$pkgdir/usr/share/fish/vendor_completions.d/yc.fish"
    install -Dm644 _yc "$pkgdir/usr/share/zsh/site_functions/_yc"
}
