# Maintainer: kevku <kevku@gmx.com>
pkgname=kodi-addon-inputstream-adaptive-git
pkgver=20.3.0.Nexus.r4.g59660c1
pkgrel=1
pkgdesc="InputStream client for adaptive streams for Kodi 20+"
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'armv6h')
url="https://github.com/xbmc/inputstream.adaptive"
license=('GPL2')
depends=('kodi' 'expat')
makedepends=('kodi-dev' 'cmake' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
# kodi 20
source=("$pkgname::git+https://github.com/xbmc/inputstream.adaptive.git#branch=Nexus"
        "bento4-1.6.0-639-2-Nexus.tar.gz::https://github.com/xbmc/Bento4/archive/refs/tags/1.6.0-639-2-Nexus.tar.gz")
noextract=('bento4.tar.gz')
sha256sums=('SKIP'
            '85b0269bd50abafb0d266e620d806d0e6aee837ad1a40b9c5f3a81f28aad1a95')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
           -DBUILD_TESTING=0 \
           -DENABLE_INTERNAL_BENTO4=ON \
           -DBENTO4_URL="$srcdir/bento4-1.6.0-639-2-Nexus.tar.gz" \
           -DUSE_LTO=1
  make
}

package() {
  cd "$srcdir/$pkgname/$pkgname-build"
  make DESTDIR="$pkgdir/" install
}
