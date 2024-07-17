# Maintainer:

_pkgname="python-cairo"
pkgname="$_pkgname-git"
pkgver=1.26.1.r1.g176a1a6
pkgrel=1
pkgdesc="Python bindings for the cairo graphics library"
url="https://github.com/pygobject/pycairo"
license=('LGPL-2.1-only')
arch=('x86_64')

depends=(
  'cairo'
  'python'
)
makedepends=(
  'git'
  'meson'
  'python-sphinx'
  'python-sphinx_rtd_theme'
)
checkdepends=('python-pytest')

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+https://github.com/pygobject/pycairo.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  arch-meson "$_pkgsrc" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir="$pkgdir"

  # compile Python bytecode
  python -m compileall -d /usr/lib "$pkgdir/usr/lib"
  python -O -m compileall -d /usr/lib "$pkgdir/usr/lib"
}
