# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

pkgname=nym-wallet
pkgver=1.1.5
pkgrel=1
pkgdesc='The next generation of privacy infrastructure (Nym Wallet)'
arch=('x86_64')
url='https://nymtech.net/'
license=('MIT')
depends=('openssl' 'pango' 'gdk-pixbuf2' 'webkit2gtk' 'librsvg' 'libbsd')
optdepends=('libappindicator-gtk3: system tray support')
makedepends=('git' 'cargo' 'nodejs' 'npm' 'yarn' 'patchelf')
source=()
sha512sums=()
_datadir="src-tauri/target/release/bundle/deb/nym-wallet_${pkgver}_amd64/data"

prepare() {
    # NOTE: Build process requires cloned git repo
    git clone https://github.com/nymtech/nym.git -b nym-wallet-v$pkgver
    sed -ri 's/"targets": .+,/"targets": ["deb"],/' nym/nym-wallet/src-tauri/tauri.conf.json
}

build() {
    cd nym/nym-wallet

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
    cd nym

    cp -r "nym-wallet/$_datadir/usr" "$pkgdir/"
    install -Dm644 LICENSES/MIT.txt "$pkgdir/usr/share/licenses/nym-wallet/LICENSE"
}
