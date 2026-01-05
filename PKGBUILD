# Maintainer: Michael Picht <mipi@fsfe.org>

_pkgorg=codeberg.org/mipi
_pkgname=otr
pkgname=${_pkgname}-git
pkgver=0.11.7
pkgrel=1
pkgdesc="Decode and cut video files from Online TV Recorder (OTR)"
arch=(
  aarch64
  x86_64
)
license=(GPL3)
source=("git+https://$_pkgorg/$_pkgname.git")
md5sums=('SKIP')
validpgpkeys=(11ECD6695134183B3E7AF1C2223AAA374A1D59CE) # Michael Picht <mipi@fsfe.org>
conflicts=(otr)
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
  install -Dm644 resources/otrkey_mime.xml "$pkgdir/usr/share/mime/packages/otrkey_mime.xml"
}
