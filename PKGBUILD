# Maintainer: Velmi1337
# Stable source release; see https://github.com/Velmi1337/ALOL
pkgname=alol
pkgver=1.0.1
pkgrel=2
pkgdesc='Arizona RP and Rodina RP for Linux with a Material 3 Expressive interface'
arch=('x86_64')
url='https://github.com/Velmi1337/ALOL'
license=('Apache-2.0' 'OFL-1.1')
depends=('gtk3' 'glib2' 'cairo' 'libarchive' 'curl' 'umu-launcher' 'polkit' 'glibc' 'gcc-libs' 'fontconfig' 'xdg-utils')
makedepends=('rust' 'python')
checkdepends=('desktop-file-utils')
optdepends=(
    'gamemode: optional CPU and scheduler optimisations while playing'
    'wine-staging: alternative to Proton, with a separate Wine prefix'
    'winetricks: components for the system Wine runner'
)
options=('!debug' '!lto' '!buildflags')
source=("$url/releases/download/v$pkgver/alol-$pkgver.tar.gz")
sha256sums=('79a87f58d1e37daecb6a77ed74ac566101bf26d6e9e8e2738dbf4a40113a244e')

_alol_buildenv() {
    # Keep user paths out of binaries, including panic strings and compiler metadata.
    export CARGO_ENCODED_RUSTFLAGS="--remap-path-prefix=$srcdir=/usr/src/alol"
    export CARGO_INCREMENTAL=0
    export CARGO_HOME="$srcdir/cargo-home"
}

build() {
    _alol_buildenv
    cd "alol-$pkgver"
    cargo build --frozen --offline --release
}

check() {
    _alol_buildenv
    cd "alol-$pkgver"
    cargo test --frozen --offline
    desktop-file-validate assets/alol.desktop
    PYTHONDONTWRITEBYTECODE=1 python3 tests/integration.py
    PYTHONDONTWRITEBYTECODE=1 python3 tests/mods_integration.py
    PYTHONDONTWRITEBYTECODE=1 python3 tests/game_integration.py
    PYTHONDONTWRITEBYTECODE=1 python3 tests/project_integration.py
    PYTHONDONTWRITEBYTECODE=1 python3 tests/update_integration.py
    PYTHONDONTWRITEBYTECODE=1 python3 tests/proton_runtime.py
}

package() {
    cd "alol-$pkgver"
    install -Dm755 target/release/alol "$pkgdir/usr/bin/alol"
    install -Dm644 assets/alol.desktop "$pkgdir/usr/share/applications/alol.desktop"
    install -Dm644 assets/alol.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/alol.svg"
    install -Dm644 assets/alol.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/alol.png"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/alol/LICENSE"
    install -Dm644 NOTICE "$pkgdir/usr/share/licenses/alol/NOTICE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/alol/README.md"
}
