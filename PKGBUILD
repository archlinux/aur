# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=luajit-git
pkgver=2.1.r140.gc525bcb9
pkgrel=1
pkgdesc="Just-In-Time (JIT) compiler for the Lua programming language"
arch=('i686' 'x86_64')
url="https://luajit.org/"
license=('MIT')
depends=('gcc-libs')
makedepends=('git')
provides=("luajit=$pkgver")
conflicts=('luajit')
options=('staticlibs')
source=("git+https://luajit.org/git/luajit.git")
sha256sums=('SKIP')


pkgver() {
  cd "luajit"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+ROLLING$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//;s/.ROLLING//'
}

build() {
  cd "luajit"

  make TARGET_STRIP=" @:" amalg
}

package() {
  cd "luajit"

  make DESTDIR="$pkgdir" PREFIX="/usr" install
  install -Dm644 "COPYRIGHT" -t "$pkgdir/usr/share/licenses/luajit"
}
