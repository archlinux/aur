# Maintainer: 0strodamus <0strodamus at cox dot net>
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=xorg-server-nosystemd
pkgname=('xorg-server-nosystemd' 'xorg-server-xephyr-nosystemd' 'xorg-server-xdmx-nosystemd' 'xorg-server-xvfb-nosystemd'
		 'xorg-server-xnest-nosystemd' 'xorg-server-xwayland-nosystemd' 'xorg-server-common-nosystemd' 'xorg-server-devel-nosystemd')
_pkgbase=xorg-server
pkgver=1.19.1
pkgrel=3
arch=('i686' 'x86_64')
license=('custom')
groups=('xorg')
url="http://xorg.freedesktop.org"
makedepends=('pixman' 'libx11' 'mesa' 'mesa-libgl' 'xf86driproto' 'xcmiscproto' 'xtrans' 'bigreqsproto' 'randrproto' 
             'inputproto' 'fontsproto' 'videoproto' 'presentproto' 'compositeproto' 'recordproto' 'scrnsaverproto'
             'resourceproto' 'xineramaproto' 'libxkbfile' 'libxfont2' 'renderproto' 'libpciaccess' 'libxv'
             'xf86dgaproto' 'libxmu' 'libxrender' 'libxi' 'dmxproto' 'libxaw' 'libdmx' 'libxtst' 'libxres'
             'xorg-xkbcomp' 'xorg-util-macros' 'xorg-font-util' 'glproto' 'dri2proto' 'libgcrypt' 'libepoxy'
             'xcb-util' 'xcb-util-image' 'xcb-util-renderutil' 'xcb-util-wm' 'xcb-util-keysyms' 'dri3proto'
             'libxshmfence' 'libunwind' 'wayland-protocols')
source=(https://xorg.freedesktop.org/releases/individual/xserver/${_pkgbase}-${pkgver}.tar.bz2{,.sig}
        bug99358.patch
        nvidia-add-modulepath-support.patch
        xvfb-run
        xvfb-run.1)
validpgpkeys=('7B27A3F1A6E18CD9588B4AE8310180050905E40C'
              'C383B778255613DFDB409D91DB221A6900000011'
              'DD38563A8A8224537D1F90E45B8A2D50A0ECD0D3')
sha256sums=('79ae2cf39d3f6c4a91201d8dad549d1d774b3420073c5a70d390040aa965a7fb'
            'SKIP'
            'f46a9d1a5ac43c5359fbd8c57b6e64b0bd313116b5cb638527bfe3701e6c3904'
            '914a8d775b708f836ae3f0eeca553da3872727a2e4262190f4d5c01241cb14e8'
            'ff0156309470fc1d378fd2e104338020a884295e285972cc88e250e031cc35b9'
            '2460adccd3362fefd4cdc5f1c70f332d7b578091fb9167bf88b5f91265bbd776')

prepare() {
  cd "${_pkgbase}-${pkgver}"

  # merged upstream in trunk
  patch -Np1 -i ../nvidia-add-modulepath-support.patch

  # https://bugs.freedesktop.org/show_bug.cgi?id=99358
  # https://bugs.archlinux.org/task/52808
  patch -Np1 -i ../bug99358.patch
  }

build() {
  cd "${_pkgbase}-${pkgver}"
  ./configure --prefix=/usr \
      --disable-ipv6 \
      --enable-dri \
      --enable-dmx \
      --enable-xvfb \
      --enable-xnest \
      --enable-composite \
      --enable-xcsecurity \
      --enable-libunwind \
      --enable-xorg \
      --enable-xephyr \
      --enable-glamor \
      --enable-xwayland \
      --enable-kdrive \
      --enable-kdrive-kbd \
      --enable-kdrive-mouse \
      --enable-config-udev \
      --disable-systemd-logind \
      --enable-suid-wrapper \
      --enable-install-setuid \
      --enable-record \
      --disable-xfbdev \
      --disable-xfake \
      --disable-static \
      --libexecdir=/usr/lib/xorg-server \
      --sysconfdir=/etc \
      --localstatedir=/var \
      --with-xkb-path=/usr/share/X11/xkb \
      --with-xkb-output=/var/lib/xkb \
      --with-fontrootdir=/usr/share/fonts \
      --with-sha1=libgcrypt \
      --without-systemd-daemon
      
#      --without-dtrace \
#      --disable-linux-acpi --disable-linux-apm \

  make

  # Disable subdirs for make install rule to make splitting easier
  sed -e 's/^DMX_SUBDIRS =.*/DMX_SUBDIRS =/' \
      -e 's/^XVFB_SUBDIRS =.*/XVFB_SUBDIRS =/' \
      -e 's/^XNEST_SUBDIRS =.*/XNEST_SUBDIRS = /' \
      -e 's/^KDRIVE_SUBDIRS =.*/KDRIVE_SUBDIRS =/' \
      -e 's/^XWAYLAND_SUBDIRS =.*/XWAYLAND_SUBDIRS =/' \
      -i hw/Makefile
}

package_xorg-server-common-nosystemd() {
  pkgdesc="Xorg server common files"
  depends=('xkeyboard-config' 'xorg-xkbcomp' 'xorg-setxkbmap' 'xorg-fonts-misc')
  provides=('xorg-server-common')
  conflicts=('xorg-server-common')
  replaces=('xorg-server-common')
  cd "${_pkgbase}-${pkgver}"
  install -m755 -d "${pkgdir}/usr/share/licenses/xorg-server-common"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/xorg-server-common"
  
  make -C xkb DESTDIR="${pkgdir}" install-data

  install -m755 -d "${pkgdir}/usr/share/man/man1"
  install -m644 man/Xserver.1 "${pkgdir}/usr/share/man/man1/"

  install -m755 -d "${pkgdir}/usr/lib/xorg"
  install -m644 dix/protocol.txt "${pkgdir}/usr/lib/xorg/"
}

package_xorg-server-nosystemd() {
  pkgdesc="Xorg X server"
  depends=('libepoxy' 'libxfont2' 'pixman' 'xorg-server-common-nosystemd' 'libunwind' 'dbus-nosystemd' 'libgl' 'xf86-input-evdev'
           libpciaccess libdrm libxshmfence) # FS#52949
  # see xorg-server-*/hw/xfree86/common/xf86Module.h for ABI versions - we provide major numbers that drivers can depend on
  # and /usr/lib/pkgconfig/xorg-server.pc in xorg-server-devel pkg
  provides=('X-ABI-VIDEODRV_VERSION=23' 'X-ABI-XINPUT_VERSION=24.1' 'X-ABI-EXTENSION_VERSION=10.0' 'x-server' 'xorg-server')
  conflicts=('nvidia-utils<=331.20' 'glamor-egl' 'xf86-video-modesetting' 'xorg-server')
  replaces=('glamor-egl' 'xf86-video-modesetting' 'xorg-server')
  install=xorg-server.install

  cd "${_pkgbase}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  # distro specific files must be installed in /usr/share/X11/xorg.conf.d
  install -m755 -d "${pkgdir}/etc/X11/xorg.conf.d"

  rm -rf "${pkgdir}/var"

  rm -f "${pkgdir}/usr/share/man/man1/Xserver.1"
  rm -f "${pkgdir}/usr/lib/xorg/protocol.txt"

  install -m755 -d "${pkgdir}/usr/share/licenses/xorg-server"
  ln -sf ../xorg-server-common/COPYING "${pkgdir}/usr/share/licenses/xorg-server/COPYING"

  rm -rf "${pkgdir}/usr/lib/pkgconfig"
  rm -rf "${pkgdir}/usr/include"
  rm -rf "${pkgdir}/usr/share/aclocal"
}

package_xorg-server-xephyr-nosystemd() {
  pkgdesc="A nested X server that runs as an X application"
  depends=('libxfont2' 'libgl' 'libepoxy' 'libunwind' 'libxv' 'pixman' 'xorg-server-common-nosystemd' 'xcb-util-image'
           'xcb-util-renderutil' 'xcb-util-wm' 'xcb-util-keysyms')
  provides=('xorg-server-xephyr')
  conflicts=('xorg-server-xephyr')
  replaces=('xorg-server-xephyr')
  cd "${_pkgbase}-${pkgver}/hw/kdrive"
  make DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}/usr/share/licenses/xorg-server-xephyr"
  ln -sf ../xorg-server-common/COPYING "${pkgdir}/usr/share/licenses/xorg-server-xephyr/COPYING"
}

package_xorg-server-xvfb-nosystemd() {
  pkgdesc="Virtual framebuffer X server"
  depends=('libxfont2' 'libunwind' 'pixman' 'xorg-server-common-nosystemd' 'xorg-xauth' 'libgl')
  provides=('xorg-server-xvfb')
  conflicts=('xorg-server-xvfb')
  replaces=('xorg-server-xvfb')
  cd "${_pkgbase}-${pkgver}/hw/vfb"
  make DESTDIR="${pkgdir}" install

  install -m755 "${srcdir}/xvfb-run" "${pkgdir}/usr/bin/"
  install -m644 "${srcdir}/xvfb-run.1" "${pkgdir}/usr/share/man/man1/"

  install -m755 -d "${pkgdir}/usr/share/licenses/xorg-server-xvfb"
  ln -sf ../xorg-server-common/COPYING "${pkgdir}/usr/share/licenses/xorg-server-xvfb/COPYING"
}

package_xorg-server-xnest-nosystemd() {
  pkgdesc="A nested X server that runs as an X application"
  depends=('libxfont2' 'libxext' 'libunwind' 'pixman' 'xorg-server-common-nosystemd')
  provides=('xorg-server-xnest')
  conflicts=('xorg-server-xnest')
  replaces=('xorg-server-xnest')
  cd "${_pkgbase}-${pkgver}/hw/xnest"
  make DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}/usr/share/licenses/xorg-server-xnest"
  ln -sf ../xorg-server-common/COPYING "${pkgdir}/usr/share/licenses/xorg-server-xnest/COPYING"
}

package_xorg-server-xdmx-nosystemd() {
  pkgdesc="Distributed Multihead X Server and utilities"
  depends=('libxfont2' 'libxi' 'libxaw' 'libxrender' 'libdmx' 'libxfixes' 'libunwind' 'pixman' 'xorg-server-common-nosystemd')
  provides=('xorg-server-xdmx')
  conflicts=('xorg-server-xdmx')
  replaces=('xorg-server-xdmx')
  cd "${_pkgbase}-${pkgver}/hw/dmx"
  make DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}/usr/share/licenses/xorg-server-xdmx"
  ln -sf ../xorg-server-common/COPYING "${pkgdir}/usr/share/licenses/xorg-server-xdmx/COPYING"
}

package_xorg-server-xwayland-nosystemd() {
  pkgdesc="run X clients under wayland"
  depends=('libxfont2' 'libepoxy' 'libunwind' 'libgl' 'pixman' 'xorg-server-common-nosystemd')
  provides=('xorg-server-xwayland')
  conflicts=('xorg-server-xwayland')
  replaces=('xorg-server-xwayland')
  cd "${_pkgbase}-${pkgver}/hw/xwayland"
  make DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}/usr/share/licenses/xorg-server-xwayland"
  ln -sf ../xorg-server-common/COPYING "${pkgdir}/usr/share/licenses/xorg-server-xwayland/COPYING"
}

package_xorg-server-devel-nosystemd() {
  pkgdesc="Development files for the X.Org X server"
  depends=(# see pkgdir/usr/lib/pkgconfig/xorg-server.pc
           'xproto' 'randrproto' 'renderproto' 'xextproto' 'inputproto' 'kbproto' 
           'fontsproto' 'pixman' 'videoproto' 'xf86driproto' 'glproto' 
           'mesa' 'dri2proto' 'dri3proto' 'xineramaproto' 'libpciaccess'
           'resourceproto' 'scrnsaverproto' 'presentproto'
           # not technically required but almost every Xorg pkg needs it to build
           'xorg-util-macros')
  provides=('xorg-server-devel')
  conflicts=('xorg-server-devel')
  replaces=('xorg-server-devel')
  cd "${_pkgbase}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}/usr/bin"
  rm -rf "${pkgdir}/usr/share/man"
  rm -rf "${pkgdir}/usr/share/doc"
  rm -rf "${pkgdir}/usr/share/X11"
  rm -rf "${pkgdir}/usr/lib/xorg"
  rm -rf "${pkgdir}/usr/lib/xorg-server"
  rm -rf "${pkgdir}/var"

  install -m755 -d "${pkgdir}/usr/share/licenses/xorg-server-devel"
  ln -sf ../xorg-server-common/COPYING "${pkgdir}/usr/share/licenses/xorg-server-devel/COPYING"
}
