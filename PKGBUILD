# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
# Maintainer of the xorg-server package: AndyRTR <andyrtr@archlinux.org>
# Maintainer of the xorg-server package: Jan de Groot <jgc@archlinux.org>

_pkgname=xorg-server
pkgname=xorg-server-hwcursor-gamma
pkgver=1.18.2
pkgrel=1 # 4 in xorg-server
pkgdesc="Xorg X server with patch to apply gamma ramps on hardware cursors"
depends=(libepoxy libxdmcp libxfont libpciaccess libdrm pixman libgcrypt libxau xorg-server-common libxshmfence libgl xf86-input-evdev)
provides=("xorg-server=${pkgver}" 'X-ABI-VIDEODRV_VERSION=20' 'X-ABI-XINPUT_VERSION=22.1' 'X-ABI-EXTENSION_VERSION=9.0' 'x-server')
conflicts=('xorg-server' 'nvidia-utils<=331.20' 'glamor-egl' 'xf86-video-modesetting')
replaces=('glamor-egl' 'xf86-video-modesetting')
arch=('i686' 'x86_64')
license=('custom')
url="http://xorg.freedesktop.org"
makedepends=('pixman' 'libx11' 'mesa' 'mesa-libgl' 'xf86driproto' 'xcmiscproto' 'xtrans' 'bigreqsproto' 'randrproto' 
             'inputproto' 'fontsproto' 'videoproto' 'presentproto' 'compositeproto' 'recordproto' 'scrnsaverproto'
             'resourceproto' 'xineramaproto' 'libxkbfile' 'libxfont' 'renderproto' 'libpciaccess' 'libxv'
             'xf86dgaproto' 'libxmu' 'libxrender' 'libxi' 'dmxproto' 'libxaw' 'libdmx' 'libxtst' 'libxres'
             'xorg-xkbcomp' 'xorg-util-macros' 'xorg-font-util' 'glproto' 'dri2proto' 'libgcrypt' 'libepoxy'
             'xcb-util' 'xcb-util-image' 'xcb-util-renderutil' 'xcb-util-wm' 'xcb-util-keysyms' 'dri3proto'
	     'libxshmfence' 'libunwind')
source=(${url}/releases/individual/xserver/${_pkgname}-${pkgver}.tar.bz2
        xvfb-run
        xvfb-run.1
        0001-glamor-swizzle-RED-to-0-for-alpha-textures.patch
	0001-Xext-vidmode-Reduce-verbosity-of-GetModeLine.patch
	0001-present-Only-requeue-for-next-MSC-after-flip-failure.patch
	0001-When-an-cursor-is-set-it-is-adjusted-to-use-the.patch
	0002-Fix-for-full-and-semi-transparency-under-negative-im.patch
	0003-Use-Harms-s-suggest-do-not-use-inline-if.-And-fix-si.patch)
sha256sums=('022142b07f6477d140dcc915902df326408a53ca3a352426a499f142b25d632d'
            'ff0156309470fc1d378fd2e104338020a884295e285972cc88e250e031cc35b9'
	    '2460adccd3362fefd4cdc5f1c70f332d7b578091fb9167bf88b5f91265bbd776'
	    '10c66c10f4f71930e2ac3f6e07881e228ca88542af449d2c69c7744ec87335df'
	    '72755a652e72144e3f28c8fa959b4a6df5def838db3cde5077a626e97baab591'
	    '70c84bf1f7cbc818692fb56f57c8b8ef2ea057bc05380b2f797ecba742b7ce31'
	    'bea348631dedd66475d84ac2cfe0840f22a80a642b4680d73fead4749e47f055'
	    'be9169b937b5d0b44f7f05d7c08aaa5f0c1092e128ce261d9cb350f09dfe1fb0'
	    '0a643ae83e03faee0f4db669a33c5b3c99edbba5c86cde2c83962ae536d31081')

prepare() {
  cd "${_pkgname}-${pkgver}"

  msg2 'Fix red tint in Firefox'
  patch -Np1 -i ../0001-glamor-swizzle-RED-to-0-for-alpha-textures.patch

  msg2 'Fix flooding of Xorg log file'
  patch -Np1 -i ../0001-Xext-vidmode-Reduce-verbosity-of-GetModeLine.patch

  msg2 'Fix FS#48549'
  patch -Np1 -i ../0001-present-Only-requeue-for-next-MSC-after-flip-failure.patch

  msg2 'Apply hardware cursors gamma adjustments patches'
  patch -Np1 -i ../0001-When-an-cursor-is-set-it-is-adjusted-to-use-the.patch
  patch -Np1 -i ../0002-Fix-for-full-and-semi-transparency-under-negative-im.patch
  patch -Np1 -i ../0003-Use-Harms-s-suggest-do-not-use-inline-if.-And-fix-si.patch
}

build() {
  cd "${_pkgname}-${pkgver}"
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
      --disable-xwayland \
      --enable-kdrive \
      --enable-kdrive-kbd \
      --enable-kdrive-mouse \
      --enable-config-udev \
      --disable-systemd-logind \
      --disable-suid-wrapper \
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

package() {
  cd "${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  # distro specific files must be installed in /usr/share/X11/xorg.conf.d
  install -m755 -d "${pkgdir}/etc/X11/xorg.conf.d"

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

