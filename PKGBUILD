# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer : Laurent Carlier <lordheavym@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Dieter Plaetinck <dieter@plaetinck.be>

pkgbase=uzbl
pkgname=('uzbl-core' 'uzbl-browser' 'uzbl-tabbed')
epoch=1
pkgver=0.9.1+95+g3a4c70ad
pkgrel=1
arch=('x86_64')
url="http://www.uzbl.org"
license=('GPL3')
makedepends=('git' 'python-setuptools' 'webkit2gtk')
_commit=3a4c70ad114b763f50a02c72ee4332dd20af033d  # next
source=("git+https://github.com/uzbl/uzbl.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgbase
  git describe --tags | sed 's/^v//;s/-/+/g'
}

build() {
  cd $pkgbase

  make PREFIX=/usr 

  # fake installation
  mkdir ${srcdir}/fakeinstall
  make DESTDIR=${srcdir}/fakeinstall PREFIX=/usr install
}

package_uzbl-core() {
  pkgdesc="Webpage interface component meant for integration with other tools and scripts"
  depends=('webkit2gtk')

  install -m755 -d ${pkgdir}/usr/{bin,share}
  install -m755 -d ${pkgdir}/usr/share/{man/man1,uzbl}

  mv -v ${srcdir}/fakeinstall/usr/bin/uzbl-core ${pkgdir}/usr/bin/

  mv -v ${srcdir}/fakeinstall/usr/share/uzbl/docs ${pkgdir}/usr/share/uzbl/
  mv -v ${srcdir}/fakeinstall/usr/share/man/man1/uzbl-core.1 ${pkgdir}/usr/share/man/man1
}

package_uzbl-browser() {
  pkgdesc="A complete browser experience based on uzbl-core"
  depends=('uzbl-core' 'socat' 'zenity' 'xclip' 'dmenu' 'python2' 'python-setuptools' 'python-six')

  install -m755 -d ${pkgdir}/usr/{bin,lib,share}
  install -m755 -d ${pkgdir}/usr/share/{applications,man/man1}

  mv -v ${srcdir}/fakeinstall/usr/bin/uzbl-browser ${pkgdir}/usr/bin/
  mv -v ${srcdir}/fakeinstall/usr/bin/uzbl-event-manager ${pkgdir}/usr/bin/
   
  mv -v ${srcdir}/fakeinstall/usr/lib/python3.6 ${pkgdir}/usr/lib
  mv -v ${srcdir}/fakeinstall/usr/share/man/man1/uzbl-browser.1 ${pkgdir}/usr/share/man/man1
  mv -v ${srcdir}/fakeinstall/usr/share/man/man1/uzbl-event-manager.1 ${pkgdir}/usr/share/man/man1
  mv -v ${srcdir}/fakeinstall/usr/share/{appdata,icons,uzbl} ${pkgdir}/usr/share/
  mv -v ${srcdir}/fakeinstall/usr/share/applications/uzbl-core.desktop ${pkgdir}/usr/share/applications
}

package_uzbl-tabbed() {
  pkgdesc="Tabbing manager providing multiple uzbl-browser instances in 1 window"
  depends=('uzbl-browser' 'pygtk')

  install -m755 -d ${pkgdir}/usr/{bin,share}
  install -m755 -d ${pkgdir}/usr/share/applications

  mv -v ${srcdir}/fakeinstall/usr/bin/uzbl-tabbed ${pkgdir}/usr/bin/
  mv -v ${srcdir}/fakeinstall/usr/share/applications/uzbl-tabbed.desktop ${pkgdir}/usr/share/applications
}
