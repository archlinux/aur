# Maintainer: Christoph Brill <aur@christophbrill.de>
# Contributors:
# beedaddy <martin@brodbeck-online.de>

pkgbase=glibmm268
pkgname=(glibmm268 glibmm268-docs)
pkgver=2.68.0
pkgrel=2
pkgdesc="C++ bindings for GLib"
url="https://www.gtkmm.org/"
arch=(x86_64)
license=(LGPL)
depends=(glib2 libsigc++3)
makedepends=(git mm-common perl-xml-parser clang meson)
checkdepends=(glib-networking)
options=(!emptydirs)
_commit=d9f2c206de7f91efec783ed389481037e80c62b0  # tags/2.68.0^0
source=("git+https://gitlab.gnome.org/GNOME/glibmm.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd glibmm
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd glibmm
}

build() {
  arch-meson glibmm build -D maintainer-mode=true
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package_glibmm268() {
  DESTDIR="$pkgdir" meson install -C build

  mkdir -p docs/usr/share
  mv "$pkgdir"/usr/share/{devhelp,doc} docs/usr/share
}

package_glibmm268-docs() {
  pkgdesc+=" (documentation)"
  depends=()
  options=(!strip)

  mv docs/* "$pkgdir"
}
