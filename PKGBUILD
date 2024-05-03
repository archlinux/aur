# Maintainer: Michael Picht <mipi@fsfe.org>

_pkgorg=gitlab.com/mipimipi
pkgname=otr
pkgver=0.10.2
pkgrel=1
pkgdesc="Decode and cut video files from Online TV Recorder (OTR)"
arch=(
  aarch64
  x86_64
)
url="https://$_pkgorg/$pkgname"
license=(GPL3)
source=("https://${_pkgorg}/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('f8a98e98d8e6daec88fb7e2a541d0855f9cabecb3920b871ae893396b858c42f')
validpgpkeys=(11ECD6695134183B3E7AF1C2223AAA374A1D59CE) # Michael Picht <mipi@fsfe.org>
conflicts=(otr-git)
depends=(
  ffmpeg
  ffms2
)
makedepends=(
  bash
  cargo
  clang
  ffms2
  git
  make
)
options=(
  !debug
)

prepare() {
  cd "${pkgname}-v${pkgver}" || return
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"  
}

build() {
  cd "${pkgname}-v${pkgver}" || return
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  make BUILD_FLAGS="--frozen"
}

package() {
  cd "${pkgname}-v${pkgver}" || return
  make DESTDIR="$pkgdir" install
  install -Dm644 resources/otr.desktop "$pkgdir/usr/share/applications/otr.desktop"
  install -Dm644 resources/otrkey_mime.xml "$pkgdir/usr/share/mime/packages/otrkey_mime.xml"
}
