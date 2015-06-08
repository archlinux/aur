# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>

pkgname=xbat
pkgver=1.1.1
_pkgver=111
pkgrel=3
pkgdesc="A vertical scrolling shooter based on the arcade game Xevious"
arch=('i686' 'x86_64')
url="http://www.happypenguin.org/show?XBat"
license=('GPL')
depends=('libx11')
install="${pkgname}.install"
source=("http://archive.debian.org/debian/pool/main/x/xbat/xbat_1.11.orig.tar.gz"
        "${pkgname}-install.patch"
        "${pkgname}-fix-crash.patch"
        "${pkgname}.png"
        "${pkgname}.desktop")
md5sums=('87a156ca35a75c94b5617005e2b2ca99'
         '779cccc30bc296a2b1be967fe3acaa39'
         'd121acf42ff1392fd971aa273f7de700'
         'e5a716f92300e3f259746cb242f5d54e'
         'e787cb023de247912462216afd95b9c2')

build() {
  cd "${srcdir}/xbat-1.11.orig"

  # Apply a patch to create configure/make files
  # Downloaded from: http://www.identicalsoftware.com/ogs/1999/xbat.html
  patch -Np1 -i ../${pkgname}-install.patch

  # Fix crash when player death
  patch -Np1 -i ../${pkgname}-fix-crash.patch

  # Fix path to score files
  sed -i "s_\$(datadir)/Xbat/Score_/var/lib/Xbat/Score_" Makefile.in

  chmod 755 configure
  LIBS='-lm' ./configure -prefix=/usr
  make
}

package() {
  cd "${srcdir}/xbat-1.11.orig"

  # Install game files
  mkdir -p "${pkgdir}/usr/share/Xbat"
  cp -r Domo Image Map "${pkgdir}/usr/share/Xbat"
  install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"

  # Install score files
  mkdir -p "${pkgdir}/var/lib/Xbat/Score"
  chmod g+w "${pkgdir}/var/lib/Xbat/Score"
  chgrp games "${pkgdir}/var/lib/Xbat/Score"
  install -m664 -g games Score/* "${pkgdir}/var/lib/Xbat/Score"

  # Install a desktop entry
  install -Dm644 ../${pkgname}.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 ../${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install documentation
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 README* "${pkgdir}/usr/share/doc/${pkgname}"
}
md5sums=('8fa1f215abcae759113027bec14d3d28'
         '779cccc30bc296a2b1be967fe3acaa39'
         'd121acf42ff1392fd971aa273f7de700'
         'e5a716f92300e3f259746cb242f5d54e'
         'e787cb023de247912462216afd95b9c2')
