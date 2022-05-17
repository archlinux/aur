# Maintainer: kevku <kevku@gmx.com>
pkgname=kodi-addon-inputstream-adaptive-git
pkgver=20.2.0.Nexus.r19.g59ce7b0
pkgrel=1
pkgdesc="InputStream client for adaptive streams for Kodi 20+"
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'armv6h')
url="https://github.com/xbmc/inputstream.adaptive"
license=('GPL2')
depends=('kodi' 'expat')
makedepends=('kodi-dev' 'cmake' 'git' 'gtest')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
# kodi 20
source=("$pkgname::git+https://github.com/xbmc/inputstream.adaptive.git#branch=Nexus"
        "bento4.tar.gz::https://github.com/axiomatic-systems/Bento4/archive/refs/tags/v1.6.0-639.tar.gz")
noextract=('bento4.tar.gz')
sha256sums=('SKIP'
            '9f3eb912207d7ed9c1e6e05315083404b32a11f8aacd604a9b2bdcb10bf79eb9')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  [[ -d "$srcdir/$pkgname/$pkgname-build" ]] && rm -r "$srcdir/$pkgname/$pkgname-build"
  mkdir -p "$srcdir/$pkgname/$pkgname-build"
}

build() {
  cd "$srcdir/$pkgname/$pkgname-build"
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
           -DCMAKE_BUILD_TYPE=Release \
           -DBUILD_SHARED_LIBS=1 \
           -DENABLE_INTERNAL_BENTO4=ON \
           -DBENTO4_URL="$srcdir/bento4.tar.gz" \
           -DUSE_LTO=1
  make
}

package() {
  cd "$srcdir/$pkgname/$pkgname-build"
  make DESTDIR="$pkgdir/" install
}
