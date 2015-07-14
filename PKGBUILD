# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Tau Tsao <realturner at gmail.com>
pkgname=xrdp-git
pkgver=0.8.0.r432.g2ed8108
pkgrel=1
epoch=1
pkgdesc="An open source remote desktop protocol (RDP) server - GIT version"
url="https://github.com/neutrinolabs/xrdp"
arch=('i686' 'x86_64' 'armv6h')
license=('Apache')
makedepends=('libpulse' 'fuse' 'git')
depends=('tigervnc' 'libxrandr')
optdepends=('libpulse: to use the pule audio module'
            'fuse: to use the file clipboard module')
conflicts=('xrdp')
provides=('xrdp=0.8.0')
backup=('etc/xrdp/sesman.ini' 'etc/xrdp/xrdp.ini')
install=xrdp-git.install
source=("$pkgname::git+https://github.com/neutrinolabs/xrdp.git"
        "arch-config.diff")
md5sums=('SKIP'
         'd08f0984fc543e2478eaa79337726da7')

pkgver() {
  cd $pkgname
  printf "0.8.0.r%s.g%s" "$(git rev-list --count v0.8.0..HEAD)" "$(git rev-parse --short HEAD)"
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
              --enable-simplesound \
              --enable-fuse \
              --enable-loadpulsemodules
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
