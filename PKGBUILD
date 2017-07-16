# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=amule-daemon
pkgver=r10990
pkgrel=3
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
makedepends=('boost')
conflicts=('amule')
optdepends=('kamule: AmuleGUI for KDE')
source=("http://amule.sourceforge.net/tarballs/aMule-SVN-${pkgver}.tar.bz2"
        'amuled.service'
        'amuled@.service'
        'amulewebd.service'
        'amule.sysuser'
        'amule.tmpfiles'
        )
sha256sums=('215d65df096ecdd3f420d9b0e7b0f180c9345e7f386a8aaa45c9205f820f7c63'
            '835a1058ba926e4c0cfcfbd9ac2266abd057753fdf85f7bb9da7e217432e7e56'
            '52824abdd4724db7c8c4bfc05779849c06de04b4795b3d77c98de1baa3a0babc'
            'f50c46605d3ae977913f4dcf0c7405e0bdc84322d1fc877ae851706f0e1ae5fd'
            'bc870ebde3c5e009605ca76435790ea260a848160db643bf37e4f9de48b5e56c'
            '5a27c4c74640975447cf0d7826a1287155a6736bd7f9842eedc6d8af0378bba3'
            )
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
    --enable-alcc \
    --enable-amule-daemon \
    --enable-amulecmd \
    --enable-fileview \
    --enable-optimize \
    --enable-upnp \
    --enable-webserver \
    --enable-mmap \
    --with-boost=/usr/include \
    --with-toolkit=base \
    --with-wx-config=/usr/bin/wx-config-base

  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install

  install -Dm755 build/src/utils/fileview/mulefileview "${pkgdir}/usr/bin/mulefileview"
  install -Dm755 "aMule-SVN-${pkgver}/src/utils/scripts/mldonkey_importer.pl" "${pkgdir}/usr/share/amule/mldonkey_importer.pl"
  install -Dm755 "aMule-SVN-${pkgver}/src/utils/scripts/kadnodescreate.pl" "${pkgdir}/usr/share/amule/kadnodescreate.pl"

  install -Dm644 "${srcdir}/amuled.service" "${pkgdir}/usr/lib/systemd/system/amuled.service"
  install -Dm644 "${srcdir}/amuled@.service" "${pkgdir}/usr/lib/systemd/user/amuled.service"
  install -Dm644 "${srcdir}/amulewebd.service" "${pkgdir}/usr/lib/systemd/system/amuleweb.service"
  install -Dm644 "${srcdir}/amule.sysuser" "${pkgdir}/usr/lib/sysusers.d/amule.conf"
  install -Dm644 "${srcdir}/amule.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/amule.conf"

  rm -fr "${pkgdir}/usr/share/"{pixmaps,applications}
}
