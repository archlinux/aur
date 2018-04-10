# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=curvedns-git
pkgver=0.87.r11.gb5a7619
pkgrel=1
pkgdesc="A DNSCurve forwarding name server"
arch=('i686' 'x86_64')
url="https://github.com/curvedns/curvedns"
license=('BSD')
depends=('glibc' 'libev')
makedepends=('git')
provides=('curvedns')
conflicts=('curvedns')
source=("git+https://github.com/curvedns/curvedns.git")
sha256sums=('SKIP')


pkgver() {
  cd "curvedns"

  _tag=$(git tag -l --sort -v:refname | head -n1 | sed 's/curvedns-//')
  _rev=$(git rev-list --count curvedns-$_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash"
}

build() {
  cd "curvedns"

  ./configure.nacl

  ./configure.curvedns
  echo $CFLAGS > "nacl/build/work/curvedns/cflags"
  ./configure.curvedns
  make
}

package() {
  cd "curvedns"

  install -Dm755 "curvedns" "$pkgdir/usr/bin/curvedns"
  install -Dm755 "curvedns-keygen" "$pkgdir/usr/bin/curvedns-keygen"
  install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
