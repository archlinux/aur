# $Id: PKGBUILD 213872 2014-05-30 21:30:40Z bisson $
# Maintainer: Brian Bidulock <bidulock@Openss7.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=x11vnc-git
pkgver=0.9.14.r524.gcb88cb2
pkgrel=1
pkgdesc='VNC server for real X displays'
url="https://LibVNC.github.io"
arch=('i686' 'x86_64')
license=('GPL')
provides=('x11vnc')
conflicts=('x11vnc')
depends=('cairo' 'libxcursor' 'libxcomposite' 'libvncserver-git' 'libxtst' 'libxinerama' 'libxdamage' 'libxrandr' 'avahi')
makedepends=('git' 'autoconf-archive')
optdepends=('tk: GUI support'
	    'net-tools: -auth guess'
	    'xf86-video-dummy: Xdummy script'
	    'java-environment: java-applet support')
source=("$pkgname::git+https://github.com/LibVNC/x11vnc.git"
	"x11vnc.service")
sha1sums=('SKIP'
          '9e3838c8dcd4e0a20ab7808937375476cf191318')

pkgver() {
  cd $pkgname
  printf "0.9.14.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $pkgname
  autoreconf -fiv
}

build() {
  cd $pkgname
  ./configure --prefix=/usr --mandir=/usr/share/man
  make V=0
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  install -m755 tkx11vnc misc/{rx11vnc,Xdummy} "$pkgdir/usr/bin"
  install -Dm644 ../x11vnc.service "${pkgdir}/usr/lib/systemd/system/x11vnc.service"
}
