# Maintainer: Ole Ernst (olebowle at gmx dot com)
# Contributor: Jörg Hansen (joerg dot hansen at gmx dot net)

pkgname=eventlircd
_gitrev=8245391b53d03865049074d4227f2904b3984f4c
pkgver=r43.8245391
pkgrel=1
pkgdesc="A GNU/Linux daemon for simplifying udev based hotplugging of remote control devices."
arch=('i686' 'x86_64')
url="https://github.com/OpenELEC/$pkgname"
license=('GPL2')
depends=('libsystemd')
makedepends=('git')
conflicts=("$pkgname-svn")
replaces=("$pkgname-svn")
install="$pkgname.install"
source=("git://github.com/OpenELEC/$pkgname.git#commit=$_gitrev"
        "$pkgname.service")
sha256sums=('SKIP'
            '1629db4d968e283e36b40bf2ba753bcc4bc8088bd9a16f753b2bce534f885fb1')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $pkgname
  sed -i 's/\s\-Werror//' configure.ac
}

build() {
  cd $pkgname
  autoreconf -vfi
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --disable-dependency-tracking \
    --with-lircd-socket=/run/lirc/lircd \
    --with-evmap-dir=/etc/eventlircd.d \
    --with-udev-dir=/usr/lib/udev
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
}
