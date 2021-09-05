# Maintainer: FabioLolix
# Contributor: Daniel Milde <daniel.milde@firma.seznam.cz>
# Contributor: Bradley Nelson <bradleynelson102@gmail.com>

pkgname=stacer-git
pkgver=1.1.0.r87.ga146edd
pkgrel=1
pkgdesc="Linux System Optimizer and Monitoring"
url="https://oguzhaninan.github.io/Stacer-Web/"
arch=(x86_64 i686 pentium4 arm armv6h armv7h aarch64)
license=(GPL3)
depends=(qt5-charts qt5-svg)
makedepends=(git cmake qt5-tools)
provides=(stacer)
conflicts=(stacer)
source=("${pkgname%-git}::git+https://github.com/oguzhaninan/Stacer.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}"
  [ -d build ] && rm -fr build
  mkdir build
  cd build

  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=/qt/path/bin .. 
  sed -i s/\;/" "/g ./stacer/CMakeFiles/stacer.dir/link.txt
  make
}

package() {
  cd "${pkgname%-git}/build"
  mkdir -p "${pkgdir}"/usr/lib/stacer
  
  install -Dm755 ./output/lib/libstacer-core.a "${pkgdir}"/usr/lib
  
  mkdir -p "${pkgdir}"/usr/bin
  install -Dm755 ./output/stacer "${pkgdir}"/usr/bin/stacer

  install -Dm644 ../LICENSE "{$pkgdir}"/usr/share/licenses/stacer/LICENSE
  
  mkdir -p "${pkgdir}"/usr/share/
  cp -ar ../icons "${pkgdir}"/usr/share/
  
  install -Dm644 ../applications/stacer.desktop "${pkgdir}"/usr/share/applications/stacer.desktop

  # Install translations
  mkdir -p "${pkgdir}"/usr/lib/stacer/translations
  install -Dm644 ../translations/*.ts "${pkgdir}"/usr/lib/stacer/translations/
}
