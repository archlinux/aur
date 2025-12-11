# Maintainer: ilovemikael <itsmeguys2247 at gmail dot com>

# PKGBUILD 'forked' from luajit-git [https://aur.archlinux.org/packages/luajit-git] by
# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# needs dlopen!
pkgname=luajit-clang-git
pkgver=2.1.r305.g7152e154
pkgrel=1
pkgdesc="Just-In-Time (JIT) compiler for the Lua programming language - patched to compile with clang"
arch=('i686' 'x86_64')
url="https://luajit.org/"
license=('MIT')
depends=('gcc-libs')
makedepends=('git')
provides=("luajit=$pkgver")
conflicts=('luajit')
source=("git+https://luajit.org/git/luajit.git"
        'Makefile.patch')
b2sums=('SKIP' 'SKIP')

pkgver() {
  cd "luajit"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+ROLLING$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//;s/.ROLLING//'
}

prepare(){ 
	cd "luajit"
	patch -Np1 -i "$srcdir/Makefile.patch"
}

build() {
  cd "luajit"
  make -v TARGET_STRIP=" @:" amalg
}

package() {
  cd "luajit"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
  install -Dm644 "COPYRIGHT" -t "$pkgdir/usr/share/licenses/luajit"
}
