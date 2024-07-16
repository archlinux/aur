# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-rev
pkgver=1.7.5
pkgrel=3
pkgdesc="Continuation of Clash Verge | A Clash Meta GUI based on Tauri"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/clash-verge-rev/clash-verge-rev"
license=('GPL3')
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator')
conflicts=("$pkgname-bin" "$pkgname-alpha" "$pkgname-alpha-bin" "$pkgname-git" "clash-verge" "clash-verge-bin")
makedepends=('nodejs' 'pnpm' 'rust')
install=.install

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")

sha512sums=('8ca48a722b4018857e18ea06d4b4c2ff1eef3d00506f738a2ca3bce01f27118887cd48e3d95530052e5577f88f9337440c0a1fa3b88e203ecaf4bf699d4080cd')
options=('!lto')

prepare(){
    cd $srcdir/${pkgname}-${pkgver}
    pnpm install
    pnpm check
}

build(){
    cd $srcdir/${pkgname}-${pkgver}
    NODE_OPTIONS="--max_old_space_size=4096" pnpm build -b deb
}

package() {
    cd $srcdir/${reponame}-${pkgver}
    tar xpf src-tauri/target/release/bundle/deb/clash-verge_${pkgver}_*/data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
