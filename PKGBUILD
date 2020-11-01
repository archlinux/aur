# Maintainer: morpheusthewhite <zffromGerace@hotmail.it>

pkgname=nordpy-plasmoid-git
pkgver=r10.ec6491c
pkgrel=1
pkgdesc="Plasma widget to control NordPy; it uses the last server type used within nordpy to establish the VPN connection."
arch=('x86_64')
url="https://github.com/morpheusthewhite/nordpy-plasmoid.git"
license=('GPL3')
groups=()
depends=('polkit' 'nordpy' 'qt5-base' 'qt5-declarative' 'plasma-framework') 
makedepends=('git' 'extra-cmake-modules')
source=("git+https://github.com/morpheusthewhite/nordpy-plasmoid.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  # "Building and installing plugin"
  qmake ${pkgname%-git}/plugin -o build-plugin/Makefile
  make -C build-plugin
  
  # "Building and installing plasmoid"
  cmake -B build ${pkgname%-git}
  make -C build
}

package() {
  make -C build-plugin INSTALL_ROOT="$pkgdir" install
  make -C build DESTDIR="$pkgdir" install
}
