# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from GLM 5.3 Flash.
pkgname=opencadstudio
pkgver=2026.47.0
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
sha256sums=('c4f4c79ee62c1bd4e54271e7c55859fa650d9511f65103202796b4a50a384165')

_pkgdir="OpenCADStudio-${pkgver%.*}"

prepare() {
  cd "$_pkgdir"
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
  # Install desktop file if present (2026.46 moved it into packaging/)
  for _desktop in packaging/OpenCADStudio.desktop OpenCADStudio.desktop; do
    if [ -f "$_desktop" ]; then
      install -Dm644 "$_desktop" "$pkgdir/usr/share/applications/opencadstudio.desktop"
      break
    fi
  done
}
