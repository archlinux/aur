# SPDX-FileCopyrightText: 2023-2026 Michael Picht <mipi@fsfe.org>
#
# SPDX-License-Identifier: GPL-3.0-or-later

# Maintainer: Michael Picht <mipi@fsfe.org>

_pkgorg=codeberg.org/mipi
pkgname=otr
pkgver=0.12.0
pkgrel=2
pkgdesc="Decode and cut video files from Online TV Recorder (OTR)"
arch=(
  aarch64
  x86_64
)
url="https://${_pkgorg}/${pkgname}/"
license=(MPL-2.0)
#source=("https://${_pkgorg}/${pkgname}/archive/${pkgver}.tar.gz")
source=("${pkgname}-${pkgver}.tar.gz::https://${_pkgorg}/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('3d0404638aa4370bc6786b2004a698c926fa09cfe97236a343fb8fbc4e18a70c')
conflicts=(otr-git)
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
  install -Dm644 resources/otr_mime.xml "$pkgdir/usr/share/mime/packages/otr_mime.xml"
}
