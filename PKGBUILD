# SPDX-FileCopyrightText: 2026 Michael Picht <mipi@fsfe.org>
#
# SPDX-License-Identifier: GPL-3.0-or-later

# Maintainer: Michael Picht <mipi@fsfe.org>

_pkgorg=codeberg.org/mipi
_pkgname=gnome-backup
pkgname=${_pkgname}-git
pkgver=0.2.0.r0.g8e6106d
pkgrel=1
pkgdesc="Backup and restore GNOME settings and shell extensions"
arch=(
  x86_64
)
url="https://${_pkgorg}/${_pkgname}/"
license=(GPL-3.0-or-later)
source=("git+https://$_pkgorg/$_pkgname.git")
md5sums=('SKIP')
provides=(gnome-backup)
conflicts=(gnome-backup)
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
