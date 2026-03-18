# Maintainer: J. Gerhards <g1.jasger@gmail.com>
# Author: J. Gerhards <g1.jasger@gmail.com>

pkgname=mpdris
pkgver=1.2.0
pkgrel=1
pkgdesc='A MPD client implementing the dbus MPRIS standard written in rust'
url='https://github.com/jasger9000/mpdris'
license=('MIT')
arch=('x86_64' 'i686' 'aarch64')
provides=('mpdris')
conflicts=('mpdris-bin' 'mpdris-git')
depends=('glibc' 'libgcc')
optdepends=('libsystemd: run mpdris as a service')
makedepends=('cargo')
_hash='6b0652d'
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d78530965b10e448f9c25057ac49616a982ed8fa73501f3bb0b7db95a8ee6a88')


prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export GIT_HASH=$_hash
  cargo xtask build --arch "$CARCH"
}

package() {
  depends+=('dbus' 'mpd')
  cd "$srcdir/$pkgname-$pkgver"

  cargo xtask install --pkgname "$pkgname" --arch "$CARCH" "$pkgdir"
}

# vim:set ts=2 sts=2 sw=2 et: syntax=sh
