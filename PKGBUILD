# Maintainer: Kaleb <vitor.guttler@edu.pucrs.br>

pkgname=kicad-library-espressif-git
_repo=kicad-libraries
pkgver=3.0.3.r1.g93d7c10
pkgrel=1
pkgdesc="KiCad libraries for Espressif chips and modules (symbols, footprints and 3D models)"
arch=('any')
url="https://github.com/espressif/${_repo}"
license=('CC-BY-SA-4.0')
depends=('kicad')
makedepends=('git')
provides=('kicad-library-espressif')
conflicts=('kicad-library-espressif')
source=(
  "git+https://github.com/espressif/${_repo}.git"
  "kicad-espressif-register"
  "kicad-library-espressif.install"
)
md5sums=('SKIP' 'SKIP' 'SKIP')
install='kicad-library-espressif.install'

pkgver() {
  cd "$srcdir/${_repo}"
  # v3.0.3-4-gabcdef12 -> 3.0.3.r4.gabcdef12
  git describe --tags --long 2>/dev/null \
    | sed 's/^v//' \
    | sed 's/-/.r/' \
    | sed 's/-/./'
}

build() {
  : # data only
}

package() {
  cd "$srcdir/${_repo}"

  local dest_base="$pkgdir/usr/share/kicad/espressif"

  # Symbols
  install -d "$dest_base/symbols"
  find symbols -maxdepth 1 -type f -name '*.kicad_sym' -print0 2>/dev/null \
    | xargs -0 -r -I '{}' install -m644 '{}' "$dest_base/symbols/"

  # Footprints (.pretty)
  install -d "$dest_base/footprints"
  find footprints -maxdepth 1 -type d -name '*.pretty' -print0 2>/dev/null \
    | xargs -0 -r -I '{}' cp -r '{}' "$dest_base/footprints/"

  # 3D models (.3dshapes)
  install -d "$dest_base/3dmodels"
  find 3dmodels -maxdepth 1 -type d -name '*.3dshapes' -print0 2>/dev/null \
    | xargs -0 -r -I '{}' cp -r '{}' "$dest_base/3dmodels/"

  # License + README
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md  "$pkgdir/usr/share/doc/$pkgname/README.md"

  # Helper script
  install -Dm755 "$srcdir/kicad-espressif-register" \
    "$pkgdir/usr/bin/kicad-espressif-register"
}
