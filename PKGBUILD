# Maintainer:
# Contributor: Jason Stryker <inbox at jasonstryker dot com>
# Contributor: Adrià Cereto i Massagué <ssorgatem at gmail.com>

_pkgname="gallium-nine"
pkgname="$_pkgname-git"
pkgver=0.9.r8.g95e0da4
pkgrel=1
pkgdesc="Gallium Nine Standalone"
url="https://github.com/iXit/wine-nine-standalone"
license=('LGPL-2.1-or-later')
arch=('x86_64')

makedepends=(
  'git'
  'lib32-mesa'
  'meson'
  'wine'
)

provides=(
  "$_pkgname=${pkgver%%.r*}"
  "wine-nine=${pkgver%%.r*}"
)
conflicts=(
  "$_pkgname"
  "wine-nine"
)

_pkgsrc="ixit.gallium-nine"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgsrc"

  ./bootstrap.sh --distro arch

  meson \
    --cross-file "tools/cross-wine64" \
    --buildtype "release" \
    --prefix "/" \
    --bindir bin \
    --libdir lib \
    "build64"

  ninja -C "build64"
  DESTDIR="$srcdir/fakeinstall" ninja -C build64 install

  meson \
    --cross-file "tools/cross-wine32" \
    --buildtype "release" \
    --prefix "/" \
    --bindir bin32 \
    --libdir lib32 \
    "build32"

  ninja -C "build32"
  DESTDIR="$srcdir/fakeinstall" ninja -C build32 install
}

package() {
  depends=('lib32-mesa' 'wine')

  install -m 755 -d "${pkgdir}"/usr/lib{,32}/wine/{x86_64-{unix,windows},i386-{unix,windows}}

  install -m 755 "${srcdir}/fakeinstall"/bin/ninewinecfg.exe.so "${pkgdir}"/usr/lib/wine/x86_64-unix/ninewinecfg.exe.so
  install -m 755 "${srcdir}/fakeinstall"/bin/ninewinecfg.exe.fake "${pkgdir}"/usr/lib/wine/x86_64-windows/ninewinecfg.exe

  install -m 755 "${srcdir}/fakeinstall"/bin32/ninewinecfg.exe.so "${pkgdir}"/usr/lib32/wine/i386-unix/ninewinecfg.exe.so
  install -m 755 "${srcdir}/fakeinstall"/bin32/ninewinecfg.exe.fake "${pkgdir}"/usr/lib32/wine/i386-windows/ninewinecfg.exe

  install -m 755 "${srcdir}/fakeinstall"/lib/d3d9-nine.dll.so "${pkgdir}"/usr/lib/wine/x86_64-unix/d3d9-nine.dll.so
  install -m 755 "${srcdir}/fakeinstall"/lib/d3d9-nine.dll.fake "${pkgdir}"/usr/lib/wine/x86_64-windows/d3d9-nine.dll

  install -m 755 "${srcdir}/fakeinstall"/lib32/d3d9-nine.dll.so "${pkgdir}"/usr/lib32/wine/i386-unix/d3d9-nine.dll.so
  install -m 755 "${srcdir}/fakeinstall"/lib32/d3d9-nine.dll.fake "${pkgdir}"/usr/lib32/wine/i386-windows/d3d9-nine.dll
}
