# Maintainer: redtide <redtid3@gmail.com>

_prjname=AIDA-X
_pkgname=${_prjname,,}
pkgname=$_pkgname-git
pkgver=r178.bf51591
pkgrel=1
pkgdesc="Amp Model Player leveraging AI"
url=https://github.com/AidaDSP/$_pkgname
arch=(x86_64)
license=(GPL3)
groups=(clap-plugins lv2-plugins pro-audio vst-plugins vst3-plugins)
depends=(
  alsa-lib
  dbus
  gcc-libs
  glibc
  libgl
  libx11
  libxext
  clap-host
  lv2-host
  vst-host
  vst3-host
)
makedepends=(
  cmake
  git
)
checkdepends=(
  lv2lint
)
provides=($_pkgname)
conflicts=($_pkgname $_pkgname-{clap,lv2,standalone,vst,vst3})
source=($_pkgname::git+$url.git)
sha512sums=(SKIP)
pkgver() {
  cd "$srcdir"/$_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
prepare() {
  cd "$srcdir"/$_pkgname
  git submodule update --init --recursive
}
build() {
  local cmake_options=(
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_BUILD_TYPE=Release
    -Wno-dev
    -B build
    -S $_pkgname
  )
  cmake "${cmake_options[@]}"
  cmake --build build --verbose
}
package() {
  DESTDIR="$pkgdir" cmake --install build
  install -vDm 755 build/bin/$_prjname -t "$pkgdir"/usr/bin/
  install -vDm 755 build/bin/$_prjname.lv2/*.so -t "$pkgdir/usr/lib/lv2/$_prjname.lv2/"
  install -vDm 644 build/bin/$_prjname.lv2/*.ttl -t "$pkgdir/usr/lib/lv2/$_prjname.lv2/"
  install -vDm 755 build/bin/$_prjname-vst2.so -t "$pkgdir"/usr/lib/vst/
  install -vDm 755 build/bin/$_prjname.vst3/Contents/$CARCH-linux/*.so -t "$pkgdir/usr/lib/vst3/$_prjname.vst3/Contents/$CARCH-linux/"
  install -vDm 755 build/bin/$_prjname.clap -t "$pkgdir"/usr/lib/clap/
  install -vDm 644 $_pkgname/README.md -t "$pkgdir"/usr/share/doc/$_pkgname/
}
