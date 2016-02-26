# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=hyperion
pkgver=0.1.42
pkgrel=2
pkgdesc="Opensource 'AmbiLight' implementation"
url="http://code.google.com/p/boblight/"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('icu' 'libusbx' 'protobuf3' 'python' 'qt5-base')
makedepends=('cmake' 'doxygen' 'git')
source=("https://github.com/tvdzwan/$pkgname/archive/v$pkgver.tar.gz"
        "https://github.com/Kwiboo/hyperion/commit/0ce04b692b7c3e4414c46402c389215f7b0aac48.diff"
        "${pkgname}d.service")
backup=('etc/hyperion.config.json')
md5sums=('71e5784eac9f23fd15cb49b580cca63e'
         '065cad44d258ad428cf66ddd8820f586'
         '3c81238f5018ae1ed5a19d2058ccbe7f')

prepare() {
  cd "$pkgname-$pkgver"
  patch -p1 -i "$srcdir/0ce04b692b7c3e4414c46402c389215f7b0aac48.diff"

  sed -i 's/protoc_compiler/${PROTOBUF_PROTOC_EXECUTABLE}/'g dependencies/CMakeLists.txt
  sed -i 's/isnan/std::isnan/g' libsrc/leddevice/LedDevicePhilipsHue.cpp
}

build() {
  mkdir -p build
  cd build
  cmake -DENABLE_DISPMANX=OFF \
        -DENABLE_X11=ON \
        -DENABLE_QT5=ON \
        ../$pkgname-$pkgver

  make
}

package() {
  cd build

  mkdir -p "$pkgdir/usr/bin"
  cp bin/$pkgname* "$pkgdir/usr/bin"

  mkdir -p "$pkgdir/usr/lib/$pkgname"
  cp -r "$srcdir/$pkgname-$pkgver/effects" "$pkgdir/usr/lib/$pkgname"

  mkdir -p "$pkgdir/etc"
  cp "$srcdir/$pkgname-$pkgver/config/${pkgname}_x86.config.json" "$pkgdir/etc/$pkgname.config.json"
  sed -i "s/home\/dincs\/projects/usr\/lib/g" "$pkgdir/etc/$pkgname.config.json"

  install -Dm644 "$srcdir/${pkgname}d.service" "$pkgdir/usr/lib/systemd/system/${pkgname}d.service"
}
