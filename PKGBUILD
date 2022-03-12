# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Talebian <talebian@sovietunion.xyz>

pkgname=bottles-git
pkgver=2022.2.28.trento.4.r62.gfd622b29
pkgrel=1
epoch=1
pkgdesc="Easily manage wineprefix using environments"
arch=(any)
url="https://usebottles.com/"
license=(GPL3)
depends=(python libhandy dconf patool python-yaml p7zip cabextract)
makedepends=(meson ninja appstream-glib git)
provides=(bottles)
conflicts=(bottles)
source=("${pkgname%-git}::git+https://github.com/bottlesdevs/Bottles")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  #printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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

check () {
  ninja test -C "$srcdir/${pkgname%-git}/build"
}

package () { 
  cd "$srcdir/${pkgname%-git}"
  DESTDIR="$pkgdir/" ninja install -C build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

