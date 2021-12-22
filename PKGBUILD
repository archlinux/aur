# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

pkgname=nym-wallet
pkgver=0.12.0
pkgrel=1
pkgdesc='The next generation of privacy infrastructure (Nym wallet)'
arch=('x86_64')
url='https://nymtech.net/'
license=('MIT')
depends=('openssl' 'pango' 'gdk-pixbuf2' 'webkit2gtk' 'librsvg')
makedepends=('cargo' 'nodejs' 'yarn' 'patchelf')
source=("https://github.com/nymtech/nym/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('29e8fe735d9b60b1a0207e1591e08aff4d51fd4e82aaf76898aedbfacae1dbf68c81230a9fbb24385db91f72a0d870bb5bb1f7e0e15c13e6425302b9492a8235')

prepare() {
    sed -ri 's/"targets": .+,/"targets": ["deb"],/' nym-$pkgver/nym-wallet/src-tauri/tauri.conf.json
}

build() {
    cd nym-$pkgver/nym-wallet

    yarn install --cache-folder "$srcdir/yarn-cache"
    yarn build
}

package() {
    cd nym-$pkgver

    cp -r "nym-wallet/target/release/bundle/deb/nym-wallet_${pkgver}_amd64/data/usr" "$pkgdir/"
    install -Dm644 LICENSES/MIT.txt "$pkgdir/usr/share/licenses/nym-wallet/LICENSE"
}
