# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Manuel Reimer <manuel.reimer@gmx.de>
pkgbase=vdr-git
pkgname=(vdr-git vdr-examples-git)
pkgver=2.6.3.r0.g8b14723
_vdrapi=2.6.3
pkgrel=1
url="http://tvdr.de/"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
makedepends=('fontconfig' 'libcap' 'libjpeg-turbo' 'libsystemd' 'perl' 'ttf-font' 'systemd' 'ncurses')
_vdrrepo="https://raw.githubusercontent.com/VDR4Arch/vdr4arch/c71d217dd54c21d97bed2c3806e0453787f8598a/vdr"
source=("$pkgbase::git+http://git.tvdr.de/vdr.git"
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
sha256sums=('SKIP'
            '4c553065d24ee4dc001c06ff588494db44982b7debe9a1e6cd1a8903beb7c87b'
            '86f2469f459e2aabfc0ab703fc8435e458e89c4879376e900160d083924097b3'
            '423656cb6ba39af52d379dee697c52e6f435c098daa8c2ba429c1247b757af50'
            '39f4c2886328dc947dbef70dbc37d42504dc5c9d6a2ad81bf0c41d26fa3a5d6a'
            '1d914d6308a2b79ede34b7670788e5dfd3a8fab24156353555a66c9ef0bb41d7'
            '54a901d735d200ba3e2df4d9f45e1e537832a868c6ae5ae42ed3ff1a4c2c3f05'
            '7313a8db29693fa84d19be7b715b3ab04fd77eddcb52682588cc0a094764b6ba'
            '17b82fd995e9a39ad8d73d46b586d6c1934a6747c2859bd6d6df22ed254b5c4b'
            'f33f42a77bd93f00e7aa18f22667f0097468de76a0269c6e35fdc0fd2e30f6e6'
            '7ca24fe1df90ffc20ae7fc6578193874b21ef8f303d7aac421d394a6106eef2a')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
