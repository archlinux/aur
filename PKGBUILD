# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Manuel Reimer <manuel.reimer@gmx.de>
pkgbase=vdr-git
pkgname=(vdr-git vdr-examples-git)
pkgver=2.4.1.r0.g32cea9d
_vdrapi=2.4.1
pkgrel=2
url="http://tvdr.de/"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
makedepends=('fontconfig' 'libcap' 'libjpeg-turbo' 'libsystemd' 'perl' 'ttf-font' 'systemd' 'ncurses')
_vdrrepo="https://raw.githubusercontent.com/VDR4Arch/vdr4arch/87d77e000f8067e73e1c2da4d4ba4ace653e766c/vdr"
source=("$pkgbase::git+https://github.com/VDR4Arch/vdr.git"
        "$_vdrrepo/vdr-MainMenuHooks.patch"
        "$_vdrrepo/00-vdr.conf"
        "$_vdrrepo/50-hello.conf"
        "$_vdrrepo/50-pictures.conf"
        "$_vdrrepo/60-create-dvb-device-units.rules"
        "$_vdrrepo/gen-sddropin"
        "$_vdrrepo/shutdown.sh"
        "$_vdrrepo/shutdown-wrapper.c"
        "$_vdrrepo/vdr.service"
        "$_vdrrepo/vdr.sysuser")
md5sums=('SKIP'
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

pkgver() {
  cd "${srcdir}/${pkgbase}"
  git describe --long --tags | sed 's/^vdr-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${pkgbase}"

  echo 'CFLAGS      += -O3' > Make.config
  echo 'CXXFLAGS    += -O3' >> Make.config
  echo 'PREFIX       = /usr' >> Make.config
  echo 'LIBDIR       = /usr/lib/vdr/plugins' >> Make.config
  echo 'VDR_USER     = vdr' >> Make.config
  echo 'SDNOTIFY     = 1' >> Make.config
  echo 'LIRC_DEVICE  = /run/lirc/lircd' >> Make.config

  # Custom extensions
  patch -p1 -i "$srcdir/vdr-MainMenuHooks.patch"

  # Don't install plugins with VDR
  sed -i '/^install: /s/install-plugins //' Makefile
}

build() {
  gcc -o shutdown-wrapper shutdown-wrapper.c

  cd "${srcdir}/${pkgbase}"
  make
}

package_vdr-git() {
  pkgdesc="'open' digital satellite receiver and timer controlled video disk recorder"
  depends=('fontconfig' 'libcap' 'libjpeg-turbo' 'libsystemd' 'perl' 'ttf-font')
  optdepends=('lirc-utils: remote control support'
              'vdr-xorg: To start X11')
  replaces=('runvdr-extreme')
  conflicts=('runvdr-extreme' vdr)
  provides=("vdr-api=$_vdrapi" vdr)
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
  install -Dm644 ${srcdir}/vdr.sysuser "$pkgdir/usr/lib/sysusers.d/vdr.conf"

  cd "${srcdir}/${pkgbase}"
  mkdir -p "$pkgdir/var/lib/vdr"
  make DESTDIR="${pkgdir}" install

  mkdir -p "$pkgdir/usr/share/vdr/shutdown-hooks"

  chown -R 666:666 "$pkgdir/srv/vdr"
  chown -R 666:666 "$pkgdir/var/cache/vdr"
  chown -R 666:666 "$pkgdir/var/lib/vdr"
}

package_vdr-examples-git() {
  pkgdesc="Plugins for vdr to show some possible features"
  depends=("vdr-api=${_vdrapi}" "gcc-libs" 'ncurses')
  conflicts=(vdr-examples)
  provides=(vdr-examples)
  backup=("etc/vdr/conf.avail/"50-{epgtableid0,hello,osddemo,pictures,skincurses,status,svdrpdemo}.conf
          "etc/vdr/conf.avail/"50-svc{cli,svr}.conf)

  cd "${srcdir}/${pkgbase}"
  make DESTDIR="${pkgdir}" install-plugins

  mkdir -p "$pkgdir/etc/vdr/conf.avail"
  for i in hello pictures; do
    install -Dm644 "${srcdir}/50-$i.conf" "$pkgdir/etc/vdr/conf.avail/50-$i.conf"
  done
  for i in epgtableid0 osddemo skincurses status svc{cli,svr} svdrpdemo; do
    echo "[$i]" > "$pkgdir/etc/vdr/conf.avail/50-$i.conf"
  done
}
