# Maintainer: Mort Yao <soi@mort.ninja>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>

pkgname=ocaml-cairo-git
pkgver=20150609
pkgrel=1
pkgdesc="OCaml bindings for cairo"
arch=('i686' 'x86_64')
url="http://cairographics.org/cairo-ocaml/"
license=('LGPL2')
depends=('ocaml' 'cairo' 'lablgtk2' 'libsvg-cairo')
makedepends=('git')
provides=('ocaml-cairo')
source=(META)
md5sums=('dbd5aeb38b883d7e0d95f2c9fe108eb9')

_gitroot="git://anongit.freedesktop.org/cairo-ocaml.git"
_gitname="cairo-ocaml"

build() {
  cd "$srcdir"

  msg "Connecting to GIT server..."

  if [ -d "$srcdir/$_gitname" ]; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cp -rf "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  # configure
  aclocal -I support || return 1
  autoconf || return 1
  ./configure --prefix=/usr || return 1

  # copy few files
  cp /usr/lib/ocaml/lablgtk2/pango.ml* src/
  cp /usr/lib/ocaml/lablgtk2/gaux.ml* src/

  # build
  make all || return 1
}

package() {
  cd "$srcdir/$_gitname-build"

  make DESTDIR="$pkgdir" install || return 1
  install -m 644 "$srcdir/META" "$pkgdir/usr/lib/ocaml/cairo/"
}
