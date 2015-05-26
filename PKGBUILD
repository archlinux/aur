# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Tau Tsao <realturner at gmail.com>
pkgname=xrdp-devel-git
pkgver=0.8.0.r410.g8904252
pkgrel=1
pkgdesc="An open source remote desktop protocol (RDP) server - GIT version"
url="https://github.com/neutrinolabs/xrdp"
arch=('i686' 'x86_64' 'armv6h')
license=('Apache')
depends=('tigervnc' 'libxrandr' 'opus' 'fuse')
conflicts=('xrdp')
provides=('xrdp')
backup=('etc/xrdp/sesman.ini' 'etc/xrdp/xrdp.ini')
install=xrdp-devel-git.install
source=("$pkgname::git+https://github.com/neutrinolabs/xrdp.git#branch=devel"
        "arch-config.diff")
md5sums=('SKIP'
         '964d82ca1689435e1e9ae98120e6fb68')

pkgver() {
  cd $pkgname
  printf "0.8.0.r%s.g%s" "$(git rev-list --count v0.8.0..HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $pkgname

  sed -i 's|/etc/sysconfig/xrdp|/etc/xrdp/xrdp.ini|' instfiles/xrdp.service
  sed -i 's|/etc/sysconfig/xrdp|/etc/xrdp/xrdp.ini|' instfiles/xrdp-sesman.service

  sed -i 's|/usr/local/sbin|/usr/bin|' instfiles/xrdp.sh
  sed -i 's|/usr/sbin|/usr/bin|' instfiles/xrdp.service
  sed -i 's|/usr/sbin|/usr/bin|' instfiles/xrdp-sesman.service
  patch -p1 < ../arch-config.diff

  ./bootstrap
}

build() {
  cd $pkgname
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --localstatedir=/var \
              --sbindir=/usr/bin \
              --enable-jpeg \
              --enable-fuse \
	      --enable-opus
  make V=0
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install

  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
