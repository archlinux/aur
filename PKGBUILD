# Maintainer: kevku <kevku@gmx.com>
pkgname=kodi-addon-inputstream-adaptive-git
pkgver=2.4.6.Leia.r6.g09ec268
pkgrel=1
pkgdesc="InputStream client for adaptive streams for Kodi 18+"
arch=('x86_64' 'i686' 'armv7h' 'armv6h')
url="https://github.com/peak3d/inputstream.adaptive"
license=('GPL2')
depends=('kodi>=18' 'expat')
makedepends=('kodi-dev>=18' 'cmake' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
# kodi 18
source=('kodi-addon-inputstream-adaptive-git::git+https://github.com/peak3d/inputstream.adaptive.git#branch=Leia')
# kodi 19
# source=('kodi-addon-inputstream-adaptive-git::git+https://github.com/peak3d/inputstream.adaptive.git#branch=Matrix')
md5sums=('SKIP')

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
           -DUSE_LTO=1
  make
}

package() {
  cd "$srcdir/$pkgname/$pkgname-build"
  make DESTDIR="$pkgdir/" install
}
