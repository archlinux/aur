# Maintainer: James Clarke <james@jamesdavidclarke.com>
pkgname=appanvil-git
pkgver=r736.4d7d2bf
pkgrel=2
pkgdesc="A graphical user interface for the AppArmor access control system"
arch=('x86_64' 'aarch64')
url="https://github.com/jack-ullery/AppAnvil"
license=('GPL3')
depends=('gtkmm3' 'jsoncpp' 'apparmor')
makedepends=('git' 'cmake')
provides=('appanvil' 'libappanvil')
conflicts=('appanvil' 'libappanvil')
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/AppAnvil"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/AppAnvil"
  git submodule update --init --recursive
}

build() {
  cd "$srcdir/AppAnvil"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
}

package() {
  cd "$srcdir/AppAnvil/build"
  make DESTDIR="$pkgdir/" install
  install -Dm644 "$startdir/appanvil.desktop" "$pkgdir/usr/share/applications/appanvil.desktop"
}
