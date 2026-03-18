# Maintainer: J. Gerhards <g1.jasger@gmail.com>
# Author: J. Gerhards <g1.jasger@gmail.com>

pkgname=mpdris-git
_pkgname=mpdris
pkgver=1.2.0.r55.g65e22f4
pkgrel=1
pkgdesc='A MPD client implementing the dbus MPRIS standard written in rust -- git version'
url='https://github.com/jasger9000/mpdris'
license=('MIT')
arch=('x86_64' 'i686' 'aarch64')
provides=("mpdris=${pkgver}")
conflicts=('mpdris')
depends=('glibc' 'libgcc')
makedepends=('cargo' 'git')
optdepends=('libsystemd: run mpdris as a service')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
  cd "$srcdir/$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo xtask build --arch "$CARCH"
}

package() {
  depends+=('dbus' 'mpd')
  cd "$srcdir/$_pkgname"

  cargo xtask install --pkgname "$pkgname" --arch "$CARCH" "$pkgdir"
}

# vim:set ts=2 sts=2 sw=2 et: syntax=sh
