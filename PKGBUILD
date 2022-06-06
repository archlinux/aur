# Maintainer: Nico <d3sox at protonmail dot com>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>
pkgname=lightly-git
_gitname=Lightly
pkgver=r2172.121a61e5
pkgrel=2
pkgdesc="A modern style for qt applications"
arch=('x86_64' 'aarch64')
url="https://github.com/Luwx/$_gitname"
license=("GPL2")
depends=("frameworkintegration" "kdecoration" "breeze-icons" "kwayland" "hicolor-icon-theme")
makedepends=("git" "cmake" "extra-cmake-modules" "kcmutils" "kdecoration" "qt5-declarative" "qt5-x11extras")
provides=("lightly-qt")
conflicts=("lightly-qt")
source=("git+$url" "https://github.com/Luwx/Lightly/pull/177.patch")
sha512sums=('SKIP'
            '0705dc4b9c2fac0fb2a2c5caa26da9c7d90f1ebab716a9fc21543707ce4544e6a6984b9e850dba4b4bd3b3c124f60b495f2960091d4867c314998bb7040673f1')

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_gitname"
  patch -p1 < "$srcdir/177.patch"
}

build() {
  cd "$srcdir/$_gitname"
  mkdir -p build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DBUILD_TESTING=OFF ..
  make
}

package() {
  cd "$srcdir/$_gitname/build"
  make DESTDIR="$pkgdir" install
  install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "$srcdir/$_gitname/COPYING"
}
