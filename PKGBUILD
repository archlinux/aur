# $Id$
# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=xorg-server1.12
_pkgbase=xorg-server
pkgname=('xorg-server1.12' 'xorg-server1.12-xephyr' 'xorg-server1.12-xdmx' 'xorg-server1.12-xvfb' 'xorg-server1.12-xnest' 'xorg-server1.12-common' 'xorg-server1.12-devel')
pkgver=1.12.4
pkgrel=7
arch=('i686' 'x86_64')
license=('custom')
url="http://xorg.freedesktop.org"
makedepends=('pixman' 'libx11' 'mesa' 'libgl' 'xf86driproto' 'xcmiscproto' 'xtrans' 'bigreqsproto' 'randrproto' 'inputproto' 'fontsproto' 'videoproto'
             'compositeproto' 'recordproto' 'scrnsaverproto' 'resourceproto' 'xineramaproto' 'libxkbfile' 'libxfont' 'renderproto' 'libpciaccess'
             'libxv' 'xf86dgaproto' 'libxmu' 'libxrender' 'libxi' 'dmxproto' 'libxaw' 'libdmx' 'libxtst' 'libxres' 'xorg-xkbcomp' 'xorg-util-macros'
             'xorg-font-util' 'glproto' 'dri2proto' 'libgcrypt' 'systemd')
options=('!libtool')
source=(${url}/releases/individual/xserver/${_pkgbase}-${pkgver}.tar.bz2
        autoconfig-nvidia.patch
        autoconfig-sis.patch
        xvfb-run
        xvfb-run.1
        10-quirks.conf
        0001-sdksyms.sh-Make-sdksyms.sh-work-with-gcc5.patch
	bad-impl.patch)
sha256sums=('8ac07c35306ba3fb3c0972722dd4e919303039eca1d40ac7862560e0b2c94cf7'
            'f1e94a4284672f93d47d51ac5fd19731058761a5ab9de471b5fdfa226ab62b56'
            'd027776fac1f7675b0a9ee817502290b1c45f9c09b0f0a6bb058c35f92361e84'
            'ff0156309470fc1d378fd2e104338020a884295e285972cc88e250e031cc35b9'
            '2460adccd3362fefd4cdc5f1c70f332d7b578091fb9167bf88b5f91265bbd776'
            '94612f5c0d34a3b7152915c2e285c7b462e9d8e38d3539bd551a339498eac166'
            'b4a4fbddebfa614d1a97e77dde98748682ee331fbf7be394480050670d6203aa'
            'b7dbca90cd80ed987441a835998af5006f4d08cdb403a290440604086e7d2260')

build() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"

  # Use nouveau/nv/nvidia drivers for nvidia devices
  patch -Np1 -i "${srcdir}/autoconfig-nvidia.patch"

  # Use unofficial imedia SiS driver for supported SiS devices
  patch -Np0 -i "${srcdir}/autoconfig-sis.patch"

  # fix FS#45245, merged upstream
  patch -Np1 -i ../0001-sdksyms.sh-Make-sdksyms.sh-work-with-gcc5.patch

  # Fix error with catalyst driver
  patch -Np1 -i "${srcdir}/bad-impl.patch"

  autoreconf -fi
  ./configure --prefix=/usr \
      --enable-ipv6 \
      --enable-dri \
      --enable-dmx \
      --enable-xvfb \
      --enable-xnest \
      --enable-composite \
      --enable-xcsecurity \
      --enable-xorg \
      --enable-xephyr \
      --enable-glx-tls \
      --enable-kdrive \
      --enable-kdrive-evdev \
      --enable-kdrive-kbd \
      --enable-kdrive-mouse \
      --enable-install-setuid \
      --enable-config-udev \
      --disable-config-dbus \
      --enable-record \
      --disable-xfbdev \
      --disable-xfake \
      --disable-static \
      --sysconfdir=/etc/X11 \
      --localstatedir=/var \
      --with-xkb-path=/usr/share/X11/xkb \
      --with-xkb-output=/var/lib/xkb \
      --with-fontrootdir=/usr/share/fonts
  make

  # Disable subdirs for make install rule to make splitting easier
  sed -e 's/^DMX_SUBDIRS =.*/DMX_SUBDIRS =/' \
      -e 's/^XVFB_SUBDIRS =.*/XVFB_SUBDIRS =/' \
      -e 's/^XNEST_SUBDIRS =.*/XNEST_SUBDIRS = /' \
      -e 's/^KDRIVE_SUBDIRS =.*/KDRIVE_SUBDIRS =/' \
      -i hw/Makefile
}

package_xorg-server1.12-common() {
  pkgdesc="Xorg server common files"
  depends=('xkeyboard-config' 'xorg-xkbcomp' 'xorg-setxkbmap' 'xorg-fonts-misc')
  conflicts=('xorg-server-common')

  cd "${srcdir}/${_pkgbase}-${pkgver}"
  install -m755 -d "${pkgdir}/usr/share/licenses/xorg-server1.12-common"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/xorg-server1.12-common"
  
  make -C xkb DESTDIR="${pkgdir}" install-data

  install -m755 -d "${pkgdir}/usr/share/man/man1"
  install -m644 man/Xserver.1 "${pkgdir}/usr/share/man/man1/"

  install -m755 -d "${pkgdir}/usr/lib/xorg"
  install -m644 dix/protocol.txt "${pkgdir}/usr/lib/xorg/"
}

package_xorg-server1.12() {
  pkgdesc="Xorg X server"
  depends=(libxdmcp libxfont libpciaccess libdrm pixman libgcrypt libxau xorg-server1.12-common xf86-input-evdev1.12)
  backup=('etc/X11/xorg.conf.d/10-evdev.conf' 'etc/X11/xorg.conf.d/10-quirks.conf')
  # see xorg-server-1.12.4/hw/xfree86/common/xf86Module.h for ABI versions - we provide major numbers that drivers can depend on
  provides=("xorg-server=$pkgver" 'X-ABI-VIDEODRV_VERSION=12' 'X-ABI-XINPUT_VERSION=16' 'X-ABI-EXTENSION_VERSION=6.0' "x-server=$pkgver")
  conflicts=('xorg-server')

  cd "${srcdir}/${_pkgbase}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}/etc/X11"
  mv "${pkgdir}/usr/share/X11/xorg.conf.d" "${pkgdir}/etc/X11/"
  install -m644 "${srcdir}/10-quirks.conf" "${pkgdir}/etc/X11/xorg.conf.d/"

  rmdir "${pkgdir}/usr/share/X11"

  # Needed for non-mesa drivers, libgl will restore it
  mv "${pkgdir}/usr/lib/xorg/modules/extensions/libglx.so" \
     "${pkgdir}/usr/lib/xorg/modules/extensions/libglx.xorg"

  rm -rf "${pkgdir}/var"

  rm -f "${pkgdir}/usr/share/man/man1/Xserver.1"
  rm -f "${pkgdir}/usr/lib/xorg/protocol.txt"

  install -m755 -d "${pkgdir}/usr/share/licenses/xorg-server1.12"
  ln -sf ../xorg-server1.12-common/COPYING "${pkgdir}/usr/share/licenses/xorg-server1.12/COPYING"

  rm -rf "${pkgdir}/usr/lib/pkgconfig"
  rm -rf "${pkgdir}/usr/include"
  rm -rf "${pkgdir}/usr/share/aclocal"
}

package_xorg-server1.12-xephyr() {
  pkgdesc="A nested X server that runs as an X application"
  depends=(libxfont libgl libgcrypt libxv pixman xorg-server1.12-common)
  conflicts=('xorg-server-xephyr')
  provides=("xorg-server-xephyr=$pkgver")

  cd "${srcdir}/${_pkgbase}-${pkgver}/hw/kdrive"
  make DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}/usr/share/licenses/xorg-server1.12-xephyr"
  ln -sf ../xorg-server1.12-common/COPYING "${pkgdir}/usr/share/licenses/xorg-server1.12-xephyr/COPYING"
}

package_xorg-server1.12-xvfb() {
  pkgdesc="Virtual framebuffer X server"
  depends=(libxfont libxdmcp libxau libgcrypt pixman xorg-server1.12-common)
  conflicts=('xorg-server-xvfb')
  provides=("xorg-server-xvfb=$pkgver")

  cd "${srcdir}/${_pkgbase}-${pkgver}/hw/vfb"
  make DESTDIR="${pkgdir}" install

  install -m755 "${srcdir}/xvfb-run" "${pkgdir}/usr/bin/"
  install -m644 "${srcdir}/xvfb-run.1" "${pkgdir}/usr/share/man/man1/"

  install -m755 -d "${pkgdir}/usr/share/licenses/xorg-server1.12-xvfb"
  ln -sf ../xorg-server1.12-common/COPYING "${pkgdir}/usr/share/licenses/xorg-server1.12-xvfb/COPYING"
}

package_xorg-server1.12-xnest() {
  pkgdesc="A nested X server that runs as an X application"
  depends=(libxfont libxext libgcrypt pixman xorg-server1.12-common)
  conflicts=('xorg-server-xnest')
  provides=("xorg-server-xnest=$pkgver")

  cd "${srcdir}/${_pkgbase}-${pkgver}/hw/xnest"
  make DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}/usr/share/licenses/xorg-server1.12-xnest"
  ln -sf ../xorg-server1.12-common/COPYING "${pkgdir}/usr/share/licenses/xorg-server1.12-xnest/COPYING"
}

package_xorg-server1.12-xdmx() {
  pkgdesc="Distributed Multihead X Server and utilities"
  depends=(libxfont libxi libgcrypt libxaw libxrender libdmx libxfixes pixman xorg-server1.12-common)
  conflicts=('xorg-server-xdmx')
  provides=("xorg-server-xdmx=$pkgver")

  cd "${srcdir}/${_pkgbase}-${pkgver}/hw/dmx"
  make DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}/usr/share/licenses/xorg-server1.12-xdmx"
  ln -sf ../xorg-server1.12-common/COPYING "${pkgdir}/usr/share/licenses/xorg-server1.12-xdmx/COPYING"
}

package_xorg-server1.12-devel() {
  pkgdesc="Development files for the X.Org X server"
  depends=(# see pkgdir/usr/lib/pkgconfig/xorg-server.pc
           xproto randrproto renderproto xextproto inputproto kbproto
           fontsproto pixman videoproto dri2proto xineramaproto
           libpciaccess
           # not technically required but almost every Xorg pkg needs it to build
           xorg-util-macros)
  conflicts=('xorg-server-devel')
  provides=("xorg-server-devel=$pkgver")

  cd "${srcdir}/${_pkgbase}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}/usr/bin"
  rm -rf "${pkgdir}/usr/share/man"
  rm -rf "${pkgdir}/usr/share/doc"
  rm -rf "${pkgdir}/usr/share/X11"
  rm -rf "${pkgdir}/usr/lib/xorg"
  rm -rf "${pkgdir}/var"

  install -m755 -d "${pkgdir}/usr/share/licenses/xorg-server1.12-devel"
  ln -sf ../xorg-server1.12-common/COPYING "${pkgdir}/usr/share/licenses/xorg-server1.12-devel/COPYING"
}
