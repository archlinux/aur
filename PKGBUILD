# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: ksj <podhorsky.ksj@gmail.com>
# Contributor: yochananmarqos <mark -dot- wagie -at- proton -dot- me>

_pkgname=geany
pkgname=$_pkgname-git
pkgver=2.0.0.r412.g6a266bff0
pkgrel=1
pkgdesc='Fast and lightweight IDE (git version)'
arch=(x86_64)
url='https://www.geany.org/'
license=(GPL-2.0-or-later)
depends=(at-spi2-core cairo gcc-libs gdk-pixbuf2 glib2 glibc
         hicolor-icon-theme gtk3 pango python)
makedepends=(doxygen git gtk-doc meson python-docutils python-lxml vte3)
optdepends=(
  'geany-plugins: additional functionality'
  'vte3: enbedded terminal support'
)
provides=($_pkgname)
conflicts=($_pkgname geany-themes)
source=("$_pkgname::git+https://github.com/$_pkgname/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  test -d $_pkgname-build && extra_opts="--reconfigure"
  arch-meson $_pkgname $_pkgname-build \
    -Dhtml-docs=enabled \
    -Dpdf-docs=disabled \
    -Dplugins=true \
    -Dapi-docs=enabled \
    -Dgtkdoc=true \
    -Dvte=true \
    -Dmac-integration=disabled \
    $extra_opts
  meson compile -C $_pkgname-build
}

check() {
  export NO_AT_BRIDGE=1
  meson test -C $_pkgname-build --print-errorlogs
}

package() {
  depends+=(libatk-1.0.so libcairo.so libgdk_pixbuf-2.0.so libgio-2.0.so
            libglib-2.0.so libgmodule-2.0.so libgobject-2.0.so libgtk-3.so
            libpango-1.0.so libpangocairo-1.0.so)
  meson install -C $_pkgname-build --destdir "$pkgdir"
  mv "$pkgdir"/usr/share/doc/$_pkgname "$pkgdir"/usr/share/doc/$pkgname
}
