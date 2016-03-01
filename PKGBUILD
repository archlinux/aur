# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Paul Mattal <paul@archlinux.org>

pkgname=lirc-irdroid
pkgver=0.8.7
pkgrel=1
pkgdesc="Linux Infrared Remote Control utils (irdroid version)"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.lirc.org/"
license=('GPL')
depends=('alsa-lib' 'libx11' 'libftdi-compat' 'libirman')
# makedepends=('help2man' 'alsa-lib' 'libx11' 'libftdi-compat' 'libirman' 'libxslt' 'python')
# optdepends=('python: for lirc-setup, irdb-get and pronto2lirc')
provides=('lirc' 'lirc-utils')
conflicts=('lirc' 'lirc-utils')
replaces=('lirc' 'lirc-utils')
backup=('etc/lirc/lirc_options.conf' 'etc/lirc/lircd.conf' 'etc/lirc/lircmd.conf')
install=lirc.install
source=("lirc.tar.gz::http://www.irdroid.com/wp-content/plugins/download-monitor/download.php?id=16"
        lirc.logrotate
        lirc.tmpfiles
        lircd.service)
md5sums=('dba13e4d2113129abd98ea6548ba6183'
         '3deb02604b37811d41816e9b4385fcc3'
         'febf25c154a7d36f01159e84f26c2d9a'
         '64e7e7d4a6befe57c6e42777fdf0a36f')

build() {
  cd "${srcdir}/irtoy"

  ./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc --localstatedir=/var \
    --with-transmitter --with-driver=usb_irtoy --enable-sandboxed
  make
}

package() {
  cd "${srcdir}/irtoy"

  # dirtyfix: For some reason the "make install" fails if this directory does
  # not exist (it tries to remove it)
  mkdir -p "${pkgdir}/var/run/lirc"

  make DESTDIR="${pkgdir}" install

  install -Dm644 "${srcdir}"/lirc.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/lirc.conf
  install -Dm644 "${srcdir}"/lirc.logrotate "${pkgdir}"/etc/logrotate.d/lirc
  install -Dm644 "${srcdir}"/lircd.service "${pkgdir}"/usr/lib/systemd/system/lircd.service

  rmdir "${pkgdir}"/var/{run/lirc/,run/,}
}
