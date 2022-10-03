# Maintainer: kevku <kevku@gmx.com>
pkgname=kodi-addon-inputstream-adaptive-git
pkgver=20.3.0.Nexus.r10.gd7f552c
bento4ver=1.6.0-639-3-Nexus
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
        "bento4-$bento4ver.tar.gz::https://github.com/xbmc/Bento4/archive/refs/tags/$bento4ver.tar.gz")
noextract=('bento4.tar.gz')
sha256sums=('SKIP'
            '073efdc1d37140d813e5ee7ea33b3497531d2180ed3593280d13478391b9d049')

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
           -DBENTO4_URL="$srcdir/bento4-$bento4ver.tar.gz" \
           -DUSE_LTO=1
  make
}

package() {
  cd "$srcdir/$pkgname/$pkgname-build"
  make DESTDIR="$pkgdir/" install
}
