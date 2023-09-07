# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation
reponame=pot-desktop
_pkgver=2.1.0
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

sha512sums=('450f276bc9ee5bc11f3ff0e85244d05e161017bcd5a9a49f54de5f489c2a9885c69d84e8bc433e22a673a71beee1caf32296a1f5624151d827175375520c07f9')

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
