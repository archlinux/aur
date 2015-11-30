# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=amule-daemon
pkgver=10871
pkgrel=1
pkgdesc='An eMule-like client for the eD2k and Kademlia p2p networks. (Only Daemon, CLI tools and Webserver)'
url='http://www.amule.org'
arch=('i686' 'x86_64' 'armv7h')
license=('GPL')
depends=('wxbase2.8' 'crypto++' 'libupnp' 'libpng')
makedepends=('boost')
conflicts=('amule')
optdepends=('kamule: AmuleGUI for KDE')
source=("http://amule.sourceforge.net/tarballs/aMule-SVN-r${pkgver}.tar.bz2"
        'amuled.service'
        'amuled@.service'
        'amuleweb.service'
        'amule.sysuser')
sha1sums=('97dc76ec98ba4cac2f2d9cb083b865fc152acd0c'
          '3a2b451c3a35ab1745dd88726fe1454bc1227542'
          '4c4638e39f01c782e0e32d950fd29b4a6f4a398a'
          '128049ba8dce9dedc16357b7027736d99d583761'
          '266dd97212b5e269f6c9b0665880cd76e68d83ea')
options=('!ccache')
install=amule-daemon.install

prepare() {
  cd "aMule-SVN-r${pkgver}"
  sed -e 's|Add(Debug)LogLineM()|Add(Debug)LogLineM()\nDEFINE_LOCAL_EVENT_TYPE(MULE_EVT_LOGLINE)|' -i src/LoggerConsole.cpp
  ./autogen.sh
}

build() {
  cd "aMule-SVN-r${pkgver}"
  ./configure \
    --prefix=/usr \
    --disable-{monolithic,debug} \
    --enable-{alcc,amule-daemon,amulecmd,ccache,fileview,optimize,upnp,webserver,mmap} \
    --with-toolkit=base \
    --with-wxversion=2.8 \
    --with-wx-config=/usr/lib/wx/config/base-unicode-release-2.8
  make
}

package() {
  cd "aMule-SVN-r${pkgver}"
  make DESTDIR="${pkgdir}" install

  install -Dm755 src/utils/fileview/mulefileview "${pkgdir}/usr/bin/mulefileview"
  install -Dm755 src/utils/scripts/mldonkey_importer.pl "${pkgdir}/usr/share/amule/mldonkey_importer.pl"
  install -Dm755 src/utils/scripts/kadnodescreate.pl "${pkgdir}/usr/share/amule/kadnodescreate.pl"

  install -Dm644 ../amuled.service "${pkgdir}/usr/lib/systemd/system/amuled.service"
  install -Dm644 ../amuled@.service "${pkgdir}/usr/lib/systemd/system/amuled@.service"
  install -Dm644 ../amuleweb.service "${pkgdir}/usr/lib/systemd/system/amuleweb.service"
  install -Dm644 ../amule.sysuser "${pkgdir}/usr/lib/sysusers.d/amule.conf"

  rm -fr "${pkgdir}/usr/share/"{pixmaps,applications}
}
