# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation
reponame=pot-desktop
_pkgver=2.0.2
pkgver=2.0.1
pkgrel=1
pkgdesc="一个跨平台的划词翻译软件"
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'riscv64')
url="https://github.com/pot-app/pot-desktop"
license=('GPL3')
provides=("$pkgname")
conflicts=("$pkgname-bin" "$pkgname-git")
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator' 'xdotool' 'libxcb' 'libxrandr' 'tesseract' 'tessdata')
makedepends=('nodejs' 'pnpm' 'fnm' 'rust' 'dbus')

source=("${reponame}-${_pkgver}.tar.gz::${url}/archive/refs/tags/${_pkgver}.tar.gz")

sha512sums=('edaf0d1d0f6dab717676160616286730a466f222e05b6b44106ca95457a09edfa34a112d3ec1677d88ebd00ee0eec0f85dca6bec28d24b09f4e0d78442139cdb')

pkgver() {
    printf "%s" "$(echo $_pkgver | sed 's/-/\./g')"
}

build(){
    fnm install 20.5.0 && fnm use 20.5.0
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
