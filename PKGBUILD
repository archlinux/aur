# Maintainer: kotontrion <kotontrion@tutanota.de>
pkgbase=libastal-git
pkgname=('libastal-git' 'python-libastal-git')
_pkgname=libastal
pkgver=r3.5f41c07
pkgrel=1
pkgdesc="Building blocks for building desktop shells."
arch=('x86_64')
license=('GPL-3')
provides=(libastal libastal.so=0-64)
url="https://github.com/astal-sh/libastal"
makedepends=('git' 'gobject-introspection' 'meson' 'vala' 'python-poetry' 'python-build' 'python-installer')
depends=('glib2' 'glibc' 'gtk3' 'gtk-layer-shell')
source=("git+${url}")
sha256sums=('SKIP')

pkgver(){
  cd $srcdir/$_pkgname
  # git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd $srcdir/$_pkgname
  arch-meson build
  meson compile -C build

  cd python
  python -m build --wheel --no-isolation
}

package_libastal-git() {
  cd $srcdir/$_pkgname
  meson install -C build --destdir "$pkgdir"
}

package_python-libastal-git() {
  depends=('libastal-git' 'python' 'python-gobject')
  pkgdesc="python bindings for libstal."
  cd $srcdir/$_pkgname/python
  python -m installer --destdir="$pkgdir" dist/*.whl
}
