# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=cyberscript
pkgver=0.3
pkgrel=1
pkgdesc='A fast, efficient, and concurrent scripting language'
arch=('x86_64')
url='https://cyberscript.dev/'
license=('MIT')
depends=('glibc')
makedepends=('git' 'zig')
options=('!debug')
_commit='13a7bef28a5dcc766e0694ce8d053b3dc0d9812e'
source=("$pkgname::git+https://github.com/fubark/cyber#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  # delete "latest" tag
  git tag -d latest >& /dev/null

  git describe --tags | sed 's/^v//'
}

build() {
  cd "$pkgname"

  # set env vars
  export BUILD="$(git rev-list --count HEAD)"
  export COMMIT="$(git rev-parse --short HEAD)"

  zig build cli \
    -Doptimize=ReleaseFast \
    -Dtarget="$CARCH-linux-gnu" \
    -Dcpu=baseline
}

package() {
  cd "$pkgname"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" zig-out/bin/cyber

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  cp -vr docs examples "$pkgdir/usr/share/doc/$pkgname"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
