# Maintainer: Polarian <polarian@polarian.dev>

pkgname=ngircd-git
pkgver=26.1.r41.g0714466
pkgrel=1
pkgdesc="Next Generation IRC Daemon"
arch=('x86_64')
backup=(etc/ngircd.conf)
url="https://ngircd.barton.de/"
license=('GPL')
depends=('openssl' 'libident' 'zlib')
makedepends=('git')
source=("$pkgname::git+https://github.com/ngircd/ngircd"
        ngircd.service)
sha256sums=('SKIP'
            'f02e30f6864ba1130bcc85bedc44ad782687f572c06f10e0501b0ddcf532b404')
provides=('ngircd')
conflicts=('ngircd')

pkgver() {
  cd "$pkgname"
  # sed 's/rel.//' is used to remove the "rel" prefix for the tags
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/rel.//'
}

build() {
  cd "$pkgname"

  ./autogen.sh
  ./configure --prefix=/usr \
  	--sysconfdir=/etc \
  	--sbindir=/usr/bin \
  	--mandir=/usr/share/man \
  	--with-ident \
  	--with-openssl \
  	--enable-ipv6
  make
}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir" install
  install -Dm644 ../ngircd.service "$pkgdir/usr/lib/systemd/system/ngircd.service"
}

# vim:set ts=2 sw=2 et:
