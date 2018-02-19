# Maintainer: Gabriel Fornaeus <gf@hax0r.se>
# Contributor: kaptoxic
pkgname=clipbored-git
pkgver=r67.2e1a3ec
pkgrel=1
pkgdesc="Daemon that collects all content from the X clipboard buffers, use\
         with dmenu"
arch=('any')
url="http://github.com/trapd00r/clipbored"
license=('GPL2')
depends=('perl' 'xclip')
optdepends=('dmenu: for the scripts; dmenurl and dmenuclip')
makedepends=('git')
source=()

_gitroot="git://github.com/trapd00r/clipbored"
_gitname="clipbored"

pkgver() {
  cd $srcdir/$_gitname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  {
    rm blib/README
    perl Makefile.PL &&
    make ; } || return 1

}

package() {
  cd "$srcdir/$_gitname-build"

  mkdir -p ${pkgdir}/usr/bin

  make install || return 1
}


