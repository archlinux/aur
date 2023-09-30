# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation
reponame=pot-desktop
pkgver=2.6.0
pkgrel=1
pkgdesc="一个跨平台的划词翻译软件"
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'riscv64')
url="https://github.com/pot-app/pot-desktop"
license=('GPL3')
provides=("$pkgname")
conflicts=("$pkgname-bin" "$pkgname-git")
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator' 'xdotool' 'libxcb' 'libxrandr' 'tesseract' 'tessdata')
makedepends=('nodejs' 'pnpm' 'fnm' 'rust' 'dbus')

source=("${reponame}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")

sha512sums=('9c65867544615a32771eb973c7fd3000885217b60a204f94325d2ef71b2c784e0f3df91a6fc8f7d00f15ec84ec58f19d92409038554118812f17560e738e939f')

build(){
    fnm install 20.5.0 && fnm use 20.5.0
    cd $srcdir/${reponame}-${pkgver}
    sed -i "s/\"version\".*/\"version\": \"$pkgver\"/g" src-tauri/tauri.conf.json 
    pnpm i
    pnpm tauri build -b deb
}
package() {
    cd $srcdir/${reponame}-${pkgver}
    tar xpf src-tauri/target/release/bundle/deb/pot_${pkgver}_amd64/data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
