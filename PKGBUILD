# Maintainer: Marat Talipov <t-marat@yandex.ru>
# Based on package "google-docs-nativefier"

pkgname=google-slides-nativefier
pkgver=21.04.01
pkgrel=1
pkgdesc="Electron wrapper for the Google Slides web application"
arch=(x86_64)
license=(MIT)
url=https://slides.google.com
source=($pkgname.png
        $pkgname.desktop)
makedepends=(nodejs nodejs-nativefier npm unzip)
sha256sums=('faafa258b255df313ec807447f87fde903d9b4b560cb83025d1396c5a07fe517'
            'd453eca9594c39cbb6de6910ca410878e4c381fd7b8845f9db09341435b88f7c')

_instname=GoogleSlides

# в internal-urls нужно включать и docs.google.com, и slides.google.com.
# потому что корневая страница приложения slides.google.com, но когда открываешь слайд на редактирование он открывается в docs.google.com
# если не добавить docs.google.com, тогда будет открываться в дефолтном браузере.
build() {
    nativefier "https://slides.google.com/" \
      --icon $pkgname.png \
      --maximize \
      --name "$_instname" \
      --user-agent "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:87.0) Gecko/20100101 Firefox/87.0" \
      --internal-urls "(.*?docs\.google\.com.*?|.*?slides\.google\.com.*?|.*?accounts\.google\.com.*?)"  \
      --electron-version 12.0.2
}

package() {
    # удаляем главное меню, которое появляется по нажатию Alt
    # Для этого в строчку №5078 вставляем: `mainWindow.removeMenu();`
    # номер строки может измениться, когда обновится electron. Тогда надо искать строчку return mainWindow и вставлять этот код перед ней
    sed -i '5078 i mainWindow.removeMenu();' $_instname-linux-x64/resources/app/lib/main.js
    
    install -d "$pkgdir"/opt "$pkgdir"/usr/{bin,share/pixmaps}
    install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$_instname.desktop

    cp -rL $_instname-linux-* "$pkgdir"/opt/$pkgname
    ln -sf /opt/$pkgname/$_instname "$pkgdir"/usr/bin/$_instname
    ln -sf /opt/$pkgname/resources/app/icon.png "$pkgdir"/usr/share/pixmaps/$_instname.png

    chmod 666 "$pkgdir"/opt/$pkgname/resources/app/nativefier.json
}