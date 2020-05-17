# Maintainer: Gicu Gorodenco <cyclopsihus 'at' gmail 'dot' com>
# Contributor: rafael ff1 (aka josephgbr)

_pkgbase=libsigc++
pkgbase=lib32-libsigc++
pkgname=${pkgbase}
pkgver=2.10.3
pkgrel=1
pkgdesc="Callback Framework for C++ (lib32)"
url="https://libsigcplusplus.github.io/libsigcplusplus/"
arch=('x86_64')
license=('LGPL')
depends=(lib32-gcc-libs)
makedepends=(git mm-common meson)
options=('!emptydirs')
_commit=88fdb3a14ec67de233fed22646fc9b14c24367f5  # tags/2.10.3^0
source=("git+https://github.com/libsigcplusplus/libsigcplusplus#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd libsigcplusplus
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd libsigcplusplus
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG=/usr/bin/i686-pc-linux-gnu-pkg-config
  export ENABLE_DOCUMENTATION=false

  arch-meson libsigcplusplus build \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    -D maintainer-mode=true \
    -D benchmark=false \
    -D build-examples=false \
    -D build-documentation=false \
    -D build-pdf=false \
    -D validation=false

  ninja -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  provides=("lib32-libsigc++2.0=${pkgver}")
  replaces=('lib32-libsigc++2.0')
  conflicts=('lib32-libsigc++2.0')

  DESTDIR="$pkgdir" meson install -C build


  # Removing files included in base libsigc++ package
  rm -fR ${pkgdir}/usr/include
}
