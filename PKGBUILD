# Maintainer: Drommer <drommer@github.com>

pkgname=stacer-git
pkgver=1.3.0.r3.g07a0966
pkgrel=1
pkgdesc="Linux System Optimizer and Monitoring"
url="https://stacer.quentium.fr/"
arch=('x86_64')
license=('GPL3')
depends=('qt6-charts' 'qt6-svg')
makedepends=('git' 'cmake' 'qt6-tools')
provides=('stacer')
conflicts=('stacer')
source=("${pkgname%-git}::git+https://github.com/QuentiumYT/Stacer.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}"
  mkdir build

  cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_CXX_COMPILER=g++ -B build -S .
  make -C build

  lupdate stacer/stacer.pro -no-obsolete
  lrelease stacer/stacer.pro
}

package() {
  cd "${pkgname%-git}"

  install -Dm755 "build/output/stacer" -t "${pkgdir}/usr/share/stacer"
  install -Dm755 "build/output/lib/libstacer-core.a" -t "${pkgdir}/usr/share/stacer/lib"
  install -Dm644 "applications/stacer.desktop" -t "${pkgdir}/usr/share/applications"

  for i in 16 32 64 128 256; do
    install -Dm644 "icons/hicolor/${i}x${i}/apps/stacer.png" -t "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps"
  done

  install -Dm644 "translations"/*.qm -t "${pkgdir}/usr/share/stacer/translations"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/stacer"

  mkdir "${pkgdir}/usr/bin"
  ln -sf "/usr/share/stacer/stacer" "${pkgdir}/usr/bin/stacer"
}
