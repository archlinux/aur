# SPDX-FileCopyrightText: 2026 Michael Picht <mipi@fsfe.org>
#
# SPDX-License-Identifier: GPL-3.0-or-later

# Maintainer: Michael Picht <mipi@fsfe.org>

_pkgorg=codeberg.org/mipi
pkgname=gnome-backup
pkgver=0.2.0
pkgrel=1
pkgdesc="Backup and restore GNOME settings and shell extensions"
arch=(
  x86_64
)
url="https://${_pkgorg}/${pkgname}/"
license=(GPL-3.0-or-later)
source=("https://${_pkgorg}/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('d5bc5c271ad1efc7b20c667eaeb4aaa68f87c1b9d0e2bd82d0ccdc2cccfbf1bf')
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
