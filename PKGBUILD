# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=bitc-git
pkgver=20141118
pkgrel=1
pkgdesc="Thin SPV terminal-based Bitcoin client written in ANSI C"
arch=('any')
depends=('curl' 'leveldb' 'ncurses' 'openssl' 'snappy')
makedepends=('clang' 'gcc' 'git' 'make')
url="https://github.com/bit-c/bitc"
license=('MIT')
source=(git+https://github.com/bit-c/bitc)
sha256sums=('SKIP')
provides=('bitc')
conflicts=('bitc')
install=bitc.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  cd ${pkgname%-git}

  msg "Building..."
  make
}

package() {
  cd ${pkgname%-git}

  msg 'Installing license...'
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/bitc/LICENSE"

  msg 'Installing documentation...'
  for _doc in `find . -type f -name "*.md"`; do
    install -Dm 644 $_doc "$pkgdir/usr/share/doc/bitc/$_doc"
  done

  msg 'Installing...'
  install -dm 755 "$pkgdir/usr/share/bitc"
  find . -mindepth 1 -maxdepth 1 -exec \
    cp -dpr --no-preserve=ownership '{}' "$pkgdir/usr/share/bitc/" \;

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
