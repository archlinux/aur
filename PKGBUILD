# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Manuel Reimer <manuel.reimer@gmx.de>
pkgbase=vdr
pkgname=(vdr vdr-examples)
pkgver=2.4.1
_vdrapi=2.4.1
pkgrel=14
url="http://tvdr.de/"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
makedepends=('fontconfig' 'libcap' 'libjpeg-turbo' 'libsystemd' 'perl' 'ttf-font' 'systemd' 'ncurses')
source=("http://www.tvdr.de/ftp/${pkgbase}-${pkgver}.tar.bz2"
        "$pkgbase-$pkgver-glibc-2.31.patch::https://patch-diff.githubusercontent.com/raw/VDR4Arch/vdr/pull/1.patch"
        'vdr-MainMenuHooks.patch'
        '00-vdr.conf' '50-hello.conf' '50-pictures.conf'
        '60-create-dvb-device-units.rules'
        'gen-sddropin'
        'shutdown.sh'
        'shutdown-wrapper.c'
        'vdr.service'
        'vdr.sysuser')
md5sums=('b2897fe6b6e6711d512a69642b1b8ec1'
         '1dedc6c9eeeeb28a4d44cf4f726c4419'
         '292e065582d97ed1ae4977a2a7b6091d'
         'de3dcdea1a4282211c6dac370019548b'
         'fc450f75037b8712673db4969a1dd758'
         'f00583e3f5507b0ff935b4d5919e7df2'
         '23d6e1ca0a36cfdbd35d3b1a61f0a105'
         '3565ca5ad9be5c75f66478f0796b120d'
         'dd20f932b846b5f50ac455b65e9432ad'
         '7cad811b4ac5ee6c0b5496d006f1e0ee'
         '6c021358f299dca9ef7bbeb163312690'
         '59ce04d1d01bf92bf6cfc0b74223191c')

prepare() {
  cd "${srcdir}/${pkgbase}-${pkgver}"

  echo 'CFLAGS      += -O3' > Make.config
  echo 'CXXFLAGS    += -O3' >> Make.config
  echo 'PREFIX       = /usr' >> Make.config
  echo 'LIBDIR       = /usr/lib/vdr/plugins' >> Make.config
  echo 'VDR_USER     = vdr' >> Make.config
  echo 'SDNOTIFY     = 1' >> Make.config
  echo 'LIRC_DEVICE  = /run/lirc/lircd' >> Make.config

  # Custom extensions
  patch -p1 -i "$srcdir/vdr-MainMenuHooks.patch"

  # glibc 2.31 fix
  patch -p1 -i "$srcdir/$pkgbase-$pkgver-glibc-2.31.patch"

  # Don't install plugins with VDR
  sed -i '/^install: /s/install-plugins //' Makefile
}

build() {
  gcc -o shutdown-wrapper shutdown-wrapper.c

  cd "${srcdir}/${pkgbase}-${pkgver}"
  make
}

package_vdr() {
  pkgdesc="'open' digital satellite receiver and timer controlled video disk recorder"
  depends=('fontconfig' 'libcap' 'libjpeg-turbo' 'libsystemd' 'perl' 'ttf-font')
  optdepends=('lirc-utils: remote control support'
              'vdr-xorg: To start X11')
  replaces=('runvdr-extreme')
  conflicts=('runvdr-extreme')
  provides=("vdr-api=$_vdrapi")
  install='vdr.install'
  options=(emptydirs)
  backup=('etc/vdr/conf.d/00-vdr.conf'
          'var/lib/vdr/camresponses.conf'
          'var/lib/vdr/channels.conf'
          'var/lib/vdr/diseqc.conf'
          'var/lib/vdr/keymacros.conf'
          'var/lib/vdr/scr.conf'
          'var/lib/vdr/sources.conf'
          'var/lib/vdr/svdrphosts.conf')

  # Ship this one empty so it's there even without plugin packages installed
  mkdir -p "$pkgdir/etc/vdr/conf.avail"
  # This one has to be shipped empty or some plugins (streamdev) fail to build
  mkdir -p "$pkgdir/usr/lib/vdr/plugins"

  install -Dm644 00-vdr.conf "$pkgdir/etc/vdr/conf.d/00-vdr.conf"
  install -Dm644 60-create-dvb-device-units.rules "$pkgdir/usr/lib/udev/rules.d/60-create-dvb-device-units.rules"
  install -Dm644 vdr.service "$pkgdir/usr/lib/systemd/system/vdr.service"

  install -Dm754 shutdown-wrapper "$pkgdir/usr/lib/vdr/bin/shutdown-wrapper"
  chgrp 666 "$pkgdir/usr/lib/vdr/bin/shutdown-wrapper"
  chmod u+s "$pkgdir/usr/lib/vdr/bin/shutdown-wrapper"

  install -Dm755 gen-sddropin "$pkgdir/usr/bin/vdr-gensddropin"
  install -Dm755 shutdown.sh "$pkgdir/usr/lib/vdr/bin/shutdown.sh"

  #Install sysuser config
  install -Dm644 ${srcdir}/$pkgbase.sysuser "$pkgdir/usr/lib/sysusers.d/$pkgbase.conf"

  cd "${srcdir}/${pkgbase}-${pkgver}"
  mkdir -p "$pkgdir/var/lib/vdr"
  make DESTDIR="${pkgdir}" install

  mkdir -p "$pkgdir/usr/share/vdr/shutdown-hooks"

  chown -R 666:666 "$pkgdir/srv/vdr"
  chown -R 666:666 "$pkgdir/var/cache/vdr"
  chown -R 666:666 "$pkgdir/var/lib/vdr"
}

package_vdr-examples() {
  pkgdesc="Plugins for vdr to show some possible features"
  depends=("vdr-api=${_vdrapi}" "gcc-libs" 'ncurses')
  backup=("etc/vdr/conf.avail/"50-{epgtableid0,hello,osddemo,pictures,skincurses,status,svdrpdemo}.conf
          "etc/vdr/conf.avail/"50-svc{cli,svr}.conf)

  cd "${srcdir}/${pkgbase}-${pkgver}"
  make DESTDIR="${pkgdir}" install-plugins

  mkdir -p "$pkgdir/etc/vdr/conf.avail"
  for i in hello pictures; do
    install -Dm644 "${srcdir}/50-$i.conf" "$pkgdir/etc/vdr/conf.avail/50-$i.conf"
  done
  for i in epgtableid0 osddemo skincurses status svc{cli,svr} svdrpdemo; do
    echo "[$i]" > "$pkgdir/etc/vdr/conf.avail/50-$i.conf"
  done
}
