# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=radvd-git
pkgver=2.17.r8.g7488976
pkgrel=1
pkgdesc="IPv6 router advertisement daemon"
arch=('i686' 'x86_64')
url="http://www.litech.org/radvd/"
license=('custom')
depends=('glibc')
makedepends=('git')
checkdepends=('check')
provides=('radvd')
conflicts=('radvd')
backup=('etc/radvd.conf')
source=("git+https://github.com/reubenhwk/radvd.git")
sha256sums=('SKIP')


pkgver() {
  cd "radvd"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "radvd"

  ./autogen.sh
  ./configure --prefix="/usr" \
    --sbindir="/usr/bin" \
    --sysconfdir="/etc" \
    --with-pidfile="/run/radvd.pid" \
    --with-check
  make
}

check() {
  cd "radvd"

  make check
}

package() {
  cd "radvd"

  make DESTDIR="$pkgdir" install

  install -Dm644 "radvd.conf.example" "$pkgdir/etc/radvd.conf"
  install -Dm644 "COPYRIGHT" "$pkgdir/usr/share/licenses/$pkgname/COPYRIGHT"
}
