# Maintainer: zotan <aur@zotan.email>
# Contributor: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Bert Peters <bert@bertptrs.nl>
# Contributor: Varakh <varakh@varakh.de>
# Contributor: Florian Klink <flokli@flokli.de>

pkgbase=spotifyd-avahi
pkgname=('spotifyd-avahi')
pkgver=0.3.2
pkgrel=1
pkgdesc='Lightweight spotify streaming daemon with spotify connect support (avahi build)'
arch=('x86_64')
url='https://github.com/lhaus/spotifyd-avahi'
license=('GPL3')
conflicts=('spotifyd')
provides=('spotifyd')
depends=('alsa-lib' 'libogg' 'libpulse' 'dbus')
makedepends=('rust')
source=("https://github.com/lhaus/spotifyd-avahi/archive/v${pkgver}-avahi/${pkgname}-${pkgver}.tar.gz")
b2sums=('11a142d3275238e4c7c24f2364fff08c2715c935f5198c1d3afed7ebffbf13fc8b1be9507bc99526179126c6cd4d9d6a981edd25a63a02a477d3873ea659460e')

build() {
  cd spotifyd-avahi-${pkgver}-avahi
  cargo build --release --locked --features pulseaudio_backend,dbus_mpris,dbus_keyring,rodio_backend
}

check() {
  cd spotifyd-avahi-${pkgver}-avahi
  cargo test --release --locked --target-dir=target
 }

package() {
  cd spotifyd-avahi-${pkgver}-avahi
  cargo install --locked --root "${pkgdir}"/usr --path "${srcdir}"/${pkgbase}-${pkgver}-avahi --features pulseaudio_backend,dbus_mpris,dbus_keyring,rodio_backend
  rm "${pkgdir}"/usr/{.crates.toml,.crates2.json}
  install -Dm644 -t "${pkgdir}"/usr/lib/systemd/user/ "${srcdir}"/${pkgbase}-${pkgver}-avahi/contrib/spotifyd.service
}
