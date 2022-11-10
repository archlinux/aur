# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

pkgname=nym-wallet
pkgver=1.0.9
pkgrel=1
pkgdesc='The next generation of privacy infrastructure (Nym Wallet)'
arch=('x86_64')
url='https://nymtech.net/'
license=('MIT')
depends=('openssl' 'pango' 'gdk-pixbuf2' 'webkit2gtk' 'librsvg' 'libbsd')
optdepends=('libappindicator-gtk3: system tray support')
makedepends=('cargo' 'nodejs' 'npm' 'yarn' 'patchelf')
source=("https://github.com/nymtech/nym/archive/refs/tags/nym-wallet-v$pkgver.tar.gz")
sha512sums=('191d6e9848dacaa9cbb6a4ec26776d509981408b42028381138f9a1cb1904dbcc5da2fe68f349e8fd112ebde808ba4c566f83db257e3cb0317d8ac077db19fc5')
_datadir="nym-wallet/target/release/bundle/deb/nym-wallet_${pkgver}_amd64/data"

prepare() {
    sed -ri 's/"targets": .+,/"targets": ["deb"],/' nym-nym-wallet-v$pkgver/nym-wallet/src-tauri/tauri.conf.json
}

build() {
    cd nym-nym-wallet-v$pkgver/nym-wallet

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    yarn install --network-timeout 60000 --cache-folder "$srcdir/yarn-cache"
    yarn build
    sed -ri \
        -e 's|^Categories=.+|Categories=Network;Finance;|' \
        -e 's|^Exec=.+|Exec=/usr/bin/nym-wallet|' \
        -e 's|^Name=.+|Name=Nym Wallet|' \
        $_datadir/usr/share/applications/nym-wallet.desktop
}

package() {
    cd nym-nym-wallet-v$pkgver

    cp -r "$_datadir/usr" "$pkgdir/"
    install -Dm644 LICENSES/MIT.txt "$pkgdir/usr/share/licenses/nym-wallet/LICENSE"
}
