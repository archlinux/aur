# Maintainer: Daniel Azevedo <daniazevedo77@posteo.net>

pkgname=pwm-d77
_name=pwm
pkgver=0.6.4
pkgrel=1
pkgdesc="PipaWindowManager, a Penrose Lib Tiling Window Manager"
arch=('x86_64')
url="https://github.com/dani-77/pwm"
license=('MIT')
provides=('pwm')
conflicts=('pwm')
depends=('libx11' 'libxft' 'dmenu' 'st' 'wireless_tools' 'dbus' 'gcc-libs' 'glibc')
makedepends=('cargo' 'pkgconf')
optdepends=(
  'slock: default screen locker'
  'libpulse: volume keys (pactl)'
  'feh: wallpaper in startup.sh'
  'conky: system monitor in startup.sh'
  'dunst: notifications in startup.sh'
  'udiskie: automounting in startup.sh'
  'xcompmgr: compositing in startup.sh'
  'xautolock: idle locking in startup.sh'
  'redshift: colour temperature in startup.sh'
  'sxhkd: extra hotkeys in startup.sh'
  'xf86-input-synaptics: touchpad tap-to-click in startup.sh'
)
backup=('etc/xdg/pwm/startup.sh')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('33756bdb09fd9f072d78dbcf6320191d3305f33722ce133a53ce3555deab7f15')

prepare() {
    cd "$_name-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$_name-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$_name-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --release
}

package() {
    cd "$_name-$pkgver"
    install -Dm755 target/release/pwm "$pkgdir/usr/bin/pwm"
    install -Dm644 pwm.desktop "$pkgdir/usr/share/xsessions/pwm.desktop"
    install -d "$pkgdir/etc/xdg/pwm"
    cp -r etc/xdg/pwm/. "$pkgdir/etc/xdg/pwm/"
    install -Dm644 usr/share/pwm/config.toml.example \
        "$pkgdir/usr/share/pwm/config.toml.example"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
