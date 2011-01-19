# Maintainer: Marti Raudsepp <marti@juffo.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>

pkgname=python-psycopg2-git
pkgver=20101209
pkgrel=1
pkgdesc="A PostgreSQL database adapter for the Python programming language."
arch=('i686' 'x86_64')
url="http://initd.org/projects/psycopg2"
options=(!strip) # to facilitate debugging of git builds
license=('LGPL3')
depends=('python2' 'postgresql-libs>=8.4.1')
conflicts=('python-psycopg2')
provides=('python-psycopg2=2.3.2')

_gitroot=git://luna.dndg.it/public/psycopg2.git
_gitname=psycopg2
_gitbranch=python2

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname -b $_gitbranch
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
  #git branch $_gitbranch

  export CFLAGS='-ggdb'
  python2 setup.py install --root="$pkgdir"
}
