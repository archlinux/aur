# $Id: PKGBUILD 213872 2014-05-30 21:30:40Z bisson $
# Maintainer: Brian Bidulock <bidulock@Openss7.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgbase=libvncserver-git
pkgname=(libvncserver-git x11vnc-git)
pkgver=0.9.9.r65.g50dbe1d
pkgrel=1
pkgdesc='VNC server for real X displays'
url="https://${_pkgname}.github.io"
arch=('i686' 'x86_64')
license=('GPL2')
options=('!emptydirs')
source=("$pkgbase::git+http://github.com/LibVNC/libvncserver.git"
	'build.patch'
        'service')
sha1sums=('SKIP'
          'dc92d478631acfe1a8404c7258c60d4233c7fdf7'
          '53e1ed7f84518a699a29607a03bee2321f9f9624')

pkgver() {
  cd $pkgbase
  git describe --tags --long | sed -r -e 's,^[^0-9]*,,;s,([0-9]*-g),r\1,;s,[-_],.,g'
}

prepare() {
  cd $pkgbase
  patch -Np2 -b -z .orig -i ../build.patch
  autoreconf -fiv
}

build() {
  cd $pkgbase
  ./configure --prefix=/usr --mandir=/usr/share/man --with-x11vnc --without-libva
  make
}

package_libvncserver-git() {
  depends=(libpng libjpeg gnutls libgcrypt openssl)
  provides=(libvncserver)
  conflicts=(libvncserver)

  cd $pkgbase
  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" -C x11vnc uninstall
}

package_x11vnc-git() {
  depends=(libvncserver-git libxtst libxinerama libxdamage libxrandr avahi openssl)
  provides=(x11vnc)
  conflicts=(x11vnc)
  optdepends=(
	'tk: GUI support'
	'net-tools: -auth guess'
	'xf86-video-dummy: Xdummy script'
	'java-environment: java-applet support')

  cd $pkgbase
  make DESTDIR="$pkgdir" -C x11vnc install
  install x11vnc/tkx11vnc x11vnc/misc/{rx11vnc,Xdummy} "$pkgdir/usr/bin"
  install -Dm644 ../service "${pkgdir}/usr/lib/systemd/system/x11vnc.service"
  install -d "$pkgdir/usr/share/x11vnc/classes/ssl"
  install -m644 webclients/java-applet/ssl/index.vnc "$pkgdir/usr/share/x11vnc/classes"
  install -m644 webclients/java-applet/VncViewer.jar "$pkgdir/usr/share/x11vnc/classes"
  install -m644 webclients/java-applet/ssl/{README,*.vnc,*.jar} "$pkgdir/usr/share/x11vnc/classes/ssl"
  install -m755 webclients/java-applet/ssl/ss_vncviewer "$pkgdir/usr/share/x11vnc/classes/ssl"
}
