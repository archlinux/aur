# Maintainer: xuelingkang <xuelingkang at 163 dot com>
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Uroš Vampl <mobile.leecher at gmail dot com>

pkgname=tigervnc-server
_pkgname=tigervnc
pkgver=1.11.0
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
	ftp://ftp.freedesktop.org/pub/xorg/individual/xserver/xorg-server-${_xorgver}.tar.bz2
	Xsession
	more-xsessions.patch
	remove-selinux.patch)
sha256sums=('3648eca472a92a4e8fe55b27cd397b1bf16bad0b24a3a1988661f44553f5e2c3'
            'e219f2e0dfe455467939149d7cd2ee53b79b512cc1d2094ae4f5c9ed9ccd3571'
            'c9276f6ea277cf9654fb2cc3bc9dadbb2e596b5cf8ca867ee906c0080cf7f810'
            'cb57dece026b29d7019a3e1e42fd2fb201d37fc60a70c885d2a50acffb808c06'
            '71efc3bedd5be49089f4ca93517fb7fb6fadf002319cd9c8b3ac032ff3cadab0')

prepare() {
  cd "$srcdir"/${_pkgname}-${pkgver}
  patch -p1 -i "$srcdir"/more-xsessions.patch
  patch -p1 -i "$srcdir"/remove-selinux.patch

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
