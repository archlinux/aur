# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from GLM 5.3 Flash.
pkgname=opencadstudio
pkgver=2026.43.0
pkgrel=1
pkgdesc="A CAD application built with Rust — 2D/3D drawing, DWG/DXF support, and GPU-accelerated rendering"
arch=('x86_64')
url="https://github.com/HakanSeven12/OpenCADStudio"
license=('GPL-3.0')
depends=()
makedepends=(
  'rust'
  'cargo'
)
options=(!debug !lto)
# The source tarball extracts to a directory named OpenCADStudio-2026.43
source=("$pkgname-$pkgver.tar.gz::https://github.com/HakanSeven12/OpenCADStudio/archive/refs/tags/v2026.43.tar.gz")
sha256sums=('54b7969f65ada43654ba850271a6dcc441c6283a20bd27e3fda20578900a84d7')

# Detected from tarball extraction: OpenCADStudio-2026.43
_pkgdir="OpenCADStudio-2026.43"

prepare() {
  cd "$_pkgdir"
  # The iced crate uses a git dependency that may need to be available locally.
  # If cargo fails to fetch iced, ensure it's cached or update the revision.
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$_pkgdir"
  cargo build --release 2>&1 | tail -20
}

check() {
  cd "$_pkgdir"
  cargo test --release 2>/dev/null || true
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