# Maintainer: Jason Nader <jason.nader@protonmail.com>
# Contributor: Bryan Malyn <bim9262@gmail.com>

pkgname=i3status-rust-git
pkgver=0.32.3.r3432.g4a048bb1
pkgrel=2
pkgdesc='Very resourcefriendly and feature-rich replacement for i3status to use with bar programs (like i3bar and swaybar), written in pure Rust'
arch=('x86_64')
url='https://github.com/greshake/i3status-rust'
license=('GPL3')
depends=('libpulse' 'lm_sensors')
makedepends=('git' 'rust' 'pandoc')
optdepends=('alsa-utils: for the volume block'
            'bluez: for the bluetooth block'
            'fakeroot: for the pacman block to show pending updates'
            'kdeconnect: for the kdeconnect block'
            'powerline-fonts: for all themes using the powerline arrow char'
            'pulseaudio: for the volume block'
            'speedtest-cli: for the speedtest block'
            'ttf-font-awesome: for the awesome icons'
            'upower: for the battery block')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
install="${pkgname%-*}.install"
source=("${pkgname%-*}::git+$url")
sha1sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  echo $(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).r$(git rev-list --count HEAD).g$(git describe --always)
}

prepare() {
  cd "${pkgname%-*}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${pkgname%-*}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --features 'pulseaudio maildir'
  cargo xtask generate-manpage
}

package() {
  cd "${pkgname%-*}"
  install -Dm755 -t "${pkgdir}"/usr/bin target/release/i3status-rs
  install -Dm644 -t "${pkgdir}"/usr/share/man/man1 man/i3status-rs.1

  for icon_set in files/icons/*.toml; do
    install -Dm644 -t "${pkgdir}"/usr/share/${pkgname}/icons "${icon_set}"
  done

  for theme in files/themes/*.toml; do
    install -Dm644 -t "${pkgdir}"/usr/share/${pkgname}/themes "${theme}"
  done

  for example_config in examples/*.toml; do
    install -Dm644 -t "${pkgdir}"/usr/share/doc/${pkgname}/examples/ "${example_config}"
  done
}
