# Maintainer: Uroš Vampl <mobile.leecher at gmail dot com>

pkgname=tigervnc-git
pkgver=r3320.3821d7e
pkgrel=1
_xorgver=1.18.3
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
	vncviewer.desktop)
md5sums=('SKIP'
         '043d720bf2472a65bb8f0daa97f83dfa'
         'a8a20685c23a50f86a13c33ce96a7ba7'
         'b200d83c60e80c6f9693ea19a2d9f5b0')

pkgver() {
  cd tigervnc
  echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd tigervnc

  sed -i 's/iconic/nowin/' unix/vncserver

  cd unix/xserver
  cp -r ${srcdir}/xorg-server-${_xorgver}/* .
  patch -Np1 -i ../xserver118.patch
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
