# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-rev
_pkgname=${pkgname%-rev}
pkgver=1.7.6
pkgrel=3
pkgdesc="Continuation of Clash Verge | A Clash Meta GUI based on Tauri"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/clash-verge-rev/clash-verge-rev"
license=('GPL3')
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator')
conflicts=("$pkgname-bin" "$pkgname-alpha" "$pkgname-alpha-bin" "$pkgname-git" "${_pkgname}" "${_pkgname}-bin")
makedepends=('nodejs' 'pnpm' 'rust')
install=.install

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")

sha512sums=('42abe3d4d446d37ebc51fd6e15735e8516bd831129c95028487f883561d3a8eee48ceca44ed510698af6e4e6f5a727681b3c96f1a57e65359d41968ddfac2e5e')
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
