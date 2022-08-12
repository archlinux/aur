pkgname=geneweb-git
pkgver=20170321
pkgrel=2
pkgdesc="Genealogy Software"
arch=('i686' 'x86_64')
url="http://www.geneweb.org/"
license=('GPL')
groups=()
depends=('glibc')
makedepends=('git' 'ocaml' 'camlp5')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!makeflags)
install=geneweb.install
changelog=
# Makefile.fixed-install is a temporary hack until pull request
# https://github.com/geneweb/geneweb/pull/509 is merged
source=(gwd.conf gwd.service geneweb.install)
noextract=()
md5sums=('8219a070e2bbf6aaeeb9c0f42825720d'
         'a89d188febe37b82ab7d936a7cafccc2'
         '42c8da80f6b1e24f0cd3243840574d58')

_gitroot=https://github.com/geneweb/geneweb
_gitname=geneweb

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  ./configure
  make PREFIX=/usr opt
}

package() {
  cd "$srcdir/$_gitname-build"

  make PREFIX="$pkgdir/usr" MANDIR="$pkgdir/usr/share/man/man1" install

  install -D -m 644 "$srcdir/gwd.service" "$pkgdir/usr/lib/systemd/system/gwd.service"
  install -D -m 644 "$srcdir/gwd.conf" "$pkgdir/etc/conf.d/gwd"
}

# vim:set ts=2 sw=2 et:
