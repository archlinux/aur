# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=cyberscript
pkgver=r432.g5c57431
pkgrel=1
pkgdesc='A fast, efficient, and concurrent scripting language'
arch=('x86_64')
url='https://cyberscript.dev/'
license=('MIT')
depends=('glibc')
makedepends=('git' 'zigup')
options=('!debug')
_commit='5c57431cecdf9b93f68b58d3f8c0f43662b38038'
source=("$pkgname::git+https://github.com/fubark/cyber#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname"

  zigup fetch master
}

build() {
  cd "$pkgname"

  # set env vars
  export BUILD="$(git rev-list --count HEAD)"
  export COMMIT="$(git rev-parse --short HEAD)"

  zigup run master build cli \
    -Drelease-fast \
    -Dtarget="$CARCH-linux-gnu" \
    -Dcpu=baseline
}

package() {
  cd "$pkgname"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" zig-out/cyber/cyber

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  cp -vr docs examples "$pkgdir/usr/share/doc/$pkgname"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
