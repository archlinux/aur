pkgname=retro-bzr
pkgver=453
pkgrel=1
pkgdesc="Retro is a portable, stack-based language with roots in Forth."
arch=('i686' 'x86_64')
url="http://retroforth.com"
license=('ISC')
makedepends=('bzr' 'python-docutils')
provides=('retro')
install=
source=()

_bzrtrunk=lp:retro-language
_bzrmod=retro

build() {
  cd "$srcdir"
  msg "Connecting to Bazaar server...."

  if [[ -d "$_bzrmod" ]]; then
    cd "$_bzrmod" && bzr pull "$_bzrtrunk" -r "$pkgver"
    msg "The local files are updated."
  else
    bzr branch "$_bzrtrunk" "$_bzrmod" -q -r "$pkgver"
  fi

  msg "Bazaar checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_bzrmod-build"
  cp -r "$srcdir/$_bzrmod" "$srcdir/$_bzrmod-build"
  cd "$srcdir/$_bzrmod-build"

  #
  # BUILD HERE
  #

  make clean
  make retro
  make libdocs
  make webdocs
}

pkgver() {
  cd "$srcdir/$_bzrmod"
  bzr revno
}

package() {
  mkdir -p $pkgdir/usr/{lib/retro,bin,share/{man/man1,retro,licenses/retro,doc/retro/library}}

  cd "$srcdir/$_bzrmod-build"
  
  gzip -c9 doc/retro.1 > $pkgdir/usr/share/man/man1/retro.1.gz
  xz -c9 LICENSE > $pkgdir/usr/share/licenses/retro/LICENSE.xz
  cat image/{meta,kernel}.rx | xz -c9 - > $pkgdir/usr/share/retro/core.rx.xz

  install -m755 retro $pkgdir/usr/bin/retro
  install -m644 retroImage $pkgdir/usr/share/retro

  cp www/docs/*.html $pkgdir/usr/share/doc/retro
  cp www/docs/library/*.html $pkgdir/usr/share/doc/retro/library
  cp library/* $pkgdir/usr/lib/retro
}

# vim:set ts=2 sw=2 et:
