# SPDX-FileCopyrightText: 2023-2026 Michael Picht <mipi@fsfe.org>
#
# SPDX-License-Identifier: GPL-3.0-or-later

# Maintainer: Michael Picht <mipi@fsfe.org>

_pkgorg=codeberg.org/mipi
pkgname=otr
pkgver=0.11.11
pkgrel=2
pkgdesc="Decode and cut video files from Online TV Recorder (OTR)"
arch=(
  aarch64
  x86_64
)
license=(GPL3)
#source=("https://${_pkgorg}/${pkgname}/archive/${pkgver}.tar.gz")
source=("${pkgname}-${pkgver}.tar.gz::https://${_pkgorg}/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('c23cbf1114822bb509cff884737f1b2dd208911ebb683688ec2ae519e2cb326b')
validpgpkeys=(11ECD6695134183B3E7AF1C2223AAA374A1D59CE) # Michael Picht <mipi@fsfe.org>
conflicts=(otr-git)
depends=(
  ffmpeg
  ffms2
)
makedepends=(
  bash
  cargo
  git
  make
)
options=(
  !debug
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
  install -Dm644 resources/otr.desktop "$pkgdir/usr/share/applications/otr.desktop"
  install -Dm644 resources/otrkey_mime.xml "$pkgdir/usr/share/mime/packages/otrkey_mime.xml"
}
