# SPDX-FileCopyrightText: 2023-2026 Michael Picht <mipi@fsfe.org>
#
# SPDX-License-Identifier: GPL-3.0-or-later

# Maintainer: Michael Picht <mipi@fsfe.org>

_pkgorg=codeberg.org/mipi
_pkgname=otr
pkgname=${_pkgname}-git
pkgver=0.12.0.r0.gfb78a4d
pkgrel=1
pkgdesc="Decode and cut video files from Online TV Recorder (OTR)"
arch=(
  aarch64
  x86_64
)
url="https://${_pkgorg}/${_pkgname}/"
license=(MPL-2.0)
source=("git+https://$_pkgorg/$_pkgname.git")
md5sums=('SKIP')
conflicts=(otr)
depends=(
  ffmpeg
  ffms2
  openssl
)
makedepends=(
  bash
  cargo
  git
  make
  pkgconf
)
options=(
  !debug
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
  install -Dm644 resources/otr.desktop "$pkgdir/usr/share/applications/otr.desktop"
  install -Dm644 resources/otr_mime.xml "$pkgdir/usr/share/mime/packages/otr_mime.xml"
}
