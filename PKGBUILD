# Contributor: ShadowKyogre <shadowkyogre@aim.com>
# The package based on "http://repos.archlinux.org/wsvn/community/menumaker/repos/community-i686/PKGBUILD".

pkgname=menumaker-compiz
pkgver=0.99.7
pkgrel=9
pkgdesc="Heuristics-driven menu generator for Deskmenu, FluxBox, IceWM, OpenBox, WindowMaker and XFCE. Now with Compiz, MyGTKMenu, urxvt, and roxterm support."
arch=('i686' 'x86_64')
url="http://menumaker.sourceforge.net/"
license=('BSD')
depends=('python2')
provides=('menumaker')
conflicts=('menumaker')
source=(http://downloads.sourceforge.net/${provides}/${provides}-${pkgver}.tar.gz menumaker.patch Compiz.py MyGTKMenu.py)

md5sums=('a54cb7ec32db1bc8e04218e0be727b1e'
         '3b55790ad700c556e4d62c0e83904b8b'
         'f9d52fcfe857dc875437e4669b4929df'
         '88d96bf417641e463fc4b2ccb9553dae')


build() {
  cd ${srcdir}/${provides}-${pkgver}
  patch -Np1 -i ../menumaker.patch || return 1
  cp ${srcdir}/Compiz.py ${srcdir}/${provides}-${pkgver}/MenuMaker
  cp ${srcdir}/MyGTKMenu.py ${srcdir}/${provides}-${pkgver}/MenuMaker
  sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2\nimport sys; sys.path = ["/usr/lib/menumaker"] + sys.path|' ./mmaker
  msg "Adjusting for python reconfig"
  ./configure --prefix=/usr --infodir=/usr/share/info --with-python=/usr/bin/python2
  make -j1 || return 1
}

package() {
  cd "${srcdir}/${provides}-${pkgver}"
  make DESTDIR=${pkgdir} install
  install -Dm644 COPYING ${pkgdir}/usr/share/licenses/${provides}/license
  rm ${pkgdir}/usr/share/info/dir
}
