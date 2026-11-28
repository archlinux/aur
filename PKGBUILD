# Maintainer: adelmonte
pkgname=lanlink
pkgver=0.2.2
pkgrel=1
pkgdesc='A small KDE Connect alternative: daemon and TUI in one Rust binary'
arch=('x86_64' 'aarch64')
url='https://github.com/adelmonte/lanlink'
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
optdepends=('sshfs: browse the phone from the computer'
            'wl-clipboard: clipboard sending and receiving on Wayland'
            'xclip: clipboard sending and receiving on X11')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('aa9b7500a2135b117d96b7e92c62283fa25fc3b0b1f7e2fdedc0afdb8e402187')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/lanlink "$pkgdir/usr/bin/lanlink"
  install -Dm644 contrib/lanlink.service "$pkgdir/usr/lib/systemd/user/lanlink.service"
  sed -i 's|^ExecStart=.*|ExecStart=/usr/bin/lanlink daemon|' "$pkgdir/usr/lib/systemd/user/lanlink.service"
  install -Dm644 contrib/60-lanlink-uinput.rules "$pkgdir/usr/lib/udev/rules.d/60-lanlink-uinput.rules"
  install -Dm644 contrib/uinput.conf "$pkgdir/usr/lib/modules-load.d/lanlink.conf"
  install -Dm644 contrib/config.toml "$pkgdir/usr/share/doc/lanlink/config.toml"
  install -Dm644 README.md "$pkgdir/usr/share/doc/lanlink/README.md"
}
