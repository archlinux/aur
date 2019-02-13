# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: AppleBloom <rat.o.drat@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: riai <riai@bigfoot.com> Ben <ben@benmazer.net>

pkgname=pyqt3
pkgver=3.18.1
pkgrel=15
pkgdesc="A set of Python bindings for the Qt3 toolkit"
arch=('i686' 'x86_64')
url="http://www.riverbankcomputing.com/software/pyqt/intro"
depends=('python2-sip' 'qscintilla-qt3')
makedepends=('python2-sip418' 'sip418')
license=('GPL')
source=("http://downloads.sourceforge.net/project/pyqt/PyQt3/PyQt-x11-gpl-${pkgver}.tar.gz"
        "sip415_fix.patch"
        "sipbin_fix.patch")
md5sums=('f1d120495d1aaf393819e988c0a7bb7e'
         'd695dc23d2211a97d3631ec82d8afd67'
         '6cceabd8b41aa2514a7186a2589a4fb6')

_dir="PyQt-x11-gpl-${pkgver}"

prepare() {
  cd "$_dir"
  patch -p0 -i "${srcdir}/sip415_fix.patch"
  patch -p2 -i "${srcdir}/sipbin_fix.patch"
}

build() {
  cd "$_dir"
  export QTDIR=/usr
  export QMAKESPEC=/usr/share/qt3/mkspecs/linux-g++
  echo yes | python2 configure.py -b /usr/bin \
    -d /usr/lib/python2.7/site-packages \
    -v /usr/share/sip \
    INCDIR_QT=/usr/include/qt3
  make CXX="g++ -DANY=void -I/usr/include/python2.7/sip418"
}

package() {
  cd "$_dir"
  make DESTDIR=${pkgdir} install
}
