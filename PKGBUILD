# SPDX-FileCopyrightText: 2026 Michael Picht <mipi@fsfe.org>
#
# SPDX-License-Identifier: GPL-3.0-or-later

# Maintainer: Michael Picht <mipi@fsfe.org>

_pkgorg=codeberg.org/mipi
_pkgname=bwaudit
pkgname=${_pkgname}-git
pkgver=0.1.0.r1.g3164db4
pkgrel=1
pkgdesc="Checks the passwords of a Bitwarden vault for compromise (Have I Been Pwned) and reuse"
arch=(
  aarch64
  x86_64
)
url="https://${_pkgorg}/${_pkgname}/"
license=(GPL-3.0-or-later)
source=("git+https://$_pkgorg/$_pkgname.git")
md5sums=('SKIP')
provides=(bwaudit)
conflicts=(bwaudit)
optdepends=(
  'bitwarden-cli: read the vault directly via bw instead of --input'
)
makedepends=(
  cargo
  git
  make
)
options=(
  !debug
  !lto
)

pkgver() {
  cd "$_pkgname" || return
  (
    set -o pipefail
    git describe --tags --long 2>/dev/null |
      sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//' |
      tr -d '\n' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$_pkgname" || return
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname" || return
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  make BUILD_FLAGS="--frozen"
}

package() {
  cd "$_pkgname" || return
  make DESTDIR="$pkgdir" install
}
