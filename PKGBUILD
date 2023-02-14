# Maintainer: kevku <kevku@gmx.com>
pkgname=kodi-addon-inputstream-rtmp-git
pkgver=20.3.0.Nexus.r2.g9ab6dfc
pkgrel=1
pkgdesc="librtmp support for Kodi 20+"
arch=('x86_64' 'i686' 'armv7h')
url="https://github.com/xbmc/inputstream.rtmp"
license=('GPL2')
depends=('kodi' 'rtmpdump')
makedepends=('kodi-dev' 'cmake' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
# kodi 21
source=('kodi-addon-inputstream-rtmp-git::git+https://github.com/xbmc/inputstream.rtmp.git#branch=Omega')
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
