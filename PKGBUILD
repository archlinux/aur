# Maintainer: Michael Picht <mipi@fsfe.org>

_pkgorg=codeberg.org/mipi
pkgname=otr
pkgver=0.11.7
pkgrel=2
pkgdesc="Decode and cut video files from Online TV Recorder (OTR)"
arch=(
  aarch64
  x86_64
)
license=(GPL3)
source=("https://${_pkgorg}/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('84ca52687f8c7145a4c00ccb66e01967838d291e92d75807d50943f626588c12')
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
