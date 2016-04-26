# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=flatcc-git
pkgver=20160420
pkgrel=1
pkgdesc="FlatBuffers Compiler and Library in C for C"
arch=('i686' 'x86_64')
makedepends=('cmake' 'git' 'ninja')
url="https://github.com/dvidelabs/flatcc"
license=('Apache')
options=('staticlibs')
source=(git+https://github.com/dvidelabs/flatcc)
sha256sums=('SKIP')
provides=('flatcc')
conflicts=('flatcc')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  cd ${pkgname%-git}

  msg2 'Building...'
  ./scripts/build.sh
}

package() {
  cd ${pkgname%-git}

  msg2 'Installing license...'
  install -Dm 644 LICENSE NOTICE -t "$pkgdir/usr/share/licenses/${pkgname%-git}"

  msg2 'Installing documentation...'
  install -Dm 644 *.md doc/* -t "$pkgdir/usr/share/doc/${pkgname%-git}"

  msg2 'Installing...'
  find bin -mindepth 1 -maxdepth 1 -type f -exec \
    install -Dm 755 -t "$pkgdir/usr/bin" '{}' +
  find lib -mindepth 1 -maxdepth 1 -type f -exec \
    install -Dm 644 -t "$pkgdir/usr/lib" '{}' +
  cp -dpr --no-preserve=ownership include "$pkgdir/usr"
}
