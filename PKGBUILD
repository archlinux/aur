

# Maintainer: Chris Novoa <dev@chrisnovoa.com>

pkgname=budgie-applications-menu-git
pkgver=2.5.0.r304.gbb9e384
pkgrel=1

pkgdesc="ElementaryOS (Pantheon) applications-menu fork for budgie-panel. Standalone from package budgie-extras."
url="https://github.com/UbuntuBudgie/applications-menu"

arch=('any')
license=('GPL3')
depends=('budgie-desktop') 

makedepends=('git' 'gobject-introspection' 'meson' 'ninja' 'vala')


provides=(budgie-applications-menu)
conflicts=(budgie-applications-menu budgie-extras)


source=("budgie-extras::git+https://github.com/UbuntuBudgie/budgie-extras")
sha256sums=('SKIP')


prepare() {
  cd "$srcdir/budgie-extras"
  git submodule init
  git submodule update
}
pkgver() {
  cd "$srcdir/budgie-extras/budgie-applications-menu/applications-menu"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
build() {
  arch-meson $srcdir/budgie-extras/budgie-applications-menu/applications-menu build \
    -D b_pie=false \
    -D with-unity=false
  ninja -C build
}
package() {
  DESTDIR="${pkgdir}" meson install -C build
}


