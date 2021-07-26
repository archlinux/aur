# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=amule-daemon
pkgver=r11121
_pkgcomm=d6693fb
pkgrel=1
pkgdesc='An eMule-like client for the eD2k and Kademlia p2p networks. (Only Daemon, CLI tools and Webserver)'
url='http://www.amule.org'
arch=('x86_64' 'armv7h')
license=('GPL')
depends=('wxbase-light'
         'crypto++'
         'libupnp'
         'libpng'
         'boost-libs'
         )
makedepends=('boost'
             'autoconf2.13')
conflicts=('amule')
optdepends=('kamule: AmuleGUI for KDE')
source=("aMule-SVN-${pkgver}.tar.bz2::http://repo.or.cz/w/amule.git/snapshot/${_pkgcomm}.tar.gz"
        'amuled.service'
        'amuled@.service'
        'amuleweb.service'
        'amule.sysuser'
        'amule.tmpfiles'
        )
sha256sums=('f1371c1915fd01214a80d9aae3c414ecafc2fb40bbdeb1553c541133ce041dc2'
            '339d59211bd914dfa43c6c54b68e2715f9648de3220d712c01c004eda19a5b7a'
            '52824abdd4724db7c8c4bfc05779849c06de04b4795b3d77c98de1baa3a0babc'
            'f50c46605d3ae977913f4dcf0c7405e0bdc84322d1fc877ae851706f0e1ae5fd'
            'bc870ebde3c5e009605ca76435790ea260a848160db643bf37e4f9de48b5e56c'
            '6af2edd8a1a9cc270f7d79e332e54d84c01e1c0b88f0ee72a13df879facc8df4'
            )
install=amule-daemon.install

prepare() {
  mkdir -p build

  cd "amule-${_pkgcomm}"
  sed -e 's|^autoconf|autoconf-2.13|g' \
        -i autogen.sh

  sed '35s|^|#|g' \
    -i configure.ac

  ./autogen.sh
}

build() {
  cd build
  ../"amule-${_pkgcomm}/configure" \
    --prefix=/usr \
    --disable-monolithic \
    --enable-alcc \
    --enable-amule-daemon \
    --enable-amulecmd \
    --enable-fileview \
    --enable-optimize \
    --enable-upnp \
    --enable-webserver \
    --enable-mmap \
    --with-boost \
    --with-toolkit=base \
    --with-wx-config=/usr/bin/wx-config-base

  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install

  install -Dm755 build/src/utils/fileview/mulefileview "${pkgdir}/usr/bin/mulefileview"
  install -Dm755 "amule-${_pkgcomm}/src/utils/scripts/mldonkey_importer.pl" "${pkgdir}/usr/share/amule/mldonkey_importer.pl"
  install -Dm755 "amule-${_pkgcomm}/src/utils/scripts/kadnodescreate.pl" "${pkgdir}/usr/share/amule/kadnodescreate.pl"

  install -Dm644 "${srcdir}/amuled.service" "${pkgdir}/usr/lib/systemd/system/amuled.service"
  install -Dm644 "${srcdir}/amuled@.service" "${pkgdir}/usr/lib/systemd/user/amuled.service"
  install -Dm644 "${srcdir}/amuleweb.service" "${pkgdir}/usr/lib/systemd/system/amuleweb.service"
  install -Dm644 "${srcdir}/amule.sysuser" "${pkgdir}/usr/lib/sysusers.d/amule.conf"
  install -Dm644 "${srcdir}/amule.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/amule.conf"

  rm -fr "${pkgdir}/usr/share/"{pixmaps,applications}
}
