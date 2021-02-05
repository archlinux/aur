# $Id$
# Maintainer (original xorg-server): AndyRTR <andyrtr@archlinux.org>
# Maintainer (original xorg-server): Jan de Groot <jgc@archlinux.org>
# Maintainer: Rafal Malachowicz <k5hv@linux.pl>
# Maintainer: mirh

pkgbase=xorg-server1.19-git
_pkgbase=xorg-server
pkgname=('xorg-server1.19-git' 'xorg-server1.19-xephyr-git' 'xorg-server1.19-xdmx-git' 'xorg-server1.19-xvfb-git' 'xorg-server1.19-xnest-git' 'xorg-server1.19-xwayland-git' 'xorg-server1.19-common-git' 'xorg-server1.19-devel-git')
pkgver=1.19.7
pkgrel=1
arch=('x86_64')
license=('custom')
groups=('xorg')
url="http://xorg.freedesktop.org"
makedepends=('xorgproto' 'pixman' 'libx11' 'mesa' 'xtrans' 'libxkbfile' 'libxfont2'
             'libpciaccess' 'libxv' 'libxmu' 'libxrender' 'libxi' 'libxaw' 'libdmx'
             'libxtst' 'libxres' 'xorg-xkbcomp' 'xorg-util-macros' 'xorg-font-util'
             'libgcrypt' 'libepoxy' 'xcb-util' 'xcb-util-image' 'xcb-util-renderutil'
             'xcb-util-wm' 'xcb-util-keysyms' 'libxshmfence' 'libunwind' 'systemd'
             'wayland-protocols' 'git')
# _commit=56547b196660e246e37132960723819972b99c8c # branch 1.19
#source=(https://xorg.freedesktop.org/releases/individual/xserver/${_pkgbase}-${pkgver}.tar.bz2{,.sig}
source=("git+https://anongit.freedesktop.org/git/xorg/xserver.git#branch=server-1.19-branch"
        nvidia-add-modulepath-support.patch
        xserver-autobind-hotplug.patch
        xext-shm-downgrade-from-error-to-debug.patch
        xvfb-run
        xvfb-run.1
        libglvnd-glx.patch
        libglvnd-glamor.patch
        35-gcc-10.patch)
# validpgpkeys=('7B27A3F1A6E18CD9588B4AE8310180050905E40C'
#               'C383B778255613DFDB409D91DB221A6900000011'
#               'DD38563A8A8224537D1F90E45B8A2D50A0ECD0D3'
#               '995ED5C8A6138EB0961F18474C09DD83CAAA50B2')
sha256sums=('SKIP'
            '914a8d775b708f836ae3f0eeca553da3872727a2e4262190f4d5c01241cb14e8'
            'fcaf536e4fc307958923b58f2baf3d3102ad694efc28506f6f95a9e64483fa57'
            'ecfd6f72bd6e9494f64d48ab4abb8c68d07ce102c90b07006b21d60f63c1cdc8'
            'ff0156309470fc1d378fd2e104338020a884295e285972cc88e250e031cc35b9'
            '2460adccd3362fefd4cdc5f1c70f332d7b578091fb9167bf88b5f91265bbd776'
            'c213df933a66876a1eb6ff2ae30d8db682071d4f019bf3b4419bb7ad015f02a4'
            '56f0f7190154537424864ed7c878ef86802bd93491ff86b640208246b2c48dcf'
            '9899190ae04aa173bad76a67ce706ad99b9f3bcef80ba7d9703548381ff5d423')

pkgver() {
  cd xserver
  git describe --tags | sed 's/^xorg-server-//;s/_/./g;s/-/+/g'
}

prepare() {
  cd xserver
  #cd "${_pkgbase}-${pkgver}"

  # merged upstream in trunk
  patch -Np1 -i ../nvidia-add-modulepath-support.patch
  # patch from Fedora, not yet merged
  patch -Np1 -i ../xserver-autobind-hotplug.patch
  # merged upstream in trunk (FS#58187)
  patch -Np1 -i ../xext-shm-downgrade-from-error-to-debug.patch
  # Pkg-config fix backport (X.org #893)
  patch -Np1 -i ../libglvnd-glx.patch
  # Glamor define fix (X.org #914)
  patch -Np1 -i ../libglvnd-glamor.patch
  # Gcc10 fix, courtesy of OpenIndiana Userland
  patch -Np1 -i ../35-gcc-10.patch

  autoreconf -vfi
}

build() {
  # Since pacman 5.0.2-2, hardened flags are now enabled in makepkg.conf
  # With them, module fail to load with undefined symbol.
  # See https://bugs.archlinux.org/task/55102 / https://bugs.archlinux.org/task/54845
  export CFLAGS=${CFLAGS/-fno-plt}
  export CXXFLAGS=${CXXFLAGS/-fno-plt}
  export LDFLAGS=${LDFLAGS/,-z,now}

  cd xserver
  #cd "${_pkgbase}-${pkgver}"
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

  make

  # Disable subdirs for make install rule to make splitting easier
  sed -e 's/^DMX_SUBDIRS =.*/DMX_SUBDIRS =/' \
      -e 's/^XVFB_SUBDIRS =.*/XVFB_SUBDIRS =/' \
      -e 's/^XNEST_SUBDIRS =.*/XNEST_SUBDIRS = /' \
      -e 's/^KDRIVE_SUBDIRS =.*/KDRIVE_SUBDIRS =/' \
      -e 's/^XWAYLAND_SUBDIRS =.*/XWAYLAND_SUBDIRS =/' \
      -i hw/Makefile
}

package_xorg-server1.19-common-git() {
  pkgdesc="Xorg server common files"
  depends=(xkeyboard-config xorg-xkbcomp xorg-setxkbmap)
  provides=("xorg-server-common=$pkgver")
  conflicts=('xorg-server-common')

  cd xserver
  #cd "${_pkgbase}-${pkgver}"
  install -m755 -d "${pkgdir}/usr/share/licenses/xorg-server-common"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/xorg-server-common"
  
  make -C xkb DESTDIR="${pkgdir}" install-data

  install -m755 -d "${pkgdir}/usr/share/man/man1"
  install -m644 man/Xserver.1 "${pkgdir}/usr/share/man/man1/"

  install -m755 -d "${pkgdir}/usr/lib/xorg"
  install -m644 dix/protocol.txt "${pkgdir}/usr/lib/xorg/"
}

package_xorg-server1.19-git() {
  pkgdesc="Xorg X server"
  depends=(libepoxy libxfont2 pixman xorg-server-common libunwind dbus libgl xf86-input-libinput
           libpciaccess libdrm libxshmfence) # FS#52949

  # see xorg-server-*/hw/xfree86/common/xf86Module.h for ABI versions - we provide major numbers that drivers can depend on
  # and /usr/lib/pkgconfig/xorg-server.pc in xorg-server-devel pkg
  provides=('X-ABI-VIDEODRV_VERSION=23' 'X-ABI-XINPUT_VERSION=24.1' 'X-ABI-EXTENSION_VERSION=10.0' "xorg-server=$pkgver")
  conflicts=('nvidia-utils<=331.20' 'glamor-egl' 'xf86-video-modesetting' 'xorg-server')
  replaces=('glamor-egl' 'xf86-video-modesetting')
  install=xorg-server.install

  cd xserver
  #cd "${_pkgbase}-${pkgver}"
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

package_xorg-server1.19-xephyr-git() {
  pkgdesc="A nested X server that runs as an X application"
  depends=(libxfont2 libgl libepoxy libunwind systemd-libs libxv pixman xorg-server-common xcb-util-image
           xcb-util-renderutil xcb-util-wm xcb-util-keysyms)
  provides=("xorg-server-xephyr=$pkgver")
  conflicts=('xorg-server-xephyr')

  cd xserver/hw/kdrive
  #cd "${_pkgbase}-${pkgver}/hw/kdrive"
  make DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}/usr/share/licenses/xorg-server-xephyr"
  ln -sf ../xorg-server-common/COPYING "${pkgdir}/usr/share/licenses/xorg-server-xephyr/COPYING"
}

package_xorg-server1.19-xvfb-git() {
  pkgdesc="Virtual framebuffer X server"
  depends=(libxfont2 libunwind systemd-libs pixman xorg-server-common xorg-xauth libgl which)
  provides=("xorg-server-xvfb=$pkgver")
  conflicts=('xorg-server-xvfb')

  cd xserver/hw/vfb
  #cd "${_pkgbase}-${pkgver}/hw/vfb"
  make DESTDIR="${pkgdir}" install

  install -m755 "${srcdir}/xvfb-run" "${pkgdir}/usr/bin/"
  install -m644 "${srcdir}/xvfb-run.1" "${pkgdir}/usr/share/man/man1/"

  install -m755 -d "${pkgdir}/usr/share/licenses/xorg-server-xvfb"
  ln -sf ../xorg-server-common/COPYING "${pkgdir}/usr/share/licenses/xorg-server-xvfb/COPYING"
}

package_xorg-server1.19-xnest-git() {
  pkgdesc="A nested X server that runs as an X application"
  depends=(libxfont2 libxext libunwind pixman xorg-server-common systemd-libs)
  provides=("xorg-server-xnest=$pkgver")
  conflicts=('xorg-server-xnest')

  cd xserver/hw/xnest
  #cd "${_pkgbase}-${pkgver}/hw/xnest"
  make DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}/usr/share/licenses/xorg-server-xnest"
  ln -sf ../xorg-server-common/COPYING "${pkgdir}/usr/share/licenses/xorg-server-xnest/COPYING"
}

package_xorg-server1.19-xdmx-git() {
  pkgdesc="Distributed Multihead X Server and utilities"
  depends=(libxfont2 libxi libxaw libxrender libdmx libxfixes libunwind pixman xorg-server-common)
  provides=("xorg-server-xdmx=$pkgver")
  conflicts=('xorg-server-xdmx')

  cd xserver/hw/dmx
  #cd "${_pkgbase}-${pkgver}/hw/dmx"
  make DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}/usr/share/licenses/xorg-server-xdmx"
  ln -sf ../xorg-server-common/COPYING "${pkgdir}/usr/share/licenses/xorg-server-xdmx/COPYING"
}

package_xorg-server1.19-xwayland-git() {
  pkgdesc="run X clients under wayland"
  depends=(libxfont2 libepoxy libunwind systemd-libs libgl pixman xorg-server-common)
  provides=("xorg-server-xwayland=$pkgver")
  conflicts=('xorg-server-xwayland')

  cd xserver/hw/xwayland
  #cd "${_pkgbase}-${pkgver}/hw/xwayland"
  make DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}/usr/share/licenses/xorg-server-xwayland"
  ln -sf ../xorg-server-common/COPYING "${pkgdir}/usr/share/licenses/xorg-server-xwayland/COPYING"
}

package_xorg-server1.19-devel-git() {
  pkgdesc="Development files for the X.Org X server"
  depends=(# see pkgdir/usr/lib/pkgconfig/xorg-server.pc
           xorgproto pixman mesa libpciaccess
           # not technically required but almost every Xorg pkg needs it to build
           xorg-util-macros)
  provides=("xorg-server-devel=$pkgver")
  conflicts=('xorg-server-devel')

  cd xserver
  #cd "${_pkgbase}-${pkgver}"
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
