# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=openbsd-netcat-git
pkgver=1.225.r319.g9e75b2f
pkgrel=1
pkgdesc="TCP/IP swiss army knife. OpenBSD variant."
arch=('i686' 'x86_64')
url="https://salsa.debian.org/debian/netcat-openbsd"
license=('BSD')
depends=('glibc' 'libbsd')
makedepends=('git')
provides=("openbsd-netcat=$pkgver" 'netcat')
conflicts=('openbsd-netcat' 'gnu-netcat')
source=("git+https://salsa.debian.org/debian/netcat-openbsd.git")
sha256sums=('SKIP')


prepare() {
  cd "netcat-openbsd"

  for i in $(cat debian/patches/series); do
    echo "** patch $i" 1>&2
    patch -Np1 -i "debian/patches/$i"
  done

  head -n28 netcat.c | tail -n+2 > "$srcdir/LICENSE"
}

pkgver() {
  cd "netcat-openbsd"

  _tag=$(git tag -l --sort -v:refname | grep -E '^upstream/[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's|^upstream/||'
}

build() {
  cd "netcat-openbsd"

  make \
    LDFLAGS="$LDFLAGS"
}

package() {
  cd "netcat-openbsd"

  install -Dm755 "nc" -t "$pkgdir/usr/bin"
  ln -s "nc" "$pkgdir/usr/bin/netcat"

  install -Dm644 "nc.1" -t "$pkgdir/usr/share/man/man1"
  install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/openbsd-netcat"
}
