# Maintainer: Eric Engestrom <aur@engestrom.ch>
# Contributor: Afnan Enayet <afnan at afnan.io>

_pkgname=hdrview
pkgname=$_pkgname-git
pkgver=1.8.0
pkgrel=1
pkgdesc='High dynamic range (HDR) image viewer and comparison tool'
url='https://github.com/wkjarosz/hdrview'
arch=(x86_64)
license=(BSD)
makedepends=(git cmake ninja)
depends=(hicolor-icon-theme libglvnd zlib libx{i,randr,inerama,cursor})
source=("$pkgname::git+$url")
sha256sums=('SKIP')
provides=(hdrview)
conflicts=(hdrview)

pkgver() {
  git -C $pkgname describe --tags --abbrev=10 | sed 's/^v//; s/-/+/; s/-/./'
}

prepare() {
  # Run cmake in `prepare()` since it will download stuff.
  cmake -S $pkgname -B build \
    -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DFETCHCONTENT_QUIET=OFF \
    -DIMATH_INSTALL_PKG_CONFIG=OFF \
    -DIMATH_INSTALL_SYM_LINK=OFF \
    -DOPENEXR_INSTALL=OFF \
    -DOPENEXR_INSTALL_PKG_CONFIG=OFF \
    -DOPENEXR_INSTALL_TOOLS=OFF
}

build() {
   cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  # Project installs a copy of its own deps as well
  for dep in Imath
  do
    rm -r "$pkgdir"/usr/include/$dep/
    rm -r "$pkgdir"/usr/lib/cmake/$dep/
    rm    "$pkgdir"/usr/lib/lib$dep*.a
  done

  # Raise an error in case there's every anything else added (either
  # a new dep, or the project starts shipping libs)
  rmdir "$pkgdir"/usr/include/
  rmdir "$pkgdir"/usr/lib/cmake/
  rmdir "$pkgdir"/usr/lib/
}
