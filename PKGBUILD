# Maintainer: skogler

pkgname=barnyard2-git
pkgver=r166.f9186f2
pkgrel=1
pkgdesc="A dedicated spooler for Snort's unified2 binary output format."
arch=('i686' 'x86_64')
url="http://www.github.com/firnsy/barnyard2"
license=('GPL')
depends=('libpcap' 'libmariadbclient')
options=()
provides=('barnyard2')
conflicts=('barnyard2')
source=('barnyard2::git+https://github.com/firnsy/barnyard2.git')
md5sums=('SKIP')

pkgver() {
  cd "barnyard2"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "barnyard2"
    ./autogen.sh
    ./configure --prefix=/usr --sysconfdir=/etc/ --with-mysql --with-mysql-libraries=/usr/lib/
    make
}

check() {
    cd "barnyard2"
    make -k check
}

package() {
    cd "barnyard2"
    make DESTDIR="$pkgdir/" install
    chmod 644 "$pkgdir/etc/barnyard2.conf"
    install -d -m755 "$pkgdir/var/log/barnyard2"
    install -d -m755 "$pkgdir/var/log/snort/barnyard2.waldo"
}
