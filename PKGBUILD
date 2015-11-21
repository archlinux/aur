# Maintainer: Uroš Vampl <mobile.leecher at gmail dot com>

pkgname=tigervnc-git
pkgver=r3167.36eac99
pkgrel=1
_xorgver=1.18.0
pkgdesc="Suite of VNC servers and clients. Based on the VNC 4 branch of TightVNC."
arch=('i686' 'x86_64')
url="http://www.tigervnc.org"
license=('GPL')
depends=('fltk' 'pam' 'gnutls' 'libjpeg-turbo' 'libxtst' 'libxfont' 'pixman'
	 'xorg-xauth' 'xorg-xsetroot' 'xkeyboard-config' 'xorg-xkbcomp'
	 'libgl' 'libgcrypt' 'perl')
makedepends=('cmake' 'nasm' 'xorg-font-util' 'xorg-util-macros' 'bigreqsproto'
	     'compositeproto' 'damageproto' 'randrproto' 'resourceproto'
	     'scrnsaverproto' 'videoproto' 'xcmiscproto' 'xf86vidmodeproto'
	     'xtrans' 'glproto' 'dri2proto' 'dri3proto' 'presentproto'
	     'mesa' 'git')
optdepends=('mesa: for OpenGL functionality in Xvnc')
conflicts=('tigervnc' 'tightvnc')
provides=('tigervnc')
source=(git+https://github.com/TigerVNC/tigervnc.git
	ftp://ftp.freedesktop.org/pub/xorg/individual/xserver/xorg-server-${_xorgver}.tar.bz2
	vncserver.service
	vncviewer.desktop
	xorg118.patch)
md5sums=('SKIP'
         '3c1c1057d3ad27380d8dd87ffcc182cd'
         'a8a20685c23a50f86a13c33ce96a7ba7'
         'b200d83c60e80c6f9693ea19a2d9f5b0'
         '731083cf1bd4d5ca338bc1f680a361b8')

pkgver() {
  cd tigervnc
  echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd tigervnc

  patch -Np1 -i ${srcdir}/xorg118.patch
  sed -i 's/iconic/nowin/' unix/vncserver

  cd unix/xserver
  cp -r ${srcdir}/xorg-server-${_xorgver}/* .
  patch -Np1 -i ../xserver117.patch
}

build() {
  cd tigervnc
  cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX=/usr
  make

  cd unix/xserver
  autoreconf -fiv
  ./configure --prefix=/usr \
	--disable-static --without-dtrace \
	--disable-xorg --disable-xnest --disable-xvfb --disable-dmx \
	--disable-xwin --disable-xephyr --disable-kdrive --disable-xwayland \
	--disable-config-hal --disable-config-udev --with-pic \
	--disable-unit-tests --disable-devel-docs --disable-selective-werror \
	--disable-dri --enable-dri2 --enable-dri3 --enable-glx
  make
}

package() {
  cd tigervnc
  make DESTDIR=${pkgdir} install
  cd unix/xserver/hw/vnc
  make DESTDIR=${pkgdir} install
  install -Dm0644 $srcdir/vncserver.service $pkgdir/usr/lib/systemd/system/vncserver.service
  install -Dm0644 $srcdir/vncviewer.desktop $pkgdir/usr/share/applications/vncviewer.desktop
}
