# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97 at gmail dot com>

_pkgname=gammastep
pkgname=$_pkgname-wayland-git
provides=("gammastep")
conflicts=("gammastep")
pkgver=2.0.9
pkgrel=1
pkgver=r752.eab8be4
pkgdesc="Adjust the color temperature of your screen according to your surroundings. Fork with fullscreen bypass for wayland."
arch=(x86_64)
url="https://gitlab.com/angelodalzotto97/gammastep"
license=(GPL3)
depends=(geoclue glibc hicolor-icon-theme wayland)
makedepends=(glib2 intltool python systemd git)
optdepends=(
  'python-gobject: for gammastep-indicator'
  'python-xdg: for gammastep-indicator'
  'gtk3: for gammastep-indicator'
)
source=($_pkgname::git+https://gitlab.com/angelodalzotto97/$_pkgname.git)
sha256sums=('SKIP')

prepare() {
  cd $_pkgname
  git switch fsbypass
  git pull -f origin fsbypass  
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  ./bootstrap
}

build() {
  cd $_pkgname
  ./configure --disable-drm --disable-randr --disable-vidmode --prefix=/usr
  make
}

check() {
  make -k check -C $_pkgname
}

package() {
  depends+=(libgio-2.0.so libgobject-2.0.so libglib-2.0.so)

  make DESTDIR="$pkgdir/" install -C $_pkgname
  install -vDm 644 $_pkgname/{CONTRIBUTING,NEWS,README}.md -t "$pkgdir/usr/share/doc/$_pkgname/"
}
