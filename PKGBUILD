# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=elastic-git
pkgver=20210506.r145
pkgrel=2
pkgdesc="Simple yet efficient finite element solver for linear elasticity problems in two and three dimensions."
arch=('x86_64')
url="https://github.com/ISCDtoolbox/LinearElasticity"
license=('LGPL')
depends=('iscdcommons-git' 'glibc')
makedepends=('git')
conflicts=('elastic')
provides=('elastic')
source=("${pkgname%-git}::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  printf "%s.r%s" $(git log -1 --format="%cd" --date=short | tr -d '-') \
	 "$(git rev-list --count HEAD)"
}

prepare() {
  cd ${pkgname%-git}
  sed -i '4s+$ENV{HOME}+/usr+' CMakeLists.txt
}

build() {
  cd ${pkgname%-git}
  [[ -d build ]] || mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX:PATH=/usr \
	-DCMAKE_SKIP_BUILD_RPATH:BOOL=TRUE
  make
}

package() {
  cd ${pkgname%-git}/build
  make install DESTDIR="${pkgdir}"
}
