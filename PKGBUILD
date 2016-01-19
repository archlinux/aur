# Maintainer: M0Rf30

pkgname=vdr-devel
pkgver=2.3.1
pkgrel=1
pkgdesc="'open' digital satellite receiver and timer controlled video disk recorder"
url="ftp://ftp.tvdr.de/vdr/Developer/"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('libcap' 'libjpeg-turbo' 'libsystemd' 'perl' 'ttf-font')
makedepends=('systemd') #libsystemd should be enough but the pkg-config file is missing in the libsystemd package
optdepends=('lirc-utils: remote control support'
            'ncurses: skincurses plugin'
            'xlogin: To start X11')
replaces=('runvdr-extreme')
conflicts=('runvdr-extreme' 'vdr')
provides=("vdr-api=2.2.0")
install='vdr.install'
source=("ftp://ftp.tvdr.de/vdr/Developer/vdr-$pkgver.tar.bz2"
        'MainMenuHooks-v1_0_2.diff::http://www.vdr-portal.de/index.php?page=Attachment&attachmentID=30330'
        '00-vdr.conf' '50-dvbsddevice.conf' '50-hello.conf' '50-pictures.conf' '50-rcu.conf'
        '60-create-dvb-device-units.rules'
        'gen-sddropin'
        'shutdown.sh'
        'shutdown-wrapper.c'
        'vdr.service'
        'vdr.sysuser')
backup=("etc/vdr/conf.avail/"50-dvb{s,h}ddevice.conf
        "etc/vdr/conf.avail/"50-{epgtableid0,hello,osddemo,pictures,rcu,skincurses,status,svdrpdemo}.conf
        "etc/vdr/conf.avail/"50-svc{cli,svr}.conf
        'etc/vdr/conf.d/00-vdr.conf'
        'var/lib/vdr/channels.conf'
        'var/lib/vdr/diseqc.conf'
        'var/lib/vdr/keymacros.conf'
        'var/lib/vdr/scr.conf'
        'var/lib/vdr/sources.conf'
        'var/lib/vdr/svdrphosts.conf')

prepare() {
  cd "${srcdir}/vdr-${pkgver}"

  echo 'CFLAGS      += -O3' > Make.config
  echo 'CXXFLAGS    += -O3' >> Make.config
  echo 'PREFIX       = /usr' >> Make.config
  echo 'LIBDIR       = /usr/lib/vdr/plugins' >> Make.config
  echo 'VDR_USER     = vdr' >> Make.config
  echo 'SDNOTIFY     = 1' >> Make.config
  echo 'LIRC_DEVICE  = /run/lirc/lircd' >> Make.config

  sed -i 's/NULL, 0, true/NULL, 0, OpenSubMenus/g' "$srcdir/MainMenuHooks-v1_0_2.diff"
  patch -p1 -i "$srcdir/MainMenuHooks-v1_0_2.diff"

  sed -i '/define DEPRECATED_VIDEOSYSTEM/d' device.h
  sed -i '/define DEPRECATED_VDR_CHARSET_OVERRIDE/d' vdr.c
}

build() {
  gcc -o shutdown-wrapper shutdown-wrapper.c

  cd "${srcdir}/vdr-${pkgver}"
  make
}

package() {
  for i in dvbsddevice hello pictures rcu; do
    install -Dm644 50-$i.conf "$pkgdir/etc/vdr/conf.avail/50-$i.conf"
  done

  install -Dm644 00-vdr.conf "$pkgdir/etc/vdr/conf.d/00-vdr.conf"
  install -Dm644 60-create-dvb-device-units.rules "$pkgdir/usr/lib/udev/rules.d/60-create-dvb-device-units.rules"
  install -Dm644 vdr.service "$pkgdir/usr/lib/systemd/system/vdr.service"

  install -Dm754 shutdown-wrapper "$pkgdir/usr/lib/vdr/bin/shutdown-wrapper"
  chgrp 666 "$pkgdir/usr/lib/vdr/bin/shutdown-wrapper"
  chmod u+s "$pkgdir/usr/lib/vdr/bin/shutdown-wrapper"

  install -Dm755 gen-sddropin "$pkgdir/usr/bin/vdr-gensddropin"
  install -Dm755 shutdown.sh "$pkgdir/usr/lib/vdr/bin/shutdown.sh"

  #Install sysuser config
  install -Dm644 ${srcdir}/vdr.sysuser "$pkgdir/usr/lib/sysusers.d/vdr.conf"

  for i in dvbhddevice epgtableid0 osddemo skincurses status svc{cli,svr} svdrpdemo; do
    echo "[$i]" > "$pkgdir/etc/vdr/conf.avail/50-$i.conf"
  done

  cd "${srcdir}/vdr-${pkgver}"
  mkdir -p "$pkgdir/var/lib/vdr"
  make DESTDIR="${pkgdir}" install

  mkdir -p "$pkgdir/usr/share/vdr/shutdown-hooks"

  chown -R 666:666 "$pkgdir/srv/vdr"
  chown -R 666:666 "$pkgdir/var/cache/vdr"
  chown -R 666:666 "$pkgdir/var/lib/vdr"
}

md5sums=('391c2ed60e2f7d24563fe3ed5854bc4f'
         '301c9b9766ed5182b07f1debc79abc21'
         'de3dcdea1a4282211c6dac370019548b'
         '9cb821ebb6a25e603f9c32bafabde362'
         'fc450f75037b8712673db4969a1dd758'
         'f00583e3f5507b0ff935b4d5919e7df2'
         '1d637e4f97adc66ef84615897116f29a'
         '23d6e1ca0a36cfdbd35d3b1a61f0a105'
         '3565ca5ad9be5c75f66478f0796b120d'
         'dd20f932b846b5f50ac455b65e9432ad'
         '7cad811b4ac5ee6c0b5496d006f1e0ee'
         '64979737d26758a75dda488b323c293c'
         '59ce04d1d01bf92bf6cfc0b74223191c')
