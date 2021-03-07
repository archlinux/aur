# Maintainer: Christoph Brill <aur@christophbrill.de>

pkgbase=gtkmm4
pkgname=(gtkmm4 gtkmm4-docs)
pkgver=4.0.1
pkgrel=1
pkgdesc="C++ bindings for GTK+ 4"
url="https://www.gtkmm.org/"
arch=(x86_64)
license=(LGPL)
depends=(gtk4 glibmm268 cairomm16 pangomm248 atkmm236)
makedepends=(git mm-common glibmm268-docs cairomm16-docs pangomm248-docs atkmm236-docs meson)
checkdepends=(xorg-server-xvfb)
options=(!emptydirs)
_commit=22dd11de529a0cb09568d8432dd58cfd8693163f  # tags/4.0.1^0
source=("git+https://gitlab.gnome.org/GNOME/gtkmm.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd gtkmm
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd gtkmm
}

build() {
  arch-meson gtkmm build -D maintainer-mode=true
  meson compile -C build
}

check() {
  xvfb-run -s '-nolisten local' \
    meson test -C build --print-errorlogs
}

package_gtkmm4() {
  DESTDIR="$pkgdir" meson install -C build

  mkdir -p docs/usr/share
  mv "$pkgdir"/usr/share/{devhelp,doc} docs/usr/share
}

package_gtkmm4-docs() {
  pkgdesc+=" (documentation)"
  depends=()
  options=(!strip)

  mv docs/* "$pkgdir"
}
