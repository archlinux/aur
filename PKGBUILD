# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=conntrack-tools-git
pkgver=1.4.4.r35.g210f542
pkgrel=1
pkgdesc="A tool to view and manage the in-kernel connection tracking state table from userspace"
arch=('i686' 'x86_64')
url="https://www.netfilter.org/projects/conntrack-tools/"
license=('GPL2')
depends=('glibc' 'libmnl' 'libnetfilter_conntrack' 'libnetfilter_cttimeout' 'libnetfilter_cthelper')
makedepends=('git')
provides=('conntrack-tools')
conflicts=('conntrack-tools')
backup=('etc/conntrackd.conf')
source=("git://git.netfilter.org/conntrack-tools"
        "conntrackd.service::https://git.archlinux.org/svntogit/packages.git/plain/trunk/conntrackd.service?h=packages/conntrack-tools")
sha256sums=('SKIP'
            'SKIP')


pkgver() {
  cd "conntrack-tools"

  git describe --long --tags | sed 's/^conntrack-tools-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "conntrack-tools"

  ./autogen.sh
  ./configure --prefix="/usr" --sbindir="/usr/bin" --enable-systemd
  make
}

package() {
  cd "conntrack-tools"

  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/conntrackd.service" "$pkgdir/usr/lib/systemd/system/conntrackd.service"

  # install empty configuration files
  install -Dm644 "/dev/null" "$pkgdir/etc/conntrackd.conf"
}
