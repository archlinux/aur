# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation
reponame=pot-desktop
_pkgver=2.0.0-beta.0
pkgver=2.0.0.beta.0
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

sha512sums=('c2db7c73769e1110a96fbb6552bfa5c9f548cc3ef83d477f5401912682ca134b505b3b9cd4885c2c15ebc3b7c0824a8be1c18601adc2ffb70d3bc7d28b4e9f7f')

pkgver() {
    cd "${srcdir}/${reponame}-${_pkgver}"
    printf "%s" "$(echo $_pkgver | sed 's/-/\./g')"
}

build(){
    cd $srcdir/${reponame}-${_pkgver}
    sed -i "s/\"version\".*/\"version\": \"$_pkgver\"/g" src-tauri/tauri.conf.json 
    pnpm i
    pnpm tauri build -b deb
}
package() {
    cd $srcdir/${reponame}-${pkgver}
    tar xpf src-tauri/target/release/bundle/deb/pot_${pkgver}_amd64/data.tar.gz -C ${pkgdir}
}
