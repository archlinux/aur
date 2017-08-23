# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=logrotate-git
pkgver=3.12.3.r12.g9431582
pkgrel=1
pkgdesc="Rotates system logs automatically"
arch=('i686' 'x86_64')
url="https://github.com/logrotate/logrotate"
license=('GPL2')
depends=('glibc' 'acl' 'popt' 'gzip')
makedepends=('git')
provides=('logrotate')
conflicts=('logrotate')
backup=('etc/logrotate.conf')
source=("git+https://github.com/logrotate/logrotate.git"
        "logrotate.conf::https://git.archlinux.org/svntogit/packages.git/plain/trunk/logrotate.conf?h=packages/logrotate")
sha256sums=('SKIP'
            'SKIP')


pkgver() {
  cd "logrotate"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "logrotate"

  ./autogen.sh
  ./configure --prefix="/usr" --sbindir="/usr/bin" \
    --with-compress-command="/usr/bin/gzip" \
    --with-uncompress-command="/usr/bin/gunzip" \
    --with-default-mail-command="/usr/bin/mail"
  make
}

check() {
  cd "logrotate"

  make check
}

package() {
  cd "logrotate"

  make DESTDIR="$pkgdir" install

	install -Dm644 "$srcdir/logrotate.conf" "$pkgdir/etc/logrotate.conf"
  install -dm755 "$pkgdir/etc/logrotate.d"

	install -Dm644 "examples/logrotate.timer" "$pkgdir/usr/lib/systemd/system/logrotate.timer"
	install -Dm644 "examples/logrotate.service" "$pkgdir/usr/lib/systemd/system/logrotate.service"

	install -dm755 "$pkgdir/usr/lib/systemd/system/timers.target.wants"
	ln -s ../logrotate.timer "$pkgdir/usr/lib/systemd/system/timers.target.wants/logrotate.timer"
}
