# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Wes Brewer <brewerw@gmail.com>

pkgname=acetoneiso2
_pkgname=acetoneiso
pkgver=2.4
pkgrel=1
pkgdesc="An all in one ISO tool (bin mdf nrg img daa dmg cdi b5i bwi pdi iso)"
arch=('x86_64')
url="https://sourceforge.net/projects/acetoneiso"
license=('GPL3')
depends=('fuseiso' 'cdrdao' 'cdrtools' 'dvd+rw-tools' 'gnupg' 'pinentry' 'mplayer' 'phonon-qt5' 'qt5-webkit' 'md4c')
optdepends=("p7zip: for ISO compress/decompress support")
conflicts=('acetoneiso')
install=${pkgname}.install
source=("${_pkgname}-${pkgver}.tar.gz::http://deb.debian.org/debian/pool/main/a/${_pkgname}/${_pkgname}_${pkgver}.orig.tar.gz"
              'acetoneiso-2.4-deb-add_manpage.patch'
			  'acetoneiso-2.4-mga-youtube-metacafe.patch'
			  'acetoneiso-2.4-deb-remove_defunct_homepage.patch')
sha256sums=('5ac6038fad5ebdd9832aed1a9d88e5fbc6dabf648de16324c4e303c564f23ba0'
                       '33cb44e86f32b5a78e226e5bcc53ffa2349c499321c627b273e35bcefd8663ee'
					   'dd56ea08177d69596a8451c62e448594d66c8d2d6313072bf71cb8fcd013b690'
					   '715f8dc331ced1f17501e6489202237e4bcb7df760a9b2a3c2aa02bce6564f36')

prepare() {
  
  rm -rf ${_pkgname}${pkgver}/${_pkgname}
  tar -xzf ${_pkgname}-${pkgver}.tar.gz
  cd ${_pkgname}${pkgver}/${_pkgname}
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
  # apply patches
  patch -Np1 -i ../../acetoneiso-2.4-deb-add_manpage.patch
  patch -Np1 -i ../../acetoneiso-2.4-mga-youtube-metacafe.patch
  patch -Np1 -i ../../acetoneiso-2.4-deb-remove_defunct_homepage.patch
}

build() {
  cd ${_pkgname}${pkgver}/${_pkgname}

  qmake-qt5
  make
}

package() {
  cd ${_pkgname}${pkgver}/${_pkgname}

  make INSTALL_ROOT="${pkgdir}" install
}
