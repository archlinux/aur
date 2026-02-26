pkgname=nsnotifyd
pkgver=2.4
pkgrel=1
pkgdesc="DNS NOTIFY message handler"
arch=(i686 x86_64)
url="https://dotat.at/prog/nsnotifyd/"
license=(custom:CC0)
optdepends=("nsdiff: for the 'nsnotify2update' handler")
provides=(metazone=$pkgver)
source=("https://dotat.at/prog/nsnotifyd/nsnotifyd-${pkgver}.tar.gz"
        "https://ftp.isc.org/isc/libbind/cur/libbind-6.0.tar.gz")
sha256sums=('1fae7c39fe6255fd0260b9ed1702f5e799c34423b611bb6f8284b28872cd47e6'
            'b98b6aa6e7c403f5a6522ffb68325785a87ea8b13377ada8ba87953a3e8cb29d')

prepare() {
  cd $pkgname-$pkgver
  ln -sf ../libbind-6.0.tar.gz
  sed -i '/^CFLAGS/d' Makefile.in
}

build() {
  cd $pkgname-$pkgver
  # These are already present in the default Makefile.in, but we want to
  # combine with Arch default cflags (thus the sed above).
  export CFLAGS+=" -std=gnu99"
  ./configure
  make prefix=/usr
}

package() {
  cd $pkgname-$pkgver
  make prefix=/usr DESTDIR="$pkgdir" install
  install -m 755 metazone "$pkgdir"/usr/bin/metazone
}

# vim: ts=2:sw=2:et
