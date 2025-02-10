# Maintainer:
# Contributor: Gryffyn

_pkgname="glew1.13"
pkgname="$_pkgname"
pkgver=1.13.0
pkgrel=5
pkgdesc='A cross-platform C/C++ extension loading library'
url='https://glew.sourceforge.net'
license=('BSD-3-Clause')
arch=('x86_64')

depends=(
  libgl
)

_pkgsrc="glew-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"https://downloads.sourceforge.net/glew/$_pkgsrc.tgz")
sha256sums=('aa25dc48ed84b0b64b8d41cdd42c8f40f149c37fa2ffa39cd97f42c78d128bc7')

prepare() {
  cd "$_pkgsrc"
  sed -i 's|lib64|lib|' config/Makefile.linux
}

build() {
  cd "$_pkgsrc"
  make
}

package() {
  cd "$_pkgsrc"
  local _make_options=(
    GLEW_DEST="$pkgdir/usr/lib/$_pkgname"
    BINDIR="$pkgdir/usr/lib/$_pkgname"
    LIBDIR="$pkgdir/usr/lib/$_pkgname"
    INCDIR="$pkgdir/usr/include/$_pkgname"
  )

  make "${_make_options[@]}" install.all

  for i in "$pkgdir/usr/lib/glew1.13"/*.so.1*; do
    ln -rs "$i" "$pkgdir/usr/lib/"
  done

  # license
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
