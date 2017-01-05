# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Tau Tsao <realturner at gmail.com>
pkgname=xrdp-git
pkgver=0.9.1.r0.g93c55e58
pkgrel=2
epoch=1
pkgdesc="An open source remote desktop protocol (RDP) server - GIT version"
url="https://github.com/neutrinolabs/xrdp"
arch=('i686' 'x86_64' 'armv6h')
license=('Apache')
makedepends=('git')
depends=('tigervnc' 'libxrandr' 'lame' 'opus' 'fuse')
conflicts=('xrdp')
provides=('xrdp=0.9.1')
backup=('etc/xrdp/sesman.ini' 'etc/xrdp/xrdp.ini')
install="${pkgname}.install"
source=("$pkgname::git+https://github.com/neutrinolabs/xrdp.git#branch=master"
        "arch-config.diff")
md5sums=('SKIP'
         'cca1a944ca04e33987b60eb7278d4d8f')

pkgver() {
  cd $pkgname
  git describe --tags --long|sed -E 's,^[^0-9]*,,;s,([0-9]*-g),r\1,;s,-,.,g'

}

prepare() {
  cd $pkgname
  patch -Np2 -b -z .orig <../arch-config.diff
  ./bootstrap
}

build() {
  cd $pkgname
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --localstatedir=/var \
              --sbindir=/usr/bin \
              --with-systemdsystemdunitdir=/usr/lib/systemd/system \
              --enable-jpeg \
              --enable-tjpeg \
              --enable-fuse \
	      --enable-opus \
	      --enable-mp3lame \
	      --enable-pixman
  make V=0
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
