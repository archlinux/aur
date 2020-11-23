# Maintainer: Lyr <lyr-7d1h@pm.me>

pkgname="dimport"
pkgver=1.5.2
pkgrel=1
pkgdesc="Dotfiles Importer - Import and keep your dotfiles in sync"
arch=("x86_64")
url="https://github.com/Lyr-7D1h/dotfiles_importer_revamped"
license=("MIT")
depends=("dbus")
makedepends=("rust" "cargo")
source=("git+https://github.com/Lyr-7D1h/dotfiles_importer_revamped.git#tag=v${pkgver}?signed" 
        "dimportd@.service") 
validpgpkeys=("F0E576DC4C752710F168C87C650AC1B95E7FEE6E")
sha256sums=('SKIP'
            '33dc92cb906bb24f7ffc019b3592d7f9ff5ae80eee841c1d9e1129b1cc5dcb77')

build() {
    cd "$srcdir/dotfiles_importer_revamped/dimport"
    SOCKET_PATH=/tmp/dimportd.socket \
    cargo build --release --locked 
    cd "$srcdir/dotfiles_importer_revamped/dimportd"
    SOCKET_PATH=/tmp/dimportd.socket \
    CONFIG_PATH=~/.config/dimport/config.json \
    STATE_PATH=~/.local/share/dimport/state.json \
    REPOSITORY_DIR=~/.local/share/dimport/repository \
    BACKUP_DIR=~/.local/share/dimport/backup \
    cargo build --release --locked
}

package() {
    install -D -m755 "$srcdir/dotfiles_importer_revamped/dimport/target/release/dimport" "$pkgdir/usr/bin/dimport"
    install -D -m755 "$srcdir/dotfiles_importer_revamped/dimportd/target/release/dimportd" "$pkgdir/usr/bin/dimportd"
    install -D -m644 "$srcdir/dotfiles_importer_revamped/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -D -m644 "$srcdir/dimportd@.service" "$pkgdir/usr/lib/systemd/system/dimportd@.service"
}
