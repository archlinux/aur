# Maintainer: Jianhui Z <jianhui@outlook.com>
# Contributor: Tau Tsao <realturner at gmail.com>
_githash=04b729c
pkgname=xrdp-git
pkgver=0.9.0.$_githash
pkgrel=1
pkgdesc="An open source remote desktop protocol(rdp) server - GIT version"
arch=('i686' 'x86_64')
url="https://github.com/neutrinolabs/xrdp"
license=('Apache')
groups=()
depends=('libxrandr' 'tigervnc')
makedepends=('git' 'autoconf' 'automake' 'libtool')
optdepends=()
provides=()
conflicts=('xrdp')
replaces=()
backup=('etc/xrdp/sesman.ini' 'etc/xrdp/xrdp.ini')
options=()
install=xrdp-git.install
changelog=
source=("$pkgname::git+https://github.com/neutrinolabs/xrdp.git#commit=$_githash"
        "arch-config.diff")
noextract=()
md5sums=('SKIP'
         '12bcbdf83cae9754da5e39aaf5e013e8')

prepare() {
  cd $pkgname

  sed -i 's|/etc/sysconfig/xrdp|/etc/xrdp/xrdp.ini|' instfiles/xrdp.service
  sed -i 's|/etc/sysconfig/xrdp|/etc/xrdp/xrdp.ini|' instfiles/xrdp-sesman.service

  sed -i 's|/usr/local/sbin|/usr/bin|' instfiles/xrdp.sh
  sed -i 's|/usr/sbin|/usr/bin|' instfiles/xrdp.service
  sed -i 's|/usr/sbin|/usr/bin|' instfiles/xrdp-sesman.service
  patch -p1 < ../arch-config.diff
}

build() {
  cd $pkgname
  ./bootstrap
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --sbindir=/usr/bin
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir/" install
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
