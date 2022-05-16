# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=clight-gui-git
pkgver=r91.079bd99
pkgrel=2
pkgdesc="Qt GUI for Clight"
arch=('x86_64' 'aarch64')
url="https://github.com/nullobsi/clight-gui"
license=('GPL3')
depends=('clight' 'qt5-charts')
makedepends=('git' 'cmake' 'qt5-tools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/nullobsi/clight-gui.git'
        "${pkgname%-git}.desktop")
sha256sums=('SKIP'
            '73affb7c39501d2ade8f517b07f8a2ea6e229dab0f9c28b6bd6c25b65b5f9ec2')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S "${pkgname%-git}/src" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_PREFIX_PATH=/usr/lib/cmake/Qt5 \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DGENERATE_TRANSLATIONS=ON \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "${pkgname%-git}.desktop" -t "$pkgdir/usr/share/applications"
}
