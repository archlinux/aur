# Maintainer: Martin Müllenhaupt <mm+aur.archlinux.org@netlair.de>
pkgname=libwebrtc-static
pkgver=1.0.0.faf4
pkgrel=1
epoch=0
pkgdesc="Google's WebRTC as static library"
url="https://webrtc.org/native-code/development/"
arch=('x86_64')
license=('https://webrtc.org/license/software')
groups=()
depends=('')
makedepends=('git' 'ninja' 'cmake' 'gcc' 'python2')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/FAForever/libwebrtc.git")
sha256sums=('SKIP')
noextract=()
validpgpkeys=()

pkgver() {
  cd "libwebrtc"
  git describe --tags --abbrev=0 | sed 's/v\([^-]*-\)/\1/;s/-/./g'
}

build() {
  cd "libwebrtc"
  mkdir -p /tmp/python_for_libwebrtc_build
  ln -s /usr/bin/python2 /tmp/python_for_libwebrtc_build/python || true
  export PATH=/tmp/python_for_libwebrtc_build:$PATH
  cmake -G "Ninja" -DCMAKE_INSTALL_PREFIX=$pkgdir/usr -DCMAKE_BUILD_TYPE=Release -DWEBRTC_BRANCH_HEAD=refs/branch-heads/62 -DBUILD_TESTS=ON .
  ninja
}

package() {
  cd "libwebrtc"
  mkdir -p $pkgdir/usr
  cp -r ./include $pkgdir/usr/include
  cp -r ./lib $pkgdir/usr/lib
  sed -i "/  virtual ~MessageHandler();/c\  virtual ~MessageHandler(){};" $pkgdir/usr/include/webrtc/rtc_base/messagehandler.h
}
