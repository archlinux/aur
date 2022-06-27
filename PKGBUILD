# Maintainer: xuelingkang <xuelingkang at 163 dot com>
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Uroš Vampl <mobile.leecher at gmail dot com>

pkgname=tigervnc-server
_pkgname=tigervnc
pkgver=1.12.0
pkgrel=1
_xorgver=1.20.9
pkgdesc="TigerVNC (Server only), forked from Archlinux TigerVNC."
arch=('x86_64')
url="http://www.tigervnc.org"
license=('GPL')
depends=('fltk' 'pam' 'gnutls' 'libjpeg-turbo' 'libxtst' 'pixman'
	 'xorg-xauth' 'xorg-xsetroot' 'xkeyboard-config' 'xorg-xkbcomp'
	 'libgl' 'libgcrypt' 'perl' 'libxdamage' 'libxfont2' 'libdrm'
	 'xorg-xinit')
makedepends=('cmake' 'nasm' 'xorg-font-util' 'xorg-util-macros'
	     'xtrans' 'xorgproto'
	     'mesa' 'imagemagick' 'java-environment=8')
optdepends=('mesa: for OpenGL functionality in Xvnc')
conflicts=('tigervnc' 'tightvnc')
backup=(etc/pam.d/tigervnc
	etc/tigervnc/vncserver-config-defaults
	etc/tigervnc/vncserver-config-mandatory
	etc/tigervnc/vncserver.users)
source=($_pkgname-$pkgver.tar.gz::https://github.com/TigerVNC/tigervnc/archive/v${pkgver}.tar.gz
	https://xorg.freedesktop.org/releases/individual/xserver/xorg-server-${_xorgver}.tar.bz2
	Xsession
	https://github.com/TigerVNC/tigervnc/commit/2daf4126882f82b6e392dfbae87205dbdc559c3d.patch
	more-xsessions.patch
	remove-selinux.patch)
sha256sums=('9ff3f3948f2a4e8cc06ee598ee4b1096beb62094c13e0b1462bff78587bed789'
            'e219f2e0dfe455467939149d7cd2ee53b79b512cc1d2094ae4f5c9ed9ccd3571'
            'c9276f6ea277cf9654fb2cc3bc9dadbb2e596b5cf8ca867ee906c0080cf7f810'
            '24683d93569d2cbbb1b64a8b0622c9e3d459194f19c29934780b12d92552f417'
            'cb57dece026b29d7019a3e1e42fd2fb201d37fc60a70c885d2a50acffb808c06'
            'fb8bb5bd3ec990720580a664326a70fd178ce94b97c2130462df9b1e3a3925c3')

prepare() {
  cd "$srcdir"/${_pkgname}-${pkgver}
  patch -p1 -i "$srcdir"/more-xsessions.patch
  patch -p1 -i "$srcdir"/remove-selinux.patch
  patch -p1 -i "$srcdir"/2daf4126882f82b6e392dfbae87205dbdc559c3d.patch

  cd unix/xserver
  cp -r "$srcdir"/xorg-server-${_xorgver}/* .
  patch -Np1 -i ../xserver120.patch
}

build() {
  cd "$srcdir"/${_pkgname}-${pkgver}

  cmake -G "Unix Makefiles" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_SBINDIR=/usr/bin \
    -DCMAKE_INSTALL_LIBEXECDIR=/usr/bin \
    -DBUILD_JAVA=TRUE \
    -DBUILD_VIEWER=false
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
  cd "$srcdir"/${_pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install
  cd unix/xserver/hw/vnc
  make DESTDIR="$pkgdir" install
  install -Dm0755 "$srcdir"/Xsession "$pkgdir"/etc/X11/tigervnc/Xsession
}
