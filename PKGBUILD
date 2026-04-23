# Maintainer: kay-ws <a3.works@gmail.com>
pkgname=bcon
pkgver=1.3.4
pkgrel=1
pkgdesc="GPU-accelerated terminal emulator for Linux console (DRM/KMS)"
arch=('x86_64')
url="https://github.com/sanohiro/bcon"
license=('MIT')

# Disable LTO: the libseat crate compiles log_handler.c via cc, and
# -flto=auto from CFLAGS makes the resulting archive symbols unresolvable
# to rust-lld at link time (undefined reference to
# init_preformatted_log_handler). The Arch convention is options=(!lto).
#
# Disable debug split: `cargo --release` ships no debug info by default,
# so the auto-generated bcon-debug package would be empty.
options=(!lto !debug)

depends=(
    'libdrm'
    'mesa'
    'libxkbcommon'
    'libinput'
    'freetype2'
    'fontconfig'
    'seatd'
    # NOTE: dbus is not linked directly — zbus provides its own protocol
    # implementation. dbus-daemon is only needed via the optional fcitx5
    # IME path, which optdepends 'fcitx5' will pull in transitively.
)

makedepends=(
    'rust'
    'cmake'
    'clang'
    'pkgconf'
)

optdepends=(
    'fcitx5: Japanese input method support via D-Bus'
    'noto-fonts-cjk: CJK text rendering'
    'noto-fonts-emoji: color emoji rendering'
)

source=("bcon-${pkgver}.tar.gz::https://github.com/sanohiro/bcon/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ab5f484f9102867905347cfe0b21e4073cabf10907d0cb4bb37df8eb67698730')

prepare() {
    cd "$srcdir/bcon-$pkgver"
    sed -i 's|/usr/local/bin/|/usr/bin/|g' bcon.desktop bcon@.service
}

build() {
    cd "$srcdir/bcon-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$srcdir/bcon-$pkgver"
    install -Dm755 target/release/bcon   "$pkgdir/usr/bin/bcon"
    install -Dm755 bcon-session          "$pkgdir/usr/bin/bcon-session"
    install -Dm644 bcon@.service         "$pkgdir/usr/lib/systemd/system/bcon@.service"
    install -Dm644 bcon.desktop          "$pkgdir/usr/share/xsessions/bcon.desktop"
    install -Dm644 LICENSE               "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
