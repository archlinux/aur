# Maintainer: Jonas Platte <aur@jonasplatte.de>

pkgname=tntnet-git
pkgver=2.3.pre1.b824f78
pkgrel=2
pkgdesc="A modular, multithreaded, high performance webapplication server for C++"
arch=('i686' 'x86_64')
url="http://www.tntnet.org/tntnet.html"
license=('LGPL')
depends=('cxxtools-git' 'zlib' 'openssl' 'sh')
makedepends=('git')
optdepends=('base-devel: to build tntnet web applications')
provides=('tntnet')
conflicts=('tntnet')
backup=('etc/tntnet/tntnet.xml')
source=("$pkgname::git+https://github.com/maekitalo/${pkgname%-git}.git")
sha256sums=('SKIP')

# This will very likely break if tntnet starts using tags. That is intentional,
# as the --always will be removed then anyway, requiring an update
pkgver() {
  cd "$pkgname"
  echo "2.3.pre1.$(git describe --always)"
}

build() {
  cd "$pkgname"

  autoreconf -i
  ./configure --enable-silent-rules --prefix=/usr --sysconfdir=/etc
  make
}

# Currently broken
#check() {
#  cd "$pkgname"
#
#  ./test/tntnet-test
#}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir/" install
  install -Dm644 ./etc/tntnet/tntnet.xml "$pkgdir/etc/tntnet/tntnet.xml"
}
