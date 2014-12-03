# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=gpicsync-svn
pkgver=965
pkgrel=1
pkgdesc='Automatically geocode pictures from your camera and a GPS track log'
arch=('any')
url="http://code.google.com/p/gpicsync/"
license=('GPL2')
depends=('python2' 'python2-pillow' 'python2-unidecode' 'wxpython')
makedepends=('svn')
install=$pkgname.install
source=('gpicsync' 'gpicsync.desktop')
md5sums=('7bb84135e4b289628d9dd65b8c05d897'
         'a5d4ffa8df81587674d2f4d2b178086f')

_svntrunk=http://gpicsync.googlecode.com/svn/trunk/
_svnmod=gpicsync-read-only

prepare() {
  cd "${srcdir}"
  msg "Connecting to SVN server...."

  if [[ -d "$_svnmod/.svn" ]]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting build..."

  rm -rf "${srcdir}"/$_svnmod-build
  svn export "${srcdir}"/$_svnmod "${srcdir}"/$_svnmod-build
  cd "${srcdir}"/$_svnmod-build

  for file in $(find . -name '*.py' -print); do
    sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
    sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done
}

package() {
  cd "${srcdir}"/$_svnmod-build

  install -Dm755 "${srcdir}"/gpicsync "${pkgdir}"/usr/bin/gpicsync
  install -Dm644 "${srcdir}"/gpicsync.desktop "${pkgdir}"/usr/share/applications/gpicsync.desktop
  install -Dm644 gpicsync.ico "${pkgdir}"/usr/share/pixmaps/gpicsync.ico
  cp -r locale "${pkgdir}"/usr/share
  install -d "${pkgdir}"/usr/share/gpicsync
  cp {*.py,*.jpg,*.ico,*.conf} "${pkgdir}"/usr/share/gpicsync
}
