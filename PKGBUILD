# ---------------------------------------------------------------
# Maintainer: Romain Bazile <gromain.baz@gmail.com>
# ---------------------------------------------------------------

pkgname=opencpn-plugin-oesenc-git
pkgver=4.0.5.r112.gaa16607
pkgrel=4
pkgdesc="O-charts.org plugin for OpenCPN"
arch=('x86_64' 'aarch64')
license=("GPL3")
depends=('opencpn')
conflicts=('opencpn-plugin-oesenc')
makedepends=('cmake' 'git')
url="https://opencpn.org/OpenCPN/plugins/oesenc.html"
source=("$pkgname::git+https://github.com/bdbcat/oesenc_pi.git" "CMakeLists.patch")
sha1sums=('SKIP'
          'ef99cd55434a26699a6a35a78bbcd357719ac430')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  patch --strip=1 --binary -i $srcdir/CMakeLists.patch
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config-gtk3 ..
  make
}

package() {
  cd "$pkgname/build"
  DESTDIR="$pkgdir" make install
}
