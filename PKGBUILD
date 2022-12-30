# Contributor: graysky <therealgraysky AT proton DOT me>
# Contributor: Uroš Vampl <mobile.leecher at gmail dot com>

pkgname=tigervnc-git
pkgver=r4641.eff7fdd8
pkgrel=1
_xorgver=1.20.9
pkgdesc="Suite of VNC servers and clients. Based on the VNC 4 branch of TightVNC."
arch=('x86_64')
url="http://www.tigervnc.org"
license=('GPL')
depends=('fltk' 'pam' 'gnutls' 'libjpeg-turbo' 'libxtst' 'pixman'
	 'xorg-xauth' 'xorg-xsetroot' 'xkeyboard-config' 'xorg-xkbcomp'
	 'libgl' 'libgcrypt' 'perl' 'libxdamage' 'libxfont2' 'libdrm'
	 'xorg-xinit')
makedepends=('cmake' 'nasm' 'xorg-font-util' 'xorg-util-macros' 'git'
	     'xtrans' 'xorgproto'
	     'mesa' 'imagemagick' 'java-environment=8')
optdepends=('mesa: for OpenGL functionality in Xvnc')
conflicts=('tigervnc' 'tightvnc')
provides=('tigervnc')
backup=(etc/pam.d/tigervnc
  etc/tigervnc/vncserver-config-defaults
  etc/tigervnc/vncserver-config-mandatory
  etc/tigervnc/vncserver.users)
source=(git+https://github.com/TigerVNC/tigervnc.git
  https://xorg.freedesktop.org/releases/individual/xserver/xorg-server-${_xorgver}.tar.bz2
  Xsession
  more-xsessions.patch
  remove-selinux.patch)
sha256sums=('SKIP'
            'e219f2e0dfe455467939149d7cd2ee53b79b512cc1d2094ae4f5c9ed9ccd3571'
            'c9276f6ea277cf9654fb2cc3bc9dadbb2e596b5cf8ca867ee906c0080cf7f810'
            'cb57dece026b29d7019a3e1e42fd2fb201d37fc60a70c885d2a50acffb808c06'
            'fb8bb5bd3ec990720580a664326a70fd178ce94b97c2130462df9b1e3a3925c3')

pkgver() {
  cd tigervnc
  echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd tigervnc
  patch -p1 -i "$srcdir"/more-xsessions.patch
  patch -p1 -i "$srcdir"/remove-selinux.patch

  cd unix/xserver
  cp -r "$srcdir"/xorg-server-${_xorgver}/* .
  patch -Np1 -i ../xserver120.patch
}

build() {
  cd tigervnc

  cmake -G "Unix Makefiles" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_SBINDIR=/usr/bin \
    -DCMAKE_INSTALL_LIBEXECDIR=/usr/bin \
    -DBUILD_JAVA=TRUE
  make

  cd unix/xserver
  autoreconf -fiv
  CFLAGS="$CFLAGS -I/usr/include/libdrm" ./configure --prefix=/usr \
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
  make DESTDIR="$pkgdir" install
  install -Dm0644 java/VncViewer.jar "${pkgdir}"/usr/share/vnc/classes/VncViewer.jar
  cd unix/xserver/hw/vnc
  make DESTDIR="$pkgdir" install
  install -Dm0755 "$srcdir"/Xsession "$pkgdir"/etc/X11/tigervnc/Xsession
#  install -Dm0644 "$srcdir"/${pkgname}-${pkgver}/unix/vncserver/vncserver@.service \
#    "$pkgdir"/usr/lib/systemd/user/vncserver@.service
}
