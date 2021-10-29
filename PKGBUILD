# Maintainer: robertfoster
pkgname=abyss-engine-git
pkgver=r156.4a6ad0e
pkgrel=1
pkgdesc="a game engine designed to run games similar to 2000's style ARPGs such as Diablo II"
arch=('i686' 'x86_64')
url="https://github.com/AbyssEngine/AbyssEngine"
license=('GPL3')
depends=('ffmpeg' 'lua')
makedepends=('cmake' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"

  # Git, tags available
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

  # Git, no tags available
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  if [ ! -d build ]; then
    mkdir build
  fi
}

build() {
  cd "$srcdir/${pkgname%-git}"
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  cd build
  make DESTDIR="$pkgdir" install
}
