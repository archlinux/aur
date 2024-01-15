# Maintainer: Michael Picht <mipi@fsfe.org>

_pkgorg=gitlab.com/mipimipi
pkgname=otr
pkgver=0.7.1
pkgrel=1
pkgdesc="Decode and cut video files from Online TV Recorder (OTR)"
arch=(
  aarch64
  x86_64
)
url="https://$_pkgorg/$pkgname"
license=(GPL3)
source=("https://${_pkgorg}/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('085ccb27bddb7f6cae0b6243d047326a9088fcef81066e139e81e1cc6b4580a1')
validpgpkeys=(11ECD6695134183B3E7AF1C2223AAA374A1D59CE) # Michael Picht <mipi@fsfe.org>
conflicts=(otr-git)
depends=(mkvtoolnix-cli)
makedepends=(  
  git
  cargo
)

prepare() {
  cd "${pkgname}-v${pkgver}" || return
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${pkgname}-v${pkgver}" || return
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "${pkgname}-v${pkgver}" || return
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm644 resources/otr.desktop "$pkgdir/usr/share/applications/otr.desktop"
  install -Dm644 resources/otrkey_mime.xml "$pkgdir/usr/share/mime/packages/otrkey_mime.xml"
}
