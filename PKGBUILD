# Maintainer: Moritz Sauter <moritz.sauter7+aur at gmail dot com>

pkgname=i3status-rust-full-git
shortname="${pkgname%-full-*}"
pkgver=0.30.4.r3161.gf4490035
pkgrel=5
pkgdesc='Very resourcefriendly and feature-rich replacement for i3status to use with bar programs (like i3bar and swaybar), written in pure Rust'
arch=('x86_64')
url='https://github.com/greshake/i3status-rust'
license=('GPL3')
depends=('libpulse' 'lm_sensors' 'notmuch')
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
provides=("${shortname}")
conflicts=("${shortname}")
install="${shortname}.install"
source=("${shortname}::git+$url")
sha1sums=('SKIP')

pkgver() {
  cd "${shortname}"
  echo $(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).r$(git rev-list --count HEAD).g$(git describe --always)
}

build() {
  cd "${shortname}"
  cargo build --release --features "pulseaudio maildir notmuch"
  cargo xtask generate-manpage
}

package() {
  cd "${shortname}"
  install -Dm755 target/release/i3status-rs "$pkgdir/usr/bin/i3status-rs"
  install -Dm644 man/i3status-rs.1 -t "$pkgdir/usr/share/man/man1"

  for icon_set in files/icons/*.toml; do
    install -Dm644 "$icon_set" -t "$pkgdir/usr/share/${shortname}/icons"
  done

  for theme in files/themes/*.toml; do
    install -Dm644 "$theme" -t "$pkgdir/usr/share/${shortname}/themes"
  done

  for example_config in examples/*.toml; do
    install -Dm644 "$example_config" -t "$pkgdir/usr/share/doc/${shortname}/examples"
  done
}
