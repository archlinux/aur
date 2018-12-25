# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr
pkgver=2.4.0
pkgrel=7
pkgdesc="'open' digital satellite receiver and timer controlled video disk recorder"
url="http://tvdr.de/"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('fontconfig' 'libcap' 'libjpeg-turbo' 'libsystemd' 'perl' 'ttf-font')
makedepends=('systemd') #libsystemd should be enough but the pkg-config file is missing in the libsystemd package
optdepends=('lirc-utils: remote control support'
            'ncurses: skincurses plugin'
            'vdr-xorg: To start X11')
replaces=('runvdr-extreme')
conflicts=('runvdr-extreme')
provides=("vdr-api=2.4.0")
install='vdr.install'
source=("ftp://ftp.tvdr.de/vdr/${pkgname}-${pkgver}.tar.bz2"
        'ftp://ftp.tvdr.de/vdr/Developer/Patches/vdr-2.4/vdr-2.4.0-01-fix-svdrp-modt-recflag.diff'
        'ftp://ftp.tvdr.de/vdr/Developer/Patches/vdr-2.4/vdr-2.4.0-02-fix-invalid-locking-sequence.diff'
        'ftp://ftp.tvdr.de/vdr/Developer/Patches/vdr-2.4/vdr-2.4.0-03-fix-locking-channel-display.diff'
        'ftp://ftp.tvdr.de/vdr/Developer/Patches/vdr-2.4/vdr-2.4.0-04-fix-locking-channel-display-2.diff'
        'ftp://ftp.tvdr.de/vdr/Developer/Patches/vdr-2.4/vdr-2.4.0-05-fix-shutdown.diff'
        'ftp://ftp.tvdr.de/vdr/Developer/Patches/vdr-2.4/vdr-2.4.0-06-fix-channel-switch.diff'
        'ftp://ftp.tvdr.de/vdr/Developer/Patches/vdr-2.4/vdr-2.4.0-07-fix-disabling-mtd.diff'
        'MainMenuHooks-v1_0_2.diff::https://www.vdr-portal.de/index.php?attachment/30330'
        '00-vdr.conf' '50-hello.conf' '50-pictures.conf'
        '60-create-dvb-device-units.rules'
        'gen-sddropin'
        'shutdown.sh'
        'shutdown-wrapper.c'
        'vdr.service'
        'vdr.sysuser')
backup=("etc/vdr/conf.avail/"50-{epgtableid0,hello,osddemo,pictures,skincurses,status,svdrpdemo}.conf
        "etc/vdr/conf.avail/"50-svc{cli,svr}.conf
        'etc/vdr/conf.d/00-vdr.conf'
        'var/lib/vdr/camresponses.conf'
        'var/lib/vdr/channels.conf'
        'var/lib/vdr/diseqc.conf'
        'var/lib/vdr/keymacros.conf'
        'var/lib/vdr/scr.conf'
        'var/lib/vdr/sources.conf'
        'var/lib/vdr/svdrphosts.conf')
md5sums=('12c6a3abeadfa915fcfe736bb047a3ab'
         'b2f115b72cc98a031cecd00ab085a658'
         'd6df719874fbc276451db111d6393acb'
         '7dc852d13089880911e0ffe15308c21d'
         'a0bb1d3e8fe3a864f138ba7e84798e43'
         '881cf6a109d531800c6d48bca1ef4a7c'
         'e1a54547146639366512552311bd9df0'
         'f455271c9518498bffd2d1840a102868'
         '301c9b9766ed5182b07f1debc79abc21'
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
  cd "${srcdir}/${pkgname}-${pkgver}"

  echo 'CFLAGS      += -O3' > Make.config
  echo 'CXXFLAGS    += -O3' >> Make.config
  echo 'PREFIX       = /usr' >> Make.config
  echo 'LIBDIR       = /usr/lib/vdr/plugins' >> Make.config
  echo 'VDR_USER     = vdr' >> Make.config
  echo 'SDNOTIFY     = 1' >> Make.config
  echo 'LIRC_DEVICE  = /run/lirc/lircd' >> Make.config

  # Upstream fixes
  patch -p0 -i "$srcdir/vdr-2.4.0-01-fix-svdrp-modt-recflag.diff"
  patch -p0 -i "$srcdir/vdr-2.4.0-02-fix-invalid-locking-sequence.diff"
  patch -p0 -i "$srcdir/vdr-2.4.0-03-fix-locking-channel-display.diff"
  patch -p0 -i "$srcdir/vdr-2.4.0-04-fix-locking-channel-display-2.diff"
  patch -p0 -i "$srcdir/vdr-2.4.0-05-fix-shutdown.diff"
  patch -p0 -i "$srcdir/vdr-2.4.0-06-fix-channel-switch.diff"
  patch -p0 -i "$srcdir/vdr-2.4.0-07-fix-disabling-mtd.diff"

  # Custom extensions
  sed -i 's/NULL, 0, true/NULL, 0, OpenSubMenus/g' "$srcdir/MainMenuHooks-v1_0_2.diff"
  patch -p1 -i "$srcdir/MainMenuHooks-v1_0_2.diff"
}

build() {
  gcc -o shutdown-wrapper shutdown-wrapper.c

  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  for i in hello pictures; do
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
  install -Dm644 ${srcdir}/$pkgname.sysuser "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"

  for i in epgtableid0 osddemo skincurses status svc{cli,svr} svdrpdemo; do
    echo "[$i]" > "$pkgdir/etc/vdr/conf.avail/50-$i.conf"
  done

  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p "$pkgdir/var/lib/vdr"
  make DESTDIR="${pkgdir}" install

  mkdir -p "$pkgdir/usr/share/vdr/shutdown-hooks"

  chown -R 666:666 "$pkgdir/srv/vdr"
  chown -R 666:666 "$pkgdir/var/cache/vdr"
  chown -R 666:666 "$pkgdir/var/lib/vdr"
}
