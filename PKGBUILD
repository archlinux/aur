# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=iscdcommons-git
pkgver=20210723.r39
pkgrel=4
pkgdesc="Common library for ISCD tools, e.g. elastic"
arch=('x86_64')
url="https://github.com/ISCDtoolbox/Commons"
license=('GPL3')
depends=('glibc')
makedepends=('git')
provides=('iscdcommons')
conflicts=('iscdcommons')
source=("${pkgname%-git}::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  printf "%s.r%s" $(git log -1 --format="%cd" --date=short | tr -d '-') \
	 "$(git rev-list --count HEAD)"
}

build() {
  cd ${pkgname%-git}
  [[ -d build ]] || mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX:PATH=/usr 
  make
}

package() {
  cd ${pkgname%-git}
  install -Dm644 build/libCommons.so "$pkgdir"/usr/lib/libCommons.so
  install -d "$pkgdir"/usr/share/include/${pkgname-git}
  cp sources/*.c sources/*.h "$pkgdir"/usr/share/include/${pkgname-git}
}
