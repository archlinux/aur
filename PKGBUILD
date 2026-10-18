# SPDX-FileCopyrightText: 2026 Michael Picht <mipi@fsfe.org>
#
# SPDX-License-Identifier: GPL-3.0-or-later

# Maintainer: Michael Picht <mipi@fsfe.org>

_pkgorg=codeberg.org/mipi
pkgname=bwaudit
pkgver=0.1.0
pkgrel=1
pkgdesc="Checks the passwords of a Bitwarden vault for compromise (Have I Been Pwned) and reuse"
arch=(
  aarch64
  x86_64
)
url="https://${_pkgorg}/${pkgname}/"
license=(GPL-3.0-or-later)
source=("${pkgname}-${pkgver}.tar.gz::https://${_pkgorg}/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('6a832c3dbd0dcbd0465fcb997b04e1202e0b456333b74355460c00b4205324b6')
conflicts=(bwaudit-git)
optdepends=(
  'bitwarden-cli: read the vault directly via bw instead of --input'
)
makedepends=(
  cargo
  make
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
