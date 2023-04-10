# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=astyle-git
pkgver=3.2.1.r1.g2e9fe14
pkgrel=1
pkgdesc="A free, fast, and small automatic code formatter"
arch=('i686' 'x86_64')
url="https://astyle.sourceforge.net/"
license=('MIT')
depends=('gcc-libs')
makedepends=('git')
provides=("astyle=$pkgver")
conflicts=('astyle')
options=('staticlibs')
source=("git+https://gitlab.com/saalen/astyle.git")
sha256sums=('SKIP')


pkgver() {
  cd "astyle"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "astyle"

  make -C "AStyle/build/gcc" release shared static
}

package() {
  cd "astyle"

  install -Dm755 "AStyle/build/gcc/bin/astyle" -t "$pkgdir/usr/bin"

  install -Dm644 "AStyle/build/gcc/bin"/libastyle.so.* -t "$pkgdir/usr/lib"
  install -Dm644 "AStyle/build/gcc/bin/libastyle.a" -t "$pkgdir/usr/lib"

  install -Dm644 "AStyle/doc"/* -t "$pkgdir/usr/share/doc/astyle"
  install -Dm644 "AStyle/LICENSE.md" -t "$pkgdir/usr/share/licenses/astyle"
}
