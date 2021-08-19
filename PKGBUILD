# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=crazydiskinfo-git
pkgver=1.1.0.r0.g803a585
pkgrel=2
pkgdesc="Interactive ncurses S.M.A.R.T. viewer"
arch=('x86_64')
url="https://github.com/otakuto/crazydiskinfo"
license=('MIT')
depends=('libatasmart')
makedepends=('cmake' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  git -C $pkgname describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  sed -i 's|tinfow|tinfo|g;s|/usr/sbin|/usr/bin|g' $pkgname/CMakeLists.txt
}

build() {
  cmake -B build -S $pkgname -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX=/usr -Wno-dev
  make -C build
}

package() {
  install -Dm644 $pkgname/LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
  make -C build DESTDIR="$pkgdir/" install
}

