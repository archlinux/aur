# Maintainer: DarioTD <dario.tabares@hotmail.com>
# Contributor: Andrew Sun <adsun701@gmail.com>
# Contributor: orumin <dev@orum.in>
 
_basename=graphene
pkgname="lib32-$_basename"
pkgver=1.10.8
pkgrel=2
pkgdesc="A thin layer of graphic data types (32-bit)"
url="https://github.com/ebassi/graphene"
arch=('x86_64')
license=(MIT)
depends=('lib32-glib2' 'graphene')
makedepends=('git' 'meson')
_commit=4e2578450809c2099400cf85caf18eafcd7100aa  # tags/1.10.8^0
source=("git+https://github.com/ebassi/graphene#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $_basename
  git describe --tags | sed 's/-/+/g'
}
 
build() {
  local meson_options=(
    -D gtk_doc=false
    -D introspection=disabled
    -D tests=true
  )

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG='/usr/bin/i686-pc-linux-gnu-pkg-config'

  arch-meson $_basename build \
    --libdir=/usr/lib32 \
    --libexecdir=/usr/lib32 \
    "${meson_options[@]}"

  ninja -C build
}

check() {
  cd build
  meson test || true
}
 
package() {
  DESTDIR="$pkgdir" ninja -C build install
  rm -r "$pkgdir"/usr/{lib32,share}/installed-tests
  rm -rf ${pkgdir}/usr/{bin,share,include,lib}
}
