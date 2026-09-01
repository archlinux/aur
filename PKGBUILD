# Maintainer: Nemin <bergengocia@protonmail.com>
pkgname=relive-git
pkgver=r5955.3be8967b7
pkgrel=1
pkgdesc="An open-source Abe's Oddysee / Abe's Exoddus engine"
arch=('i686' 'x86_64')
url="https://aliveteam.github.io"
license=('unknown')
depends=('sdl3' 'zenity')
makedepends=('git' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('relive::git+https://github.com/AliveTeam/alive_reversing')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  git submodule update --init --recursive
  export CFLAGS="${CFLAGS/-O3/-O2}"
  export CXXFLAGS="${CXXFLAGS/-O3/-O2}"
  cmake -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -DCMAKE_INSTALL_PREFIX="$pkgdir/usr/" -B build -S .
}

package() {
  cd "$srcdir/${pkgname%-git}/build"
  make relive
  cd "$srcdir/${pkgname%-git}/build/Source/relive"
  make install
  cd "$srcdir/${pkgname%-git}/build/assets"
  make install
}
