# Maintainer: Runney Wu <an9wer@gmail.com>

_commit=db6093f
_pkgname=dmenu
pkgname=an9wer-$_pkgname
pkgver=4.9.r5.gdb6093f
pkgrel=1
pkgdesc="An efficient dynamic menu for X"
url="https://tools.suckless.org/dmenu/"
arch=('x86_64')
license=('MIT')
groups=('an9wer-suckless')
makedepends=('git')
depends=('libx11' 'libxinerama' 'libxft' 'an9wer-suckless-rebuild>=0.1.3')
install=$pkgname.install
source=("$_pkgname::git://git.suckless.org/dmenu")
md5sums=('SKIP')

prepare() {
  cd "$_pkgname"
  cp config.def.h config.h
}

pkgver() {
  cd "$_pkgname"
  git checkout "$_commit" &> /dev/null
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  make
}

package() {
  cd "$_pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -m644 -D README  "$pkgdir/usr/share/doc/$_pkgname/README"
  # Source codes
  install -m644 -D -t "$pkgdir/usr/src/$_pkgname" \
    arg.h config.def.h config.mk dmenu.1 dmenu.c drw.c drw.h \
    LICENSE Makefile README stest.1 stest.c util.c util.h
  install -m755 -D -t "$pkgdir/usr/src/$_pkgname" dmenu_path dmenu_run 
}
