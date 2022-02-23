# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=hddtemp-git
pkgver=0.4.3.r1.gccaa1c0
pkgrel=1
pkgdesc="Hard disk temperature tool"
arch=('i686' 'x86_64')
url="https://github.com/vitlav/hddtemp"
license=('GPL')
depends=('glibc')
makedepends=('git')
provides=('hddtemp')
conflicts=('hddtemp')
source=("git+https://github.com/vitlav/hddtemp.git"
        "hddtemp.service::https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/hddtemp/trunk/service")
sha256sums=('SKIP'
            'SKIP')


pkgver() {
  cd "hddtemp"

  _tag=$(git tag -l --sort -v:refname | sed '/rc[0-9]*/d' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "hddtemp"

  autoreconf -fi
  ./configure \
    --prefix="/usr" \
    --sbindir="/usr/bin" \
    --with-db-path="/etc/hddtemp.db"
  make
}

check() {
  cd "hddtemp"

  make check
}

package() {
  cd "hddtemp"

  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/hddtemp.service" -t "$pkgdir/usr/lib/systemd/system"
}
