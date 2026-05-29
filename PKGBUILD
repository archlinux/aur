# /******
# Mahmoud Fayed 
# original author of ring lang and 
# the official maintainer of ring lang 
# project at https://github.com/ring-lang/ring
# ******/
# Maintainer of this AUR package: Khaled Mahfouz <khaledmhfz2004@gmail.com>
# >> Use This Package At Your Own Risk <<
# Checkout the Pinned Comment at 
# <https://aur.archlinux.org/packages/ring-lang-bin#comment-1073208>
pkgname=ring-lang-bin
pkgver=1.27
pkgrel=1
pkgdesc="Ring programming language (prebuilt Linux binary release)"
arch=('x86_64')
url="https://ring-lang.net/"
license=('MIT')
provides=('ring-lang' 'ring')
conflicts=('ring-lang' 'ring')
depends=(
  'allegro'
  'apache'
  'freeglut'
  'gcc-libs'
  'glew'
  'glibc'
  'glu'
  'libcurl-gnutls'
  'libpng'
  'libuv'
  'mariadb-libs'
  'mesa'
  'openssl'
  'postgresql-libs'
  'qt6-base'
  'qt6-declarative'
  'qt6-multimedia'
  'qt5-quickcontrols'
  'qt6-serialport'
  'qt6-speech'
  'qt6-svg'
  'sdl2_image'
  'sdl2_mixer'
  'sdl2_net'
  'sdl2_ttf'
  'unixodbc'
  'zlib'
  'qt6-3d'
  'qt6-charts'
  'qt6-connectivity'
  'qt6-positioning'
  'qt6-webengine'
  'qt6-webview'
)
makedepends=(
  'binutils'
  'gcc'
  'make'
  'pkgconf'
  'qt6-tools'
)

options=('!strip')
source=("Ring_${pkgver}_Ubuntu.zip::https://github.com/ring-lang/ring/releases/download/v${pkgver}/Ring_${pkgver}_Ubuntu.zip")
sha256sums=('cb15148d7b365f80391540e4e8b37ab70644b97b2c31cbba01d76751854f3d14')

package() {
  cd "$srcdir/RingForLinux"

  install -d "$pkgdir/usr/share"
  cp -a ring "$pkgdir/usr/share/"

  install -d "$pkgdir/usr/bin"
  for bin in ring ring2exe ringpm ringrepl ringfmt folder2qrc; do
    ln -s "/usr/share/ring/bin/$bin" "$pkgdir/usr/bin/$bin"
  done

  install -d "$pkgdir/usr/lib"
  for lib in "$pkgdir/usr/share/ring/lib/"*.so*; do
    [ -e "$lib" ] || continue
    ln -s "/usr/share/ring/lib/$(basename "$lib")" "$pkgdir/usr/lib/$(basename "$lib")"
  done
  for lib in "$pkgdir/usr/share/ring/lib/"*.a; do
    [ -e "$lib" ] || continue
    ln -s "/usr/share/ring/lib/$(basename "$lib")" "$pkgdir/usr/lib/$(basename "$lib")"
  done
  # Install bundled third-party libs used by Ring extensions (matches bin/install.sh)
  for lib in ring/extensions/ringraylib5/src/linux_raylib-5/lib/libraylib.so.*; do
    [ -e "$lib" ] || continue
    install -m755 -D "$lib" "$pkgdir/usr/lib/$(basename "$lib")"
  done
  for lib in ring/extensions/ringlibui/linux/libui.so.*; do
    [ -e "$lib" ] || continue
    install -m755 -D "$lib" "$pkgdir/usr/lib/$(basename "$lib")"
  done
  for lib in ring/extensions/ringtilengine/linux_tilengine/lib/*.so; do
    [ -e "$lib" ] || continue
    install -m755 -D "$lib" "$pkgdir/usr/lib/$(basename "$lib")"
  done

  install -Dm644 "$pkgdir/usr/share/ring/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
