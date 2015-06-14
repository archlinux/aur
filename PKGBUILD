# Maintainer: Det <nimetonmaili g-mail>
# Contributors: SpeedVin, FoxBuru, Federico Cinelli
# Based on xorg-server-dev: https://aur.archlinux.org/packages/xorg-server-dev/

pkgname=('xorg-server-git' 'xorg-server-xephyr-git' 'xorg-server-xdmx-git' 'xorg-server-xvfb-git' 'xorg-server-xnest-git' 'xorg-server-xwayland-git' 'xorg-server-common-git' 'xorg-server-devel-git')
pkgver=1.17.0.158.r14799.gfa12f2c
pkgrel=3
arch=('i686' 'x86_64')
license=('custom')
url="http://cgit.freedesktop.org/xorg/xserver/"
makedepends=('pixman' 'libx11' 'mesa' 'libgl' 'xf86driproto' 'xcmiscproto' 'xtrans' 'bigreqsproto' 'randrproto' 
             'inputproto' 'fontsproto' 'videoproto' 'presentproto' 'compositeproto' 'recordproto' 'scrnsaverproto'
             'resourceproto' 'xineramaproto' 'libxkbfile' 'libxfont' 'renderproto' 'libpciaccess' 'libxv'
             'xf86dgaproto' 'libxmu' 'libxrender' 'libxi' 'dmxproto' 'libxaw' 'libdmx' 'libxtst' 'libxres'
             'xorg-xkbcomp' 'xorg-util-macros' 'xorg-font-util' 'glproto' 'dri2proto' 'libgcrypt' 'libepoxy'
             'xcb-util' 'xcb-util-image' 'xcb-util-renderutil' 'xcb-util-wm' 'xcb-util-keysyms' 'dri3proto'
             'libxshmfence' 'libunwind' 'git')
source=(git://anongit.freedesktop.org/xorg/xserver
        nvidia-drm-outputclass.conf
        xvfb-run
        xvfb-run.1)
sha256sums=('SKIP'
            'af1c3d2ea5de7f6a6b5f7c60951a189a4749d1495e5462f3157ae7ac8fe1dc56'
            'ff0156309470fc1d378fd2e104338020a884295e285972cc88e250e031cc35b9'
            '2460adccd3362fefd4cdc5f1c70f332d7b578091fb9167bf88b5f91265bbd776')

pkgver() {
  cd xserver

  echo $(git describe --long | cut -d "-" -f3-4 | tr - .).r$(git rev-list HEAD --count).$(git describe --long | cut -d "-" -f5)
}

build() {
  cd xserver

  msg2 "Starting autoreconf..."
  autoreconf -fi

  msg2 "Starting ./configure..."
  ./configure --prefix=/usr \
      --enable-ipv6 \
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
      --enable-glx-tls \
      --enable-kdrive \
      --enable-kdrive-evdev \
      --enable-kdrive-kbd \
      --enable-kdrive-mouse \
      --enable-config-udev \
      --enable-systemd-logind \
      --enable-suid-wrapper \
      --disable-install-setuid \
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
      --with-sha1=libgcrypt

#      --without-dtrace \
#      --disable-linux-acpi --disable-linux-apm \

  msg2 "Starting make..."
  make

  # Disable subdirs for make install rule to make splitting easier
  sed -e 's/^DMX_SUBDIRS =.*/DMX_SUBDIRS =/' \
      -e 's/^XVFB_SUBDIRS =.*/XVFB_SUBDIRS =/' \
      -e 's/^XNEST_SUBDIRS =.*/XNEST_SUBDIRS = /' \
      -e 's/^KDRIVE_SUBDIRS =.*/KDRIVE_SUBDIRS =/' \
      -e 's/^XWAYLAND_SUBDIRS =.*/XWAYLAND_SUBDIRS =/' \
      -i hw/Makefile
}

package_xorg-server-common-git() {
  pkgdesc="Xorg server common files - Git"
  depends=('xkeyboard-config' 'xorg-xkbcomp' 'xorg-setxkbmap' 'xorg-fonts-misc'
           'libunwind')
  provides=('xorg-server-common')
  conflicts=('xorg-server-common')

  cd xserver
  install -m755 -d "${pkgdir}/usr/share/licenses/xorg-server-common"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/xorg-server-common"
  
  msg2 "Starting make install-data..."
  make -C xkb DESTDIR="${pkgdir}" install-data

  install -m755 -d "${pkgdir}/usr/share/man/man1"
  install -m644 man/Xserver.1 "${pkgdir}/usr/share/man/man1/"

  install -m755 -d "${pkgdir}/usr/lib/xorg"
  install -m644 dix/protocol.txt "${pkgdir}/usr/lib/xorg/"
}

package_xorg-server-git() {
  pkgdesc="Xorg X server - Git"
  depends=(libepoxy libxdmcp libxfont libpciaccess libdrm pixman libgcrypt libxau xorg-server-common-git xf86-input-evdev libxshmfence libgl)
  # see src/xserver/hw/xfree86/common/xf86Module.h for ABI versions - we provide major numbers that drivers can depend on
  # and /usr/lib/pkgconfig/xorg-server.pc in xorg-server-devel-git pkg
  _ABI_VIDEODRV="$(grep -Po "VIDEODRV_V.*\(\K[^)]*" xserver/hw/xfree86/common/xf86Module.h | sed "s/, /./")"
  _ABI_XINPUT="$(grep -Po "XINPUT_V.*\(\K[^)]*" xserver/hw/xfree86/common/xf86Module.h | sed "s/, /./")"
  _ABI_EXTENSION="$(grep -Po "EXTENSION_V.*\(\K[^)]*" xserver/hw/xfree86/common/xf86Module.h | sed "s/, /./")"
  provides=("X-ABI-VIDEODRV_VERSION=$_ABI_VIDEODRV"
            "X-ABI-XINPUT_VERSION=$_ABI_XINPUT"
            "X-ABI-EXTENSION_VERSION=$_ABI_EXTENSION"
            'x-server' 'xorg-server')
  groups=('xorg')
  conflicts=('nvidia-utils<=331.20' 'glamor-egl' 'xf86-video-modesetting' 'xorg-server')
  replaces=('glamor-egl' 'xf86-video-modesetting')
  install=xorg-server-git.install

  cd xserver

  msg2 "Starting make install..."
  make DESTDIR="${pkgdir}" install

  # distro specific files must be installed in /usr/share/X11/xorg.conf.d
  install -m755 -d "${pkgdir}/etc/X11/xorg.conf.d"
  install -m644 "${srcdir}/nvidia-drm-outputclass.conf" "${pkgdir}/usr/share/X11/xorg.conf.d/"

  # Needed for non-mesa drivers, libgl will restore it
  mv "${pkgdir}/usr/lib/xorg/modules/extensions/libglx.so" \
     "${pkgdir}/usr/lib/xorg/modules/extensions/libglx.xorg"

  rm -rf "${pkgdir}/var"

  rm -f "${pkgdir}/usr/share/man/man1/Xserver.1"
  rm -f "${pkgdir}/usr/lib/xorg/protocol.txt"

  install -m755 -d "${pkgdir}/usr/share/licenses/xorg-server"
  ln -sf ../xorg-server-common/COPYING "${pkgdir}/usr/share/licenses/xorg-server/COPYING"

  rm -rf "${pkgdir}/usr/lib/pkgconfig"
  rm -rf "${pkgdir}/usr/include"
  rm -rf "${pkgdir}/usr/share/aclocal"
}

package_xorg-server-xephyr-git() {
  pkgdesc="A nested X server that runs as an X application - Git"
  depends=(libxfont libgl libepoxy libgcrypt libxv pixman xorg-server-common 'xcb-util-image'
           'xcb-util-renderutil' 'xcb-util-wm' 'xcb-util-keysyms')
  provides=(xorg-server-xephyr)
  conflicts=(xorg-server-xephyr)

  cd xserver/hw/kdrive

  msg2 "Starting make install..."
  make DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}/usr/share/licenses/xorg-server-xephyr"
  ln -sf ../xorg-server-common/COPYING "${pkgdir}/usr/share/licenses/xorg-server-xephyr/COPYING"
}

package_xorg-server-xvfb-git() {
  pkgdesc="Virtual framebuffer X server - Git"
  depends=(libxfont libxdmcp libxau libgcrypt pixman xorg-server-common-git xorg-xauth libgl)
  provides=(xorg-server-xvfb)
  conflicts=(xorg-server-xvfb)

  cd xserver/hw/vfb

  msg2 "Starting make install..."
  make DESTDIR="${pkgdir}" install

  install -m755 "${srcdir}/xvfb-run" "${pkgdir}/usr/bin/"
  install -m644 "${srcdir}/xvfb-run.1" "${pkgdir}/usr/share/man/man1/"

  install -m755 -d "${pkgdir}/usr/share/licenses/xorg-server-xvfb"
  ln -sf ../xorg-server-common/COPYING "${pkgdir}/usr/share/licenses/xorg-server-xvfb/COPYING"
}

package_xorg-server-xnest-git() {
  pkgdesc="A nested X server that runs as an X application - Git"
  depends=(libxfont libxext libgcrypt pixman xorg-server-common-git libsystemd)
  provides=(xorg-server-xnest)
  conflicts=(xorg-server-xnest)

  cd xserver/hw/xnest

  msg2 "Starting make install..."
  make DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}/usr/share/licenses/xorg-server-xnest"
  ln -sf ../xorg-server-common/COPYING "${pkgdir}/usr/share/licenses/xorg-server-xnest/COPYING"
}

package_xorg-server-xdmx-git() {
  pkgdesc="Distributed Multihead X Server and utilities - Git"
  depends=(libxfont libxi libgcrypt libxaw libxrender libdmx libxfixes pixman xorg-server-common-git)
  provides=(xorg-server-xdmx)
  conflicts=(xorg-server-xdmx)

  cd xserver/hw/dmx

  msg2 "Starting make install..."
  make DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}/usr/share/licenses/xorg-server-xdmx"
  ln -sf ../xorg-server-common/COPYING "${pkgdir}/usr/share/licenses/xorg-server-xdmx/COPYING"
}

package_xorg-server-xwayland-git() {
  pkgdesc="Run X clients under Wayland - Git"
  depends=(libxfont libepoxy libgl pixman xorg-server-common-git)
  provides=(xorg-server-xwayland)
  conflicts=(xorg-server-xwayland)

  cd xserver/hw/xwayland

  msg2 "Starting make install..."
  make DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}/usr/share/licenses/xorg-server-xwayland"
  ln -sf ../xorg-server-common/COPYING "${pkgdir}/usr/share/licenses/xorg-server-xwayland/COPYING"
}

package_xorg-server-devel-git() {
  pkgdesc="Development files for the X.Org X server - Git"
  depends=(# see pkgdir/usr/lib/pkgconfig/xorg-server.pc
           xproto randrproto renderproto xextproto inputproto kbproto 
           fontsproto pixman videoproto xf86driproto glproto 
           mesa dri2proto dri3proto xineramaproto libpciaccess
           resourceproto scrnsaverproto presentproto
           # not technically required but almost every Xorg pkg needs it to build
           xorg-util-macros)
  provides=(xorg-server-devel)
  conflicts=(xorg-server-devel)

  cd xserver

  msg2 "Starting make install..."
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}/usr/bin"
  rm -rf "${pkgdir}/usr/share/man"
  rm -rf "${pkgdir}/usr/share/doc"
  rm -rf "${pkgdir}/usr/share/X11"
  rm -rf "${pkgdir}/usr/lib/xorg"
  rm -rf "${pkgdir}/usr/lib/xorg-server"
  rm -rf "${pkgdir}/var"

  install -m755 -d "${pkgdir}/usr/share/licenses/xorg-server-devel-git"
  ln -sf ../xorg-server-common/COPYING "${pkgdir}/usr/share/licenses/xorg-server-devel-git/COPYING"
}
