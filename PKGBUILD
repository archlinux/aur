# Maintainer: Thomas <python-libseccomp AT spam DOT b2ag DOT de>
# Contributor: Chocobo1 <chocobo1 AT archlinux DOT net>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Daniel Micay <danielmicay@gmail.com>

pkgname=python-libseccomp-git
pkgver=2.3.3.r121.g8ad3638
pkgrel=1
pkgdesc="Python bindings for libseccomp"
arch=('i686' 'x86_64')
url="https://github.com/seccomp/libseccomp"
license=('LGPL')
depends=('python')
makedepends=('git' 'cython')
provides=('python-libseccomp')
conflicts=('python-libseccomp')
source=("git+https://github.com/seccomp/libseccomp.git")
sha256sums=('SKIP')


pkgver() {
  cd "libseccomp"

  _tag=$(git tag -l --sort -v:refname | sed -n '1,1{s/v//p}')
  _rev=$(git rev-list --count v$_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash"
}

build() {
  cd "libseccomp"

  ./autogen.sh
  ./configure --enable-python --prefix="/usr"
  make
}

package() {
  cd "libseccomp"

  make DESTDIR="$pkgdir" install
  rm -r "$pkgdir/usr/bin"
  rm -r "$pkgdir/usr/include"
  rm -r "$pkgdir/usr/share"
  rm -r "$pkgdir/usr/lib/pkgconfig"
  rm "$pkgdir/usr/lib/libseccomp"*
  rm "$pkgdir/usr/lib/python"*"/site-packages/libseccomp/install_files.txt"
  strip "$pkgdir/usr/lib/python"*"/site-packages/libseccomp/"*".so"
}
