# Maintainer: TJM <tommy.mairo@gmail.com>
pkgname=libcorkipset-git
pkgver=r222.5ad149f
pkgrel=1
pkgdesc="A small C helper library for storing sets of IPv4 and IPv6 addresses"
arch=("x86_64" "x64")
url="https://github.com/rogers0/libcorkipset"
source=('git+https://github.com/rogers0/libcorkipset.git')
license=('BSD')
depends=('r' 'pkg-config' 'libcork')
makedepends=('git')
provides=('libcorkipset')
conflicts=('libcorkipset')
sha256sums=('SKIP')

_gitroot='https://github.com/rogers0/libcorkipset.git'
_gitname=libcorkipset

pkgver(){
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $srcdir

  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"

  for p in debian/patches/*.patch; do
    patch -p1 -i "$p"
  done

  sed -e 's%#include <ipset%#include <libcorkipset%' \
      -e 's%#include "ipset%#include "libcorkipset%' \
      -i include/ipset/*.h */*/*/*.c */*/*/*.c.in */*/*.c */*.c
  mv include/{,libcork}ipset
  git add -A
  git commit -m "Update: apply patch."
}


build() {
  cd "$srcdir"

  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

check(){
	cd "$srcdir/$_gitname-build/build"
	make test
}

package() {
  cd "$srcdir/$_gitname-build/build"
  make DESTDIR="$pkgdir/" install
  install -Dm644 "$srcdir"/$_gitname/LICENSE.txt "$pkgdir"/usr/share/licenses/$_gitname/LICENSE.txt
}

