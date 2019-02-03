# Based on wine PKGBUILD

pkgname=wine-nine
winever=4.0
ninever=0.2
pkgver=$winever.$ninever
pkgrel=1
source=("https://github.com/iXit/wine-nine-standalone/archive/v${ninever}.tar.gz")
sha1sums=('e1ef2e2f00ec84f6a4a4e7f5a38a9f2c92ffff4a')

pkgdesc="Wine nine libraries to be used with Wine 3.x"
url="https://github.com/iXit/wine-nine-standalone"
arch=(x86_64)
options=(staticlibs)
license=(LGPL)
depends=(
  mesa
)
makedepends=(autoconf ncurses bison perl flex
  gcc wine
  libx11   lib32-libx11
  libxext  lib32-libxext
  libxcb   lib32-libxcb
)

makedepends=(${makedepends[@]} ${depends[@]})
install=wine-nine.install

build()
{
  cd "$srcdir/wine-nine-standalone-${ninever}"
  rm build{32,64} -rf
  rm fakeinstall{32,64} -rf
  #./release.sh
  ./bootstrap.sh
  msg "Building 64b"
  meson \
         --cross-file "tools/cross-wine64" \
         --buildtype "release" \
         --prefix "/usr" \
         --bindir bin64 \
         --libdir lib64 \
         $MESONARGS \
         "${srcdir}/build64"
  ninja -C "${srcdir}/build64"
  DESTDIR="${srcdir}/fakeinstall64" ninja -C "${srcdir}/build64" install
  echo "wine64 /usr/lib/wine/fakedlls/ninewinecfg.exe" > "${srcdir}/fakeinstall64/usr/bin64/ninewinecfg"
  msg "Building 32b"
  meson \
           --cross-file "tools/cross-wine32" \
           --buildtype "release" \
           --prefix "/usr" \
           --bindir bin32 \
           --libdir lib32 \
           $MESONARGS \
           "${srcdir}/build32"
  ninja -C "${srcdir}/build32"
  DESTDIR="${srcdir}/fakeinstall32" ninja -C "${srcdir}/build32" install
  echo "wine /usr/lib32/wine/fakedlls/ninewinecfg.exe" > "${srcdir}/fakeinstall32/usr/bin32/ninewinecfg"

}

package()
{
  #64 bits
  install -d "$pkgdir/usr/bin/"
  install -m755 "${srcdir}/fakeinstall64/usr/bin64/ninewinecfg" "$pkgdir/usr/bin/ninewinecfg"
  install -d "$pkgdir/usr/lib/wine/fakedlls"
  install -m644 "${srcdir}/fakeinstall64/usr/bin64/ninewinecfg.exe.so" "$pkgdir/usr/lib/wine/fakedlls/ninewinecfg.exe"
  install -m644 "${srcdir}/fakeinstall64/usr/lib64/d3d9-nine.dll.so" "$pkgdir/usr/lib/wine/fakedlls/d3d9-nine.dll"

  #32 bits
  install -m755 "${srcdir}/fakeinstall32/usr/bin32/ninewinecfg" "$pkgdir/usr/bin/ninewinecfg32"
  install -d "$pkgdir/usr/lib32/wine/fakedlls"
  install -m644 "${srcdir}/fakeinstall32/usr/bin32/ninewinecfg.exe.so" "$pkgdir/usr/lib32/wine/fakedlls/ninewinecfg.exe"
  install -m644 "${srcdir}/fakeinstall32/usr/lib32/d3d9-nine.dll.so" "$pkgdir/usr/lib32/wine/fakedlls/d3d9-nine.dll"
}
