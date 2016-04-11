# Maintainer: Jonah Bernhard <jonah.bernhard at gmail dot com>
pkgname=mlbviewer-svn
pkgver=r662
_pkgname=${pkgname%-svn}
pkgrel=2
pkgdesc="A collection of tools to view and listen to streaming baseball games from MLB.TV."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/mlbviewer"
license=('GPL2')
depends=('libconfig' 'curl' 'python2' 'rtmpdump')
makedepends=('subversion' 'git')
optdepends=('mpv: lightweight streaming media player'
            'python2-gdata: MLB classics')
conflicts=('mlbviewer')
provides=('mlbviewer')
install="${_pkgname}.install"
source=("${pkgname}::svn://svn.code.sf.net/p/mlbviewer/code/trunk"
        "mlbhls::git+https://github.com/tonycpsu/mlbtv-hls-nexdef#branch=experimental"
        "mlbviewer-60fps.patch")
sha1sums=('SKIP' 'SKIP' 'f3c3c29e1421f77fb047da9b43de84b756cb1009')


pkgver() {
  cd "$pkgname"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  # python2
  cd ${srcdir}/${pkgname}
  sed -i 's:#!/usr/bin/env python:#!/usr/bin/env python2:' *.py

  patch -p0 < $srcdir/mlbviewer-60fps.patch

  # build mlbhls for nexdef
  cd ${srcdir}/mlbhls
  make
}

package() {
  cd ${srcdir}/${pkgname}

  # create package structure
  install -d ${pkgdir}/usr/{bin,{lib,share/{doc,licenses}}/${_pkgname}}

  # install and symlink main executables
  for i in *.py; do
    install -m755 $i ${pkgdir}/usr/lib/${_pkgname}
    ln -s /usr/lib/${_pkgname}/$i ${pkgdir}/usr/bin/${i%.py}
  done

  # main program libs and tests
  cp -r MLBviewer test ${pkgdir}/usr/lib/${_pkgname}

  # mlbhls
  install -m755 ${srcdir}/mlbhls/mlbhls ${pkgdir}/usr/bin

  # documentation and license
  install -m644 MLBPLAY-HELP MiLB-HELP QUICK-START README REQUIREMENTS-2015.txt TOOLS ${pkgdir}/usr/share/doc/${_pkgname}
  install -m644 LICENSE.txt ${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE
}
