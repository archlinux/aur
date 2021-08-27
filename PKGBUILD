# Maintainter: Talebian <talebian@sovietunion.xyz>

pkgname=bottles-git
pkgver=r2004.23f18ef
pkgrel=1
epoch=1
pkgdesc="Easily manage wineprefix using environments"
arch=(any)
url="https://github.com/bottlesdevs/Bottles"
license=(GPL3)
depends=(python libhandy dconf)
makedepends=(meson ninja appstream-glib git)
provides=(bottles)
conflicts=(bottles)
source=("${pkgname%-git}::git+https://github.com/bottlesdevs/Bottles")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  #git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare () {
  cd "$srcdir/${pkgname%-git}"
  rm -rf build
  mkdir build 
}

build () {
  cd "$srcdir/${pkgname%-git}"
  arch-meson build
  ninja -C build
}

#check () {
#  ninja test -C "$srcdir/${pkgname%-git}/build"
#}

package () { 
  cd "$srcdir/${pkgname%-git}"
  DESTDIR="$pkgdir/" ninja install -C build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

