# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Tau Tsao <realturner at gmail.com>
pkgname=xrdp-devel-git
pkgver=0.9.1.r255.ga094c65a
pkgrel=1
pkgdesc="An open source remote desktop protocol (RDP) server - GIT version"
url="https://github.com/neutrinolabs/xrdp"
arch=('i686' 'x86_64' 'armv6h')
license=('Apache')
makedepends=('git' 'nasm')
depends=('tigervnc' 'libxrandr' 'lame' 'opus' 'fuse')
conflicts=('xrdp')
provides=('xrdp=0.9.1')
backup=('etc/xrdp/sesman.ini' 'etc/xrdp/xrdp.ini')
install="${pkgname}.install"
source=("$pkgname::git+https://github.com/neutrinolabs/xrdp.git#branch=devel"
        "arch-config.diff")
md5sums=('SKIP'
         'b41c3d596a582d00e83cd55c756e9ee4')

pkgver() {
  cd $pkgname
  printf "0.9.1.r%s.g%s" "$(git rev-list --count v0.9.1..HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $pkgname
  patch -Np2 -b -z .orig < ../arch-config.diff
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
	      --enable-rfxcodec \
	      --enable-mp3lame \
	      --enable-pixman
  make V=0
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  rm -f "$pkgdir"/etc/xrdp/rsakeys.ini
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
md5sums=('SKIP'
         'd43731272860b236d49dd643312ee03e')
