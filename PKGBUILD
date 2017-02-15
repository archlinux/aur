# Maintainer: Det <nimetonmaili g-mail>
# Based on [testing]'s xorg-server

_pkgbase=xorg-server
pkgname=('xorg-server-dev' 'xorg-server-xephyr-dev' 'xorg-server-xdmx-dev' 'xorg-server-xvfb-dev' 'xorg-server-xnest-dev' 'xorg-server-xwayland-dev' 'xorg-server-common-dev' 'xorg-server-devel-dev')
pkgver=1.19.1 # http://lists.x.org/archives/xorg/2017-January/058559.html
pkgrel=5 # https://git.archlinux.org/svntogit/packages.git/commit/trunk?h=packages/xorg-server&id=ae1a2da73382be5ad3837a41cf4a20ae49bf7ef6
arch=('i686' 'x86_64')
license=('custom')
groups=('xorg')
url="https://xorg.freedesktop.org"
makedepends=('pixman' 'libx11' 'mesa' 'libgl' 'xf86driproto' 'xcmiscproto' 'xtrans' 'bigreqsproto' 'randrproto' 
             'inputproto' 'fontsproto' 'videoproto' 'presentproto' 'compositeproto' 'recordproto' 'scrnsaverproto'
             'resourceproto' 'xineramaproto' 'libxkbfile' 'libxfont2' 'renderproto' 'libpciaccess' 'libxv'
             'xf86dgaproto' 'libxmu' 'libxrender' 'libxi' 'dmxproto' 'libxaw' 'libdmx' 'libxtst' 'libxres'
             'xorg-xkbcomp' 'xorg-util-macros' 'xorg-font-util' 'glproto' 'dri2proto' 'libgcrypt' 'libepoxy'
             'xcb-util' 'xcb-util-image' 'xcb-util-renderutil' 'xcb-util-wm' 'xcb-util-keysyms' 'dri3proto'
             'libxshmfence' 'libunwind' 'systemd' 'wayland-protocols')
source=(${url}/releases/individual/xserver/${_pkgbase}-${pkgver}.tar.bz2{,.sig}
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

  msg2 "merged upstream in trunk"
  patch -Np1 -i ../nvidia-add-modulepath-support.patch

  msg2 "Fix: Bug 99358 - Xorg crashes with SIGSEGV in sna_set_cursor_position()"
  msg2 "https://bugs.freedesktop.org/show_bug.cgi?id=99358"
  msg2 "https://bugs.archlinux.org/task/52808"
  patch -Np1 -i ../bug99358.patch
}

build() {
  cd "${_pkgbase}-${pkgver}"

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
      --enable-kdrive \
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

package_xorg-server-common-dev() {
  pkgdesc="Xorg server common files - Bleeding edge version"
  depends=(xkeyboard-config xorg-xkbcomp xorg-setxkbmap xorg-fonts-misc)
  provides=(xorg-server-common)
  conflicts=(xorg-server-common)

  cd "${_pkgbase}-${pkgver}"
  install -m755 -d "${pkgdir}/usr/share/licenses/xorg-server-common"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/xorg-server-common"
  
  msg2 "Starting make install-data..."
  make -C xkb DESTDIR="${pkgdir}" install-data

  install -m755 -d "${pkgdir}/usr/share/man/man1"
  install -m644 man/Xserver.1 "${pkgdir}/usr/share/man/man1/"

  install -m755 -d "${pkgdir}/usr/lib/xorg"
  install -m644 dix/protocol.txt "${pkgdir}/usr/lib/xorg/"
}

package_xorg-server-dev() {
  pkgdesc="Xorg X server - Bleeding edge version"
  depends=(libepoxy libxfont2 pixman xorg-server-common-dev libunwind dbus libgl xf86-input-libinput
           libpciaccess libdrm libxshmfence) # FS#52949

  # see src/xorg-server-*/hw/xfree86/common/xf86Module.h for ABI versions - we provide major numbers that drivers can depend on
  # and /usr/lib/pkgconfig/xorg-server.pc in xorg-server-devel-dev pkg
  provides=('xorg-server' 'X-ABI-VIDEODRV_VERSION=23' 'X-ABI-XINPUT_VERSION=24.1' 'X-ABI-EXTENSION_VERSION=10.0' 'x-server')
  conflicts=('xorg-server' 'nvidia-utils<375.26-3' 'glamor-egl' 'xf86-video-modesetting')
  replaces=('glamor-egl' 'xf86-video-modesetting')
  install=xorg-server-dev.install

  cd "${_pkgbase}-${pkgver}"

  msg2 "Starting make install..."
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

package_xorg-server-xephyr-dev() {
  pkgdesc="A nested X server that runs as an X application - Bleeding edge version"
  depends=(libxfont2 libgl libepoxy libunwind libsystemd libxv pixman xorg-server-common-dev xcb-util-image
           xcb-util-renderutil xcb-util-wm xcb-util-keysyms)
  provides=(xorg-server-xephyr)
  conflicts=(xorg-server-xephyr)

  cd "${_pkgbase}-${pkgver}/hw/kdrive"

  msg2 "Starting make install..."
  make DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}/usr/share/licenses/xorg-server-xephyr"
  ln -sf ../xorg-server-common/COPYING "${pkgdir}/usr/share/licenses/xorg-server-xephyr/COPYING"
}

package_xorg-server-xvfb-dev() {
  pkgdesc="Virtual framebuffer X server - Bleeding edge version"
  depends=(libxfont2 libunwind libsystemd pixman xorg-server-common-dev xorg-xauth libgl)
  provides=(xorg-server-xvfb)
  conflicts=(xorg-server-xvfb)

  cd "${_pkgbase}-${pkgver}/hw/vfb"

  msg2 "Starting make install..."
  make DESTDIR="${pkgdir}" install

  install -m755 "${srcdir}/xvfb-run" "${pkgdir}/usr/bin/"
  install -m644 "${srcdir}/xvfb-run.1" "${pkgdir}/usr/share/man/man1/"

  install -m755 -d "${pkgdir}/usr/share/licenses/xorg-server-xvfb"
  ln -sf ../xorg-server-common/COPYING "${pkgdir}/usr/share/licenses/xorg-server-xvfb/COPYING"
}

package_xorg-server-xnest-dev() {
  pkgdesc="A nested X server that runs as an X application - Bleeding edge version"
  depends=(libxfont2 libxext libunwind pixman xorg-server-common-dev libsystemd)
  provides=(xorg-server-xnest)
  conflicts=(xorg-server-xnest)

  cd "${_pkgbase}-${pkgver}/hw/xnest"

  msg2 "Starting make install..."
  make DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}/usr/share/licenses/xorg-server-xnest"
  ln -sf ../xorg-server-common/COPYING "${pkgdir}/usr/share/licenses/xorg-server-xnest/COPYING"
}

package_xorg-server-xdmx-dev() {
  pkgdesc="Distributed Multihead X Server and utilities - Bleeding edge version"
  depends=(libxfont2 libxi libxaw libxrender libdmx libxfixes libunwind pixman xorg-server-common-dev)
  provides=(xorg-server-xdmx)
  conflicts=(xorg-server-xdmx)

  cd "${_pkgbase}-${pkgver}/hw/dmx"

  msg2 "Starting make install..."
  make DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}/usr/share/licenses/xorg-server-xdmx"
  ln -sf ../xorg-server-common/COPYING "${pkgdir}/usr/share/licenses/xorg-server-xdmx/COPYING"
}

package_xorg-server-xwayland-dev() {
  pkgdesc="Run X clients under Wayland - Bleeding edge version"
  depends=(libxfont libepoxy libgl pixman xorg-server-common-dev)
  provides=(xorg-server-xwayland)
  conflicts=(xorg-server-xwayland)

  cd "${_pkgbase}-${pkgver}/hw/xwayland"

  msg2 "Starting make install..."
  make DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}/usr/share/licenses/xorg-server-xwayland"
  ln -sf ../xorg-server-common/COPYING "${pkgdir}/usr/share/licenses/xorg-server-xwayland/COPYING"
}

package_xorg-server-devel-dev() {
  pkgdesc="Development files for the X.Org X server - Bleeding edge version"
  depends=(# see pkgdir/usr/lib/pkgconfig/xorg-server.pc
           xproto randrproto renderproto xextproto inputproto kbproto 
           fontsproto pixman videoproto xf86driproto glproto 
           mesa dri2proto dri3proto xineramaproto libpciaccess
           resourceproto scrnsaverproto presentproto
           # not technically required but almost every Xorg pkg needs it to build
           xorg-util-macros)
  provides=(xorg-server-devel)
  conflicts=(xorg-server-devel)

  cd "${_pkgbase}-${pkgver}"

  msg2 "Starting make install..."
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
