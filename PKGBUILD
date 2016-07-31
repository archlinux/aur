# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=amule-daemon
pkgver=r10941
pkgrel=1
pkgdesc='An eMule-like client for the eD2k and Kademlia p2p networks. (Only Daemon, CLI tools and Webserver)'
url='http://www.amule.org'
arch=('i686' 'x86_64' 'armv7h')
license=('GPL')
depends=('wxbase-light'
         'crypto++'
         'libupnp'
         'libpng'
         'boost-libs'
         )
makedepends=('ccache'
             'boost'
             )
conflicts=('amule')
optdepends=('kamule: AmuleGUI for KDE')
source=("http://amule.sourceforge.net/tarballs/aMule-SVN-${pkgver}.tar.bz2"
        'amuled.service'
        'amuled@.service'
        'amuleweb.service'
        'amule.sysuser'
        )
sha1sums=('baf78a53dcdf00f0eb161adfd110cfa7c2b14f03'
          '3a2b451c3a35ab1745dd88726fe1454bc1227542'
          '4c4638e39f01c782e0e32d950fd29b4a6f4a398a'
          '128049ba8dce9dedc16357b7027736d99d583761'
          '266dd97212b5e269f6c9b0665880cd76e68d83ea')
install=amule-daemon.install

prepare() {
  mkdir -p build

  cd "aMule-SVN-${pkgver}"
  ./autogen.sh
}

build() {
  cd build
  ../"aMule-SVN-${pkgver}"/configure \
    --prefix=/usr \
    --disable-monolithic \
    --enable-{alcc,amule-daemon,amulecmd,ccache,fileview,optimize,upnp,webserver,mmap} \
    --with-boost=/usr/include \
    --with-toolkit=base \
    --with-wx-config=/usr/lib/wx/config/base-unicode-3.0
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install

  install -Dm755 build/src/utils/fileview/mulefileview "${pkgdir}/usr/bin/mulefileview"
  install -Dm755 "aMule-SVN-${pkgver}/src/utils/scripts/mldonkey_importer.pl" "${pkgdir}/usr/share/amule/mldonkey_importer.pl"
  install -Dm755 "aMule-SVN-${pkgver}/src/utils/scripts/kadnodescreate.pl" "${pkgdir}/usr/share/amule/kadnodescreate.pl"

  install -Dm644 "${srcdir}/amuled.service" "${pkgdir}/usr/lib/systemd/system/amuled.service"
  install -Dm644 "${srcdir}/amuled@.service" "${pkgdir}/usr/lib/systemd/system/amuled@.service"
  install -Dm644 "${srcdir}/amuleweb.service" "${pkgdir}/usr/lib/systemd/system/amuleweb.service"
  install -Dm644 "${srcdir}/amule.sysuser" "${pkgdir}/usr/lib/sysusers.d/amule.conf"

  rm -fr "${pkgdir}/usr/share/"{pixmaps,applications}
}
