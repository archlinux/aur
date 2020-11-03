# Maintainer: Lyr <lyr-7d1h@pm.me>

pkgname="dimport"
pkgver=1.3
pkgrel=1
pkgdesc="Dotfiles Importer - Import and keep your dotfiles in sync"
arch=("x86_64")
url="https://github.com/Lyr-7D1h/dotfiles_importer_revamped"
license=("MIT")
depends=("dbus")
makedepends=("rust" "cargo")
source=("git+https://github.com/Lyr-7D1h/dotfiles_importer_revamped.git#tag=v${pkgver}?signed" 
        "dimportd.service") 
validpgpkeys=("F0E576DC4C752710F168C87C650AC1B95E7FEE6E")
sha256sums=('SKIP'
            'ae52ae32a5e92f4c90ffe524ba5cccd25b3d9fe11557106127c4e56bdfdef3b4')

build() {
    cd "$srcdir/dotfiles_importer_revamped/dimport"
    SOCKET_PATH=/run/dimportd.socket \
    cargo build --release --locked 
    cd "$srcdir/dotfiles_importer_revamped/dimportd"
    SOCKET_PATH=/run/dimportd.socket \
    CONFIG_PATH=/etc/dimport/config.json \
    STATE_PATH=/var/lib/dimport/state.json \
    REPISTORY_DIR=/var/lib/dimport/repository \
    BACKUP_DIR=/var/lib/dimport/backup \
    cargo build --release --locked
}

package() {
    install -D -m755 "$srcdir/dotfiles_importer_revamped/dimport/target/release/dimport" "$pkgdir/usr/bin/dimport"
    install -D -m755 "$srcdir/dotfiles_importer_revamped/dimportd/target/release/dimportd" "$pkgdir/usr/bin/dimportd"
    install -D -m644 "$srcdir/dotfiles_importer_revamped/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -D -m644 "$srcdir/dimportd.service" "$pkgdir/usr/lib/systemd/system/dimportd.service"
    mkdir -p "$pkgdir/etc/dimport"
    mkdir -p "$pkgdir/var/lib/dimport"
}
