# Maintainer: Marat Talipov <t-marat@yandex.ru>
# Based on package "google-docs-nativefier"

pkgname=yandex-mail-nativefier
pkgver=1
pkgrel=1
pkgdesc="Electron wrapper for the Yandex Mail web application"
arch=(x86_64)
license=(MIT)
url=https://mail.yandex.ru
source=($pkgname.png
        $pkgname.desktop)
makedepends=(nodejs nodejs-nativefier npm unzip)
sha256sums=('1ea7c73755992387e9fd8309532ccbb6f3c945d6b96739caffda2128ac0afb86'
            'feaaee4ec9794e11b954f395029a20144d378c764351a046738415a13a43d186')

_instname=YandexMail

build() {
    nativefier "https://mail.yandex.ru/" \
      --icon $pkgname.png \
      --maximize \
      --name "$_instname" \
      --user-agent "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:70.0) Gecko/20100101 Firefox/70.0" \
      --internal-urls "(.*?mail\.yandex\.ru.*?)" \
      --single-instance \
      --electron-version 8.2.0
}

package() {
    install -d "$pkgdir"/opt "$pkgdir"/usr/{bin,share/pixmaps}
    install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$_instname.desktop

    cp -rL $_instname-linux-* "$pkgdir"/opt/$pkgname
    ln -sf /opt/$pkgname/$_instname "$pkgdir"/usr/bin/$_instname
    ln -sf /opt/$pkgname/resources/app/icon.png "$pkgdir"/usr/share/pixmaps/$_instname.png

    chmod 666 "$pkgdir"/opt/$pkgname/resources/app/nativefier.json
}