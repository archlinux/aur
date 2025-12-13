# Maintainer: fox <pixilreal@gmail.com>
pkgname=servo-spp-git
pkgver=r1.0.0
pkgrel=1
pkgdesc="Official semicolon servo++/spp implementation - A C++ implementation of the Servo programming language"
arch=('x86_64')
url="https://github.com/semicolon-servo/spp"
license=('unknown')
depends=('gcc' 'bc')
makedepends=('git' 'make' 'gcc')
provides=('servo-spp' 'servocomp')
conflicts=('servo-spp')
source=("git+https://github.com/semicolon-servo/spp.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/spp"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/spp/servo"
  make
}

package() {
  cd "$srcdir/spp/servo"
  install -Dm755 servocomp "$pkgdir/usr/bin/servocomp"
  
  if [ -d "reach" ]; then
    install -d "$pkgdir/usr/share/servo/reach"
    cp -r reach/* "$pkgdir/usr/share/servo/reach/"
  fi
  
  if [ -d "globalheaders" ]; then
    install -d "$pkgdir/usr/share/servo/globalheaders"
    cp -r globalheaders/* "$pkgdir/usr/share/servo/globalheaders/"
  fi
}
