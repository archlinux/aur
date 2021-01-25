# Maintainer: Christoph Brill <aur@christophbrill.de>

pkgbase=atkmm236
pkgname=(atkmm236 atkmm236-docs)
pkgver=2.36.0
pkgrel=1
pkgdesc="C++ bindings for ATK"
url="https://www.gtkmm.org/"
arch=(x86_64)
license=(LGPL)
depends=(atk glibmm268)
makedepends=(git mm-common glibmm268-docs meson)
options=(!emptydirs)
_commit=f48b96d15452de003dd05a4bed6e17742cc977e8  # tags/2.36.0^0
source=("git+https://gitlab.gnome.org/GNOME/atkmm.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd atkmm
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd atkmm
}

build() {
  arch-meson atkmm build -D maintainer-mode=true
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package_atkmm236() {
  DESTDIR="$pkgdir" meson install -C build

  mkdir -p docs/usr/share
  mv "$pkgdir"/usr/share/{devhelp,doc} docs/usr/share
}

package_atkmm236-docs() {
  pkgdesc+=" (documentation)"
  depends=()
  options=(!strip)

  mv docs/* "$pkgdir"
}
