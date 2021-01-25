# Maintainer: Christoph Brill <aur@christophbrill.de>

pkgbase=pangomm248
pkgname=(pangomm248 pangomm248-docs)
pkgver=2.48.0
pkgrel=1
pkgdesc="C++ bindings for Pango"
url="https://www.gtkmm.org/"
arch=(x86_64)
license=(LGPL)
depends=(pango glibmm268 cairomm16)
makedepends=(git mm-common glibmm268-docs cairomm16-docs meson)
options=(!emptydirs)
_commit=66ad68dad23957a7207668bd1a232b7aa8773f42  # tags/2.48.0^0
source=("git+https://gitlab.gnome.org/GNOME/pangomm.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd pangomm
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd pangomm
}

build() {
  arch-meson pangomm build -D maintainer-mode=true
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package_pangomm248() {
  DESTDIR="$pkgdir" meson install -C build

  mkdir -p docs/usr/share
  mv "$pkgdir"/usr/share/{devhelp,doc} docs/usr/share
}

package_pangomm248-docs() {
  pkgdesc+=" (documentation)"
  depends=()
  options=(!strip)

  mv docs/* "$pkgdir"
}
