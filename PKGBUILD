# SPDX-FileCopyrightText: 2026 Michael Picht <mipi@fsfe.org>
#
# SPDX-License-Identifier: GPL-3.0-or-later

# Maintainer: Michael Picht <mipi@fsfe.org>

_pkgorg=codeberg.org/mipi
pkgname=gnome-backup
pkgver=0.1.0
pkgrel=3
pkgdesc="Backup and restore GNOME settings and shell extensions"
arch=(
  x86_64
)
license=(GPL3)
source=("https://${_pkgorg}/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('ec82348c57af9d9085e1cabc031b40446baef1db7ef93ff423d066c80a1d834a')
validpgpkeys=(11ECD6695134183B3E7AF1C2223AAA374A1D59CE) # Michael Picht <mipi@fsfe.org>
depends=(
  dconf
)
makedepends=(
  bash
  cargo
  git
  make
  perl
)
options=(
  !debug
  !lto
)

prepare() {
  cd "${pkgname}" || return
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"  
}

build() {
  cd "${pkgname}" || return
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  make BUILD_FLAGS="--frozen"
}

package() {
  cd "${pkgname}" || return
  make DESTDIR="$pkgdir" install
}
