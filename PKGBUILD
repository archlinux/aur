# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation
reponame=pot-desktop
pkgver=3.0.6
pkgrel=1
pkgdesc="一个跨平台的划词翻译软件"
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'riscv64')
url="https://github.com/pot-app/pot-desktop"
license=('GPL3')
provides=("$pkgname")
conflicts=("$pkgname-bin" "$pkgname-git")
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator' 'xdotool' 'libxcb' 'libxrandr' 'tesseract' 'tessdata')
makedepends=('nodejs' 'pnpm' 'rust' 'dbus')

source=("${reponame}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")

sha512sums=('fc0a24cc59b52b7ae1d4405986a8346793d9fd9577c395b39fdf92fbcc881dc94d8f080cfcf26f30d34746bb58616a4d5a2953e60659f0cf8043b7cf0d0936ff')
options=('!lto')

prepare(){
    cd $srcdir/${reponame}-${pkgver}
    sed -i "s/\"version\".*/\"version\": \"$pkgver\"/g" src-tauri/tauri.conf.json
    pnpm install
}

build(){
    cd $srcdir/${reponame}-${pkgver}
    pnpm tauri build -b deb
}

package() {
    cd $srcdir/${reponame}-${pkgver}
    tar xpf src-tauri/target/release/bundle/deb/pot_${pkgver}_amd64/data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
