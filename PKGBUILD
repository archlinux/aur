# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation
reponame=pot-desktop
_pkgver=2.0.0
pkgver=2.0.0
pkgrel=1
pkgdesc="一个跨平台的划词翻译软件"
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'riscv64')
url="https://github.com/pot-app/pot-desktop"
license=('GPL3')
provides=("$pkgname")
conflicts=("$pkgname-bin" "$pkgname-git")
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator' 'xdotool' 'libxcb' 'libxrandr' 'tesseract' 'tessdata')
makedepends=('nodejs' 'pnpm' 'rust' 'dbus')

source=("${reponame}-${_pkgver}.tar.gz::${url}/archive/refs/tags/${_pkgver}.tar.gz")

sha512sums=('a73a76f9aef6475e6629cf81f17106f5a0e492f927df9cd3874f50d55bc58347ae15fcd77c1c4e6841fad2bd389f6d82fdaec02abbef5a08f798c6d638257bba')

pkgver() {
    printf "%s" "$(echo $_pkgver | sed 's/-/\./g')"
}

build(){
    cd $srcdir/${reponame}-${_pkgver}
    sed -i "s/\"version\".*/\"version\": \"$_pkgver\"/g" src-tauri/tauri.conf.json 
    pnpm i
    pnpm tauri build -b deb
}
package() {
    cd $srcdir/${reponame}-${_pkgver}
    tar xpf src-tauri/target/release/bundle/deb/pot_${_pkgver}_amd64/data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
