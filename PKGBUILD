# Maintainer: Serhii Starovoitov <drommer.94@gmail.com>

pkgname=stacer-git
pkgver=1.5.0.r0.gfc97050
pkgrel=1
pkgdesc="Linux System Optimizer and Monitoring"
url="https://stacer.quentium.fr/"
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=('qt6-charts' 'qt6-svg')
makedepends=('cmake' 'git' 'qt6-tools')
provides=('stacer')
conflicts=('stacer')
source=("${pkgname%-git}::git+https://github.com/QuentiumYT/Stacer.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}"

  sed -i "s|Qt6 Qt5|Qt6|" CMakeLists.txt
  mkdir build

  cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_CXX_COMPILER=g++ -B build -S .
  make -C build
}

package() {
  cd "${pkgname%-git}"

  install -Dm755 "build/stacer/stacer" -t "${pkgdir}/usr/share/stacer"
  install -Dm755 "build/stacer-core/libstacer-core.a" -t "${pkgdir}/usr/share/stacer/lib"
  install -Dm644 "build/stacer/translations"/*.qm -t "${pkgdir}/usr/share/stacer/translations"

  for i in 16 32 64 128 256; do
    install -Dm644 "icons/hicolor/${i}x${i}/apps/stacer.png" -t "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps"
  done

  install -Dm644 "desktop/stacer.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/stacer"
  install -Dm644 "build/desktop/fr.quentium.stacer.metainfo.xml" -t "${pkgdir}/usr/share/metainfo"

  mkdir "${pkgdir}/usr/bin"
  ln -sf "/usr/share/stacer/stacer" "${pkgdir}/usr/bin/stacer"
}
