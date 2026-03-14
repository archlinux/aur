# Maintainer: Laurent Carlier <lordheavym@gmail.com>
# Contributor: Jason Stryker <inbox at jasonstryker dot com>

pkgname=('wine-nine')
_tag=0.10
pkgver=0.10
pkgrel=1
pkgdesc="Gallium Nine Standalone"
arch=('x86_64')
url="https://github.com/iXit/wine-nine-standalone"
license=('LGPL2')
makedepends=('git' 'filesystem' 'lib32-mesa' 'wine' 'meson')
source=("git+${url}.git#tag=v${_tag}")
sha256sums=('9329efed6e8f8d2a73f12b9fb8ce3e65748c60dde0122cad2d4e2a3695948c36')

_backports=(7c5e71a584e359814b80cdb411e0ffe2f7ce2f86)

prepare() {
  cd wine-nine-standalone

  local _c
  for _c in "${_backports[@]}"; do
    git log --oneline -1 "${_c}"
    git cherry-pick -n "${_c}"
  done
}

pkgver() {
  cd wine-nine-standalone

  echo ${_tag}
}

build() {
  cd wine-nine-standalone
    
  ./bootstrap.sh --distro arch

  meson \
    --cross-file "tools/cross-wine64" \
    --buildtype "release" \
    --prefix "/" \
    --bindir bin \
    --libdir lib \
    "build64"
  ninja -C "build64"
  DESTDIR="${srcdir}/fakeinstall" ninja -C build64 install

  meson \
    --cross-file "tools/cross-wine32" \
    --buildtype "release" \
    --prefix "/" \
    --bindir bin32 \
    --libdir lib32 \
    "build32"
  ninja -C "build32"
  DESTDIR="${srcdir}/fakeinstall" ninja -C build32 install
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
