# Maintainer: Eric Engestrom <aur@engestrom.ch>
# Contributor: Afnan Enayet <afnan at afnan.io>

_pkgname=hdrview
pkgname=$_pkgname-git
pkgver=1.7.1
pkgrel=1
pkgdesc='High dynamic range (HDR) image viewer and comparison tool'
url='https://github.com/wkjarosz/hdrview'
arch=(x86_64)
license=(BSD)
makedepends=(git cmake ninja)
depends=(zlib)
source=("git+$url")
sha256sums=('SKIP')
provides=(hdrview)
conflicts=(hdrview)

pkgver() {
  git -C $_pkgname describe --tags --abbrev=10 | sed 's/^v//; s/-/+/; s/-/./'
}

build() {
  cmake -S $_pkgname -B build \
    -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
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
  for dep in Imath OpenEXR
  do
    rm -r "$pkgdir"/usr/include/$dep/
    rm -r "$pkgdir"/usr/lib/cmake/$dep/
    rm    "$pkgdir"/usr/lib/pkgconfig/$dep.pc
  done

  # These don't have a filename trivially derived from the dep name, but
  # the project doesn't have any static lib of its own so let's just
  # blindly remove any.
  rm "$pkgdir"/usr/lib/lib*.a

  # Raise an error in case there's every anything else added (either
  # a new dep, or the project starts shipping libs)
  rmdir "$pkgdir"/usr/include/
  rmdir "$pkgdir"/usr/lib/cmake/
  rmdir "$pkgdir"/usr/lib/pkgconfig/
  rmdir "$pkgdir"/usr/lib/
}
