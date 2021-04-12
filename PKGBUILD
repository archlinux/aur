# Contributor: Martins Mozeiko <martins.mozeiko@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=rclone-browser-git
pkgver=1.8.0.r381
pkgrel=1
pkgdesc='Simple cross-platform GUI for rclone'
url='https://github.com/kapitainsky/RcloneBrowser/'
arch=('i686' 'x86_64')
license=('custom:Public Domain')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/kapitainsky/RcloneBrowser.git" no-Werror.patch)
sha256sums=('SKIP'
            'd169637193239aab75e8c62f7049eda461a276dcfa1c6eb9ae6a282b986e9c88')
depends=('qt5-base' 'rclone' 'qt5-declarative')
makedepends=('cmake' 'git')

pkgver() {
  cd ${pkgname%-git}
  printf %s.r%s $(cat VERSION) $(git rev-list --count HEAD)
}

prepare() {
  cd ${pkgname%-git}
  patch -Np1 < "$srcdir"/no-Werror.patch
}

build() {
  cd ${pkgname%-git}
  [[ -d build ]] || mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX="$pkgdir"/usr -DCMAKE_BUILD_TYPE=Release
  make -v 1
}

package() {
  cd ${pkgname%-git}/build
  make DESTDIR="$pkgdir" install 
  install -Dm644 "$srcdir"/${pkgname%-git}/LICENSE \
          "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}
