# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: orumin <dev@orum.in>
 
_basename=graphene
pkgname="lib32-$_basename"
pkgver=1.10.0
pkgrel=1
pkgdesc="A thin layer of graphic data types (32-bit)"
url="https://github.com/ebassi/graphene"
arch=('x86_64')
license=(MIT)
depends=('lib32-glib2' 'graphene')
makedepends=('git' 'gobject-introspection' 'gtk-doc' 'meson')
_commit=6099dbb39ff8de20f37c8ca6e951203a810c1649  # tags/1.10.0^0
source=("git+https://github.com/ebassi/graphene#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $_basename
  git describe --tags | sed 's/-/+/g'
}
 
build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  arch-meson $_basename build --libdir='/usr/lib32' -D gtk_doc=true
  ninja -C build
}

check() {
  cd build
  meson test || true
}
 
package() {
  DESTDIR="$pkgdir" ninja -C build install
  rm -r "$pkgdir"/usr/{lib,share}/installed-tests
  rm -rf ${pkgdir}/usr/{bin,share,include,lib}
}
