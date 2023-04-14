# Maintainer: kevku <kevku@gmx.com>
pkgname=kodi-addon-inputstream-adaptive-git
pkgver=21.1.0.Omega.r27.g65dbb6f
pkgrel=1
pkgdesc="InputStream client for adaptive streams for Kodi 20+"
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'armv6h')
url="https://github.com/xbmc/inputstream.adaptive"
license=('GPL2')
depends=('kodi' 'expat' 'pugixml')
makedepends=('kodi-dev' 'cmake' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
# kodi 21
source=("$pkgname::git+https://github.com/xbmc/inputstream.adaptive.git#branch=Omega"
        "xbmc-bento4::git+https://github.com/xbmc/Bento4.git#branch=release/v1.6.0-639-kodi")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  [[ -d "$srcdir/$pkgname/$pkgname-build" ]] && rm -r "$srcdir/$pkgname/$pkgname-build"
  mkdir -p "$srcdir/$pkgname/$pkgname-build"
  cd "$srcdir/xbmc-bento4"
  git archive --format tar.gz -o "$srcdir/xbmc-bento4.tar.gz" HEAD .
}

build() {
  cd "$srcdir/$pkgname/$pkgname-build"
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
           -DCMAKE_BUILD_TYPE=Release \
           -DBUILD_SHARED_LIBS=1 \
           -DBUILD_TESTING=0 \
           -DENABLE_INTERNAL_BENTO4=ON \
           -DBENTO4_URL="$srcdir/xbmc-bento4.tar.gz" \
           -DUSE_LTO=1
  make
}

package() {
  cd "$srcdir/$pkgname/$pkgname-build"
  make DESTDIR="$pkgdir/" install
}
