# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=cyberscript
pkgver=0.2
pkgrel=1
pkgdesc='A fast, efficient, and concurrent scripting language'
arch=('x86_64')
url='https://cyberscript.dev/'
license=('MIT')
depends=('glibc')
makedepends=('git' 'zigup')
options=('!debug')
_zigver="0.11.0-dev.1580+a5b34a61a"
_commit='7e529c5c79d13b6c803d0528b43433c6a0ac095c'
source=("$pkgname::git+https://github.com/fubark/cyber#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  # delete "latest" tag
  git tag -d latest >& /dev/null

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"

  zigup fetch "$_zigver"
}

build() {
  cd "$pkgname"

  # set env vars
  export BUILD="$(git rev-list --count HEAD)"
  export COMMIT="$(git rev-parse --short HEAD)"

  zigup run "$_zigver" build cli \
    -Doptimize=ReleaseFast \
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
