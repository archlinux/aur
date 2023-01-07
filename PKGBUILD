# Maintainer: Eric Engestrom <aur@engestrom.ch>

pkgname=hdrview
pkgver=1.7.1
pkgrel=1
pkgdesc='High dynamic range (HDR) image viewer and comparison tool'
url=https://github.com/wkjarosz/hdrview
arch=(x86_64 aarch64)
license=(BSD)
source=("$pkgname::git+$url#tag=v$pkgver")
sha256sums=('SKIP')
makedepends=(git cmake ninja)
depends=(hicolor-icon-theme libglvnd zlib)

build() {
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
   cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  # Fixup desktop file
  sed \
    -e 's/Exec=hdrview/Exec=HDRView/' \
    -e 's/Icon=hdrview.png/Icon=hdrview/' \
    -i "$pkgdir"/usr/share/applications/hdrview.desktop

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
