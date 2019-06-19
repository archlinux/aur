# Maintainer: Emanuele Faranda <black.silver@hotmail.it>
# Contributor: maz-1 <ohmygod19993 at gmail dot com>
pkgname=n2n-git
_pkgname=n2n
pkgver=2.5.0.r201
pkgrel=1
pkgdesc="Peer-to-Peer VPN."
arch=(i686 x86_64 armv7h aarch64)
url="https://github.com/ntop/n2n"
license=('GPL3')
depends=('openssl' 'net-tools')
makedepends=('git')
provides=(n2n)
conflicts=(n2n)
install="n2n.install"
source=('git+https://github.com/ntop/n2n.git' 'n2n.install')
md5sums=('SKIP' '4f4c2659da00c0a7c6f5ceb42fc82a71')

pkgver() {
  cd "$srcdir/$_pkgname"
  local rev=`git rev-list --all |wc -l | tr -d '[[:space:]]'`
  local rel=`grep -F "AC_INIT([edge]" configure.ac | sed -rs 's/^[^,]*,([^\)]+).*$/\1/'`
  printf "%s.r%s" "$rel" "$rev"
}

build() {
  cd "$srcdir/$_pkgname"
  ./autogen.sh
  ./configure --prefix=/usr

  make

  # Prepare the service files
  cd packages/debian
  ./configure
}

package() {
  cd "$srcdir/$_pkgname"
  install -dm700 "$pkgdir/etc/n2n"
  install -dm755 "$pkgdir/usr/lib/systemd/system"

  install -Dm600 "packages/etc/n2n/edge.conf.sample" "$pkgdir/etc/n2n/edge.conf"
  install -Dm600 "packages/etc/n2n/supernode.conf.sample" "$pkgdir/etc/n2n/supernode.conf"
  install -Dm644 "packages/etc/systemd/system/edge.service" "$pkgdir/usr/lib/systemd/system/edge.service"
  install -Dm644 "packages/etc/systemd/system/edge@.service" "$pkgdir/usr/lib/systemd/system/edge@.service"
  install -Dm644 "packages/etc/systemd/system/supernode.service" "$pkgdir/usr/lib/systemd/system/supernode.service"

  make DESTDIR="$pkgdir" install
  mv "$pkgdir/usr/sbin" "$pkgdir/usr/bin"
}
