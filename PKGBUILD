# Maintainer: strata <strata@dropswitch.net>
pkgname=brightness-git
pkgver=20140522
pkgrel=1
pkgdesc="Brightness Controller - allows you to control brightness of primary and secondary display"
arch=('any')
url="http://github.com/lordamit/Brightness"
license=('GPLv3')
depends=('python2' 'wxpython' 'wxgtk' 'python2-pyside')
makedepends=('git')
source=('brightness.run')
md5sums=('6a99d9ba7e08f57d3614c63654cadcb8')

_gitroot='https://github.com/lordamit/Brightness'
_gitname='Brightness'

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

  #
  # BUILD HERE
  #

  sed -i 's;#!/usr/bin/python;#!/usr/bin/python2;' src/init.py
}

package() {
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/lib/brightness
  cp -r ${srcdir}/${_gitname}-build/src/* ${pkgdir}/usr/lib/brightness
  install -m 755 ../brightness.run ${pkgdir}/usr/bin/brightness
}

# vim:set ts=2 sw=2 et:
