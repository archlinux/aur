# Maintainer: lmartinez-mirror
pkgname=tvision-git
pkgver=586.r319.g3a36472
pkgrel=2
pkgdesc="Modern port of Turbo Vision 2.0 with cross-platform and Unicode support"
arch=('x86_64')
url="https://github.com/magiblot/tvision"
license=('MIT' 'custom:public-domain')
depends=('ncurses')
makedepends=('git' 'cmake>=3.5')
optdepends=('gpm: Linux console mouse support (requires recompile)')
provides=('tvision' 'libtvision.a')
conflicts=('tvision')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^r//;s/-/.r/;s/-/./'
}

build() {
  cd "$pkgname"
  mkdir -p build
  cd build
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DTV_REDUCE_APP_SIZE=OFF \
    ..
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir/" install -C build
  install -Dm 644 COPYRIGHT -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
