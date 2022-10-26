# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=radvd-git
pkgver=2.19.r86.gc8a11fd
pkgrel=1
pkgdesc="IPv6 router advertisement daemon"
arch=('i686' 'x86_64')
url="https://radvd.litech.org/"
license=('custom')
depends=('glibc')
makedepends=('git')
checkdepends=('check')
provides=("radvd=$pkgver")
conflicts=('radvd')
backup=('etc/radvd.conf')
source=("git+https://github.com/radvd-project/radvd.git")
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
  install -Dm644 "COPYRIGHT" -t "$pkgdir/usr/share/licenses/radvd"
}
