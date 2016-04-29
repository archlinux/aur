# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=myhtml-git
pkgver=20160420
pkgrel=1
pkgdesc="Fast HTML parser using threads implemented as a pure C99 library with no outside dependencies"
arch=('i686' 'x86_64')
makedepends=('cmake' 'git' 'make')
url="https://github.com/lexborisov/myhtml"
license=('Apache')
source=(git+https://github.com/lexborisov/myhtml)
sha256sums=('SKIP')
provides=('myhtml')
conflicts=('myhtml')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  cd ${pkgname%-git}

  msg2 'Building...'
  cd projects
  cmake . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DMyHTML_INSTALL_HEADER=ON
  make
}

package() {
  cd ${pkgname%-git}

  msg2 'Installing documentation...'
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/${pkgname%-git}"
  cp -dpr --no-preserve=ownership docs/* examples \
    "$pkgdir/usr/share/doc/${pkgname%-git}"

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install -C projects/
}
