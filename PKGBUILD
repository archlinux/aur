# Maintainer: Arthur Zamarin <arthurzam@gmail.com> 

pkgname=psmoveapi
pkgver=3.9.1
pkgrel=3
pkgdesc="Playstation Move Motion Controller API"
arch=(i686 x86_64)
url="http://thp.io/2010/psmove/"
license=('custom')
depends=('bluez-libs' 'libsystemd' 'opencv' 'sdl2')
makedepends=('cmake' 'git')
source=("http://thp.io/2010/psmove/$pkgname-$pkgver.tar.gz")
sha1sums=('d295e34c4ace3d0b5b0c977ae96b0200160302b7')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  git clone --depth 1 git://github.com/signal11/hidapi.git external/hidapi || true
  git clone --depth 1 git://github.com/inspirit/PS3EYEDriver.git external/PS3EYEDriver || true
  git clone --depth 1 https://github.com/libusb/libusb.git external/libusb-1.0 || true
  git clone --depth 1 https://github.com/spurious/SDL-mirror external/SDL2 || true
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake . \
        -DCMAKE_INSTALL_PREFIX:PATH=/usr \
        -DPSMOVEAPI_LIB_DEST=lib \
        -DPSMOVE_BUILD_EXAMPLES=OFF \
        -DPSMOVE_BUILD_OPENGL_EXAMPLES=OFF \
        -DPSMOVE_BUILD_TESTS=OFF
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -D -m644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
