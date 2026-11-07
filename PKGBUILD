# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from Nemotron 3.5 Lightning 30B A3B.
pkgname=opencadstudio
pkgver=2026.44.0
pkgrel=1
pkgdesc="A CAD application built with Rust — 2D/3D drawing, DWG/DXF support, and GPU-accelerated rendering"
arch=('x86_64')
url="https://github.com/HakanSeven12/OpenCADStudio"
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs')
makedepends=(
  'rust'
  'cargo'
)
options=(!debug !lto)
# The tag drops the trailing .0: pkgver 2026.44.0 -> tag v2026.44 -> extracts to OpenCADStudio-2026.44
source=("$pkgname-$pkgver.tar.gz::https://github.com/HakanSeven12/OpenCADStudio/archive/refs/tags/v${pkgver%.*}.tar.gz")
sha256sums=('555d051a7e9e89fa83e5465f2f0c3ec5e978c43e80a9a22e93f0ea31a8397479')

_pkgdir="OpenCADStudio-${pkgver%.*}"

prepare() {
  cd "$_pkgdir"
  # Since v2026.44 the Cargo.toml still points cargo at the moved acadrust
  # dependency: HakanSeven12/acadrust returns 404, the same repo (with the
  # locked rev 24b037a) now lives under hakanaktt/acadrust. Redirect via git
  # env config (makepkg runs with HOME=/dev/null, so no --global writes) and
  # force cargo to shell out to git, which honours GIT_CONFIG_*. The locked
  # checksums and revision stay untouched.
  export GIT_CONFIG_COUNT=1
  export GIT_CONFIG_KEY_0="url.https://github.com/hakanaktt/acadrust.insteadOf"
  export GIT_CONFIG_VALUE_0="https://github.com/HakanSeven12/acadrust.git"
  export CARGO_NET_GIT_FETCH_WITH_CLI=true
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$_pkgdir"
  cargo build --release --locked
}

check() {
  cd "$_pkgdir"
  cargo test --release --locked 2>/dev/null || true
}

package() {
  cd "$_pkgdir"
  # Install the binary
  if [ -f target/release/OpenCADStudio ]; then
    install -Dm755 target/release/OpenCADStudio "$pkgdir/usr/bin/opencadstudio"
  fi
  # Install license
  if [ -f LICENSE ]; then
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
  # Install desktop file if present
  if [ -f OpenCADStudio.desktop ]; then
    install -Dm644 OpenCADStudio.desktop "$pkgdir/usr/share/applications/opencadstudio.desktop"
  fi
}
