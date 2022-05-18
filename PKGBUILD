# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Talebian <talebian@sovietunion.xyz>

pkgname=bottles-git
pkgver=2022.5.14.trento.3.r0.g9db34f67
pkgrel=1
epoch=1
pkgdesc="Easily manage wineprefix using environments"
arch=(any)
url="https://usebottles.com/"
license=(GPL3)
depends=(python libhandy dconf patool python-yaml p7zip cabextract wine gtksourceview4)
makedepends=(meson ninja git)
checkdepends=(appstream-glib)
provides=(bottles)
conflicts=(bottles)
source=("${pkgname%-git}::git+https://github.com/bottlesdevs/Bottles.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare () {
  cd "$srcdir/${pkgname%-git}"
  [[ -d build ]] || mkdir build
}

build () {
  cd "$srcdir/${pkgname%-git}"
  arch-meson build
  ninja -C build
}

check () {
  ninja test -C "$srcdir/${pkgname%-git}/build" || true
}

package () { 
  cd "$srcdir/${pkgname%-git}"
  DESTDIR="$pkgdir/" ninja install -C build
}

