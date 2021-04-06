# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=music_visualizer
pkgver=2019.12.18
pkgrel=1
pkgdesc='Shader viewer and music visualizer'
arch=(x86_64)
url='https://github.com/bradleybauer/music_visualizer'
license=(unknown)
depends=(ffts rapidjson)
makedepends=(cmake git ninja)
source=(cmake.patch
        "git+$url#commit=f108544c3ff9ed3776922920383f0a01d6f685ce") # 2019-12-18
b2sums=('944de83413f680c2f412afda07d4fce5d365dfcfa9c6077bed9093caab41404d97a48deb65ba249ee286e33b2e52163d72f03433cc12e1f9f643b5bb49592129'
        'SKIP')

prepare() {
  cd $pkgname
  git submodule update --init libs/SimpleFileWatcher
  patch -p1 -i ../cmake.patch
  sed -i '0,/shaders/s/shaders/\/usr\/share\/music_visualizer\/shaders/' src/main.cpp
}

build() {
  mkdir -p build
  cd build
  cmake ../$pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_C_FLAGS="$CFLAGS -fPIC -w" \
    -G Ninja
  ninja
}

package() {
  install -Dm755 build/main "$pkgdir/usr/bin/music_visualizer"
  install -d "$pkgdir/usr/share/doc/$pkgname"
  cp -r "$pkgname/docs/"* "$pkgdir/usr/share/doc/$pkgname/"
  install -d "$pkgdir/usr/share/$pkgname"
  cp -r "$pkgname/src/shaders" "$pkgdir/usr/share/$pkgname/"
}
