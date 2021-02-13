# Maintainer    : Vincent Grande
# Contributor   : Eric Vidal <eric@obarun.org>
# Contributor   : Jean-Michel T.Dydak <jean-michel@obarun.org>
# Contributor   : AndyRTR <andyrtr@archlinux.org>
# Contributor   : Jan de Groot <jgc@archlinux.org>

pkgname=(
	'xorg-server-rootless-nosystemd-minimal-git'
	'xorg-server-common-rootless-nosystemd-minimal-git'
	'xorg-server-devel-rootless-nosystemd-minimal-git')

pkgver=1.20.999
pkgrel=1
url="http://xorg.freedesktop.org"
source=("git+https://gitlab.freedesktop.org/xorg/xserver.git")

makedepends=(
	'xorgproto'
	'pixman'
	'libx11'
	'mesa'
#	'mesa-libgl'
	'xtrans'
	'libxkbfile'
	'libxfont2'
	'libpciaccess'
	'libxv'
	'libxmu'
	'libxrender'
	'libxi'
	'libxaw'
	'libxtst'
#	'libxres'
	'xorg-xkbcomp'
	'xorg-util-macros'
	'xorg-font-util'
	'libepoxy'
	'xcb-util'
	'xcb-util-image'
	'xcb-util-renderutil'
	'xcb-util-wm'
	'xcb-util-keysyms'
	'libxshmfence'
#	'libunwind'
#	'wayland-protocols'
#	'egl-wayland'
	'meson')

optdepends=('wayland-protocols: xwayland support'
	    'egl-wayland: xwayland support'
            'xorg-xinit: startx support')

pkgver() {
  cd xserver
  # cutting off 'xorg.server.' prefix that presents in the git tag
  git describe --long --tags| sed 's/^xorg.server.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  
cd xserver
  ./autogen.sh
  ./configure --prefix=/usr \
      --disable-ipv6 \
      --disable-dri \
      --disable-dmx \
      --disable-xvfb \
      --disable-xnest \
      --enable-composite \
      --disable-xcsecurity \
      --disable-libunwind \
      --enable-xorg \
      --disable-xephyr \
      --disable-glamor \
      --disable-xwayland \
      --disable-kdrive \
      --disable-kdrive-kbd \
      --disable-kdrive-mouse \
      --enable-config-udev \
      --disable-systemd-logind \
      --disable-suid-wrapper \
      --disable-install-setuid \
      --disable-record \
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
      --without-dtrace \
      --disable-linux-acpi \
      --disable-linux-apm \
      --disable-strict-compilation \
      --disable-debug \
      --without-int10 \
      --disable-listen-tcp \
      --without-fallback-input-driver \
      --disable-sparkle \
      --disable-xres \
      --disable-xvmc \
      --disable-screensaver \
      --disable-xdmcp \
      --disable-xdm-auth-1 \
      --disable-dri2 \
      --disable-dri3 \
      --disable-present \
      --disable-xf86vidmode \
      --disable-xace \
      --disable-xselinux \
      --disable-dbe \
      --disable-xf86bigfont \
      --disable-dpms \
      --disable-config-hal \
      --disable-config-wscons \
      --disable-xfree86-utils \
      --disable-vgahw \
      --disable-int10-module \
      --disable-windowsdri \
      --disable-clientids \
      --disable-xquartz \
      --disable-xwayland-eglstream \
      --disable-standalone-xpbproxy \
      --disable-xwin \
      --disable-xf86-input-inputtest \
      --disable-xshmfence \
      --without-systemd-daemon \
      --disable-secure-rpc \
      --disable-tcp-transport \
      --enable-unit-tests=no \
      --enable-integration-tests=no \
      --enable-agp \
      --enable-libdrm \
      --enable-mitshm \
      --enable-xv \
      --enable-dga \
      --enable-glx \
      --enable-xinerama \
      --enable-pciaccess \
      --enable-input-thread

# dri3 required for xwayland support
# glamor required for xwayland support
# dga required for xorg nvidia blob/amdgpu/mesa ### NOT REQUIRED FOR XWAYLAND
# pciaccess required or build fails with xorg enabled ### NOT REQUIRED FOR XWAYLAND
# agp required or build fails with xorg enabled ### NOT REQUIRED FOR XWAYLAND
# libdrm required or build fails with xorg enabled ### NOT REQUIRED FOR XWAYLAND
# xinerama required for nvidia blob/amdgpu/mesa
# mitshm required for nvidia blob/amdgpu/mesa
# xv required for nvidia blob/amdgpu/mesa
# composite required for nvidia blob/amdgpu/mesa
# b_pgo set to off or build fails
# dpms and dri1 set to true or xf86-video-amdgpu build fails

### enable-unit-tests + xorg flags break compile if -flto / b_lto is enable

make

  # Disable subdirs for make install rule to make splitting easier
  sed -e 's/^DMX_SUBDIRS =.*/DMX_SUBDIRS =/' \
      -e 's/^XVFB_SUBDIRS =.*/XVFB_SUBDIRS =/' \
      -e 's/^XNEST_SUBDIRS =.*/XNEST_SUBDIRS = /' \
      -e 's/^KDRIVE_SUBDIRS =.*/KDRIVE_SUBDIRS =/' \
      -e 's/^XWAYLAND_SUBDIRS =.*/XWAYLAND_SUBDIRS =/' \
      -i hw/Makefile
}
  
package_xorg-server-common-rootless-nosystemd-minimal-git() {
  pkgdesc="Xorg server common files"
  depends=(xkeyboard-config xorg-xkbcomp xorg-setxkbmap)
  conflicts=('xorg-server-common')
  provides=('xorg-server-common')
 
  cd xserver
  install -m755 -d "${pkgdir}/usr/share/licenses/xorg-server-common"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/xorg-server-common"
  
  make -C xkb DESTDIR="${pkgdir}" install-data

  install -m755 -d "${pkgdir}/usr/share/man/man1"
  install -m644 man/Xserver.1 "${pkgdir}/usr/share/man/man1/"

  install -m755 -d "${pkgdir}/usr/lib/xorg"
  install -m644 dix/protocol.txt "${pkgdir}/usr/lib/xorg/"
}

package_xorg-server-rootless-nosystemd-minimal-git() {
  pkgdesc="Xorg X server"
  depends=(libepoxy libxfont2 pixman xorg-server-common-rootless-nosystemd-minimal-git 
           dbus libgl xf86-input-libinput nettle
           libpciaccess libdrm libxshmfence) # FS#52949
  optdepends=('libunwind: unwind backtrace support')

  # see xorg-server-*/hw/xfree86/common/xf86Module.h for ABI versions - we provide major numbers that drivers can depend on
  # and /usr/lib/pkgconfig/xorg-server.pc in xorg-server-devel pkg
  provides=('X-ABI-VIDEODRV_VERSION=24.0' 'X-ABI-XINPUT_VERSION=24.1' 'X-ABI-EXTENSION_VERSION=10.0' 'x-server' 'xorg-server')
  conflicts=('nvidia-utils<=331.20' 'glamor-egl' 'xf86-video-modesetting' 'xorg-server')
  replaces=('glamor-egl' 'xf86-video-modesetting')
  install=xorg-server-rootless-nosystemd-minimal-git.install

  cd xserver
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

package_xorg-server-devel-rootless-nosystemd-minimal-git() {
  pkgdesc="Development files for the X.Org X server"
  depends=('xorgproto' 'mesa' 'libpciaccess'
           # not technically required but almost every Xorg pkg needs it to build
           'xorg-util-macros')
  conflicts=('xorg-server-devel')
  provides=('xorg-server-devel')
  
  cd xserver
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

arch=('x86_64')

groups=('xorg')

license=('custom')

sha512sums=('SKIP')
