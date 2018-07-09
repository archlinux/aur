# Contributor: ShadowKyogre <shadowkyogre.public@gmail.com>
# The package based on "http://repos.archlinux.org/wsvn/community/menumaker/repos/community-i686/PKGBUILD".
# FIXME: submit these patches upstream

pkgname=menumaker-compiz
pkgver=0.99.10
pkgrel=1
pkgdesc="Heuristics-driven menu generator for Deskmenu, FluxBox, IceWM, OpenBox, WindowMaker and XFCE. Now with Compiz, MyGTKMenu, urxvt, and roxterm support."
arch=('i686' 'x86_64')
url="http://menumaker.sourceforge.net/"
license=('BSD')
depends=('python')
provides=('menumaker')
conflicts=('menumaker')
source=(
  "http://downloads.sourceforge.net/${provides}/${provides}-${pkgver}.tar.gz"
  add-compiz-and-mygtkmenu.patch
  added-terminals.patch
  pekwm-theme-menu.patch
  Compiz.py
  MyGTKMenu.py
)

prepare() {
  cd "${srcdir}/${provides}-${pkgver}"
  patch -Np1 -i "${srcdir}/add-compiz-and-mygtkmenu.patch" || return 1
  patch -Np1 -i "${srcdir}/added-terminals.patch" || return 1
  patch -Np1 -i "${srcdir}/pekwm-theme-menu.patch" || return 1
  cp "${srcdir}/Compiz.py" "${srcdir}/${provides}-${pkgver}/MenuMaker"
  cp "${srcdir}/MyGTKMenu.py" "${srcdir}/${provides}-${pkgver}/MenuMaker"
  # sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2\nimport sys; sys.path = ["/usr/lib/menumaker"] + sys.path|' ./mmaker
  # msg "Adjusting for python reconfig"
}

build() {
  cd "${srcdir}/${provides}-${pkgver}"
  ./configure --prefix=/usr --infodir=/usr/share/info --with-python=/usr/bin/python
  make -j1 || return 1
}

package() {
  cd "${srcdir}/${provides}-${pkgver}"
  make "DESTDIR=${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${provides}/license"
  rm "${pkgdir}/usr/share/info/dir"
}

md5sums=('7d63d39e497cb5779d598b06ff357e4d'
         '322b7416ab432f9a34cf526e64b35ebc'
         'af141845c205aff8522bee01a361a8b5'
         '185fce2f6cb463b120b386b6ddb16703'
         'f9d52fcfe857dc875437e4669b4929df'
         '88d96bf417641e463fc4b2ccb9553dae')
