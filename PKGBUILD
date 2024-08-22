# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=clash-verge-rev
_pkgname=${pkgname%-rev}
pkgver=1.7.7
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

sha512sums=('22d915d2946ad327236769aa95594060dfd8f0e53d3e6d7c6a567512a2152ac80797afa45104a0b7f200abe37bba7629567fa4d0d247324c154e009fe76231d4')
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
