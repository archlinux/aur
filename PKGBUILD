# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Wes Brewer <brewerw@gmail.com>

pkgname=acetoneiso2
pkgver=2.3
pkgrel=12
pkgdesc="An all in one ISO tool (bin mdf nrg img daa dmg cdi b5i bwi pdi iso)"
arch=('x86_64')
url="https://sourceforge.net/projects/acetoneiso"
license=('GPL3')
depends=('fuseiso' 'cdrdao' 'cdrtools' 'dvd+rw-tools' 'gnupg' 'pinentry' 'mplayer' 'phonon-qt5' 'qt5-webkit')
optdepends=("p7zip: for ISO compress/decompress support")
conflicts=('acetoneiso')
install=${pkgname}.install
source=(https://downloads.sourceforge.net/acetoneiso/AcetoneISO/AcetoneISO%202.3/acetoneiso_${pkgver}.tar.gz)
md5sums=('225f7af687016690ff28b9771a1ce179')
sha256sums=('ea1e6f285d23f08892ceb9ec336040b33b199fedf42881ef1374ca9f279a0768')

prepare() {
  cd acetoneiso_${pkgver}/acetoneiso

  sed -i 's#<Phonon/#<phonon/#' sources/*
# Port to Qt5 https://www.mail-archive.com/debian-bugs-dist@lists.debian.org/msg1563802.html
  sed -i 's/QtGui/QtWidgets/' sources/*
  sed -i 's/getInteger/getInt/' sources/*
  sed -i 's/WFlags/WindowFlags/' sources/*
  sed -i 's/webkit/webkitwidgets/' acetoneiso.pro
  sed -i 's/TARGET = /TARGET = acetoneiso/' acetoneiso.pro
  sed -i 's/QT += phonon/LIBS += -lphonon4qt5/' acetoneiso.pro
  sed -i 's@INCLUDEPATH.*$@& /usr/include/phonon4qt5@' acetoneiso.pro

  # Remove malware from loading in the Updates tab, due to an expired domain being captured.
  sed -i 's#http://www.acetoneteam.org/clients.html##' ui/acetoneiso.ui
}

build() {
  cd acetoneiso_${pkgver}/acetoneiso

  qmake-qt5
  make
}

package() {
  cd acetoneiso_${pkgver}/acetoneiso

  make INSTALL_ROOT="${pkgdir}" install
}
