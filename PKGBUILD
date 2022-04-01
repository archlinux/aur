# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Vesa Kaihlavirta <vegai@iki.fi>
# Contributor: Patrick Smits <mail@patricksmits.net>

pkgname=yaws
pkgver=2.1.0
pkgrel=1
pkgdesc='Web server for dynamic content'
arch=(x86_64)
url='http://yaws.hyber.org/'
license=(BSD)
depends=(erlang-nox pam)
backup=(etc/yaws/yaws.conf)
options=(!emptydirs)
install=$pkgname.install
source=("https://github.com/klacke/yaws/archive/$pkgname-$pkgver.tar.gz"
        "$pkgname.service")
sha512sums=('a3816f70602c7046a4a0700611393fcaf62a6cd6fc3852fd50e3290335bf9f5162038c2a522c31baf15bea98d2d1d79ef876b06aa534738eee7fd948e75a8cda'
            '6bafd099901d4da241094d137191eda7c18ec8ff9d3f9688aa37220db11d7d19ad97ab6fa4e8b57ebf9c7e2f16ac162284332354d4dae61340ddc598933cee0e')

prepare() {
  cd "$pkgname-$pkgname-$pkgver"

  # fix for python2
  sed -i 's:n/python:n/python2:' www/cgi{.yaws,-bin/foo.py}

  # treat warnings as warnings
  sed -i 's/-Werror//g' include.mk

  # prepare configure and make
  autoreconf -fi
}

build() {
  cd "$pkgname-$pkgname-$pkgver"
  export wwwdir=/srv/http/yaws
  ./configure --prefix=/usr --localstatedir=/var --sysconfdir=/etc
  make
}

package() {
  cd "$pkgname-$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install

  install -d "$pkgdir/usr/lib/erlang/lib"
  ln -s /usr/lib/yaws "$pkgdir/usr/lib/erlang/lib/$pkgname-$pkgver"
  install -Dm644 "$srcdir/$pkgname.service" \
    "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -Dm644 "$srcdir/$pkgname-$pkgname-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # path fix
  cp -ru examples/include "$pkgdir/usr/lib/yaws-$pkgver/examples/"
  mv "$pkgdir/srv/http/yaws/"* "$pkgdir/srv/http/www" || true
  rmdir --ignore-fail-on-non-empty "$pkgdir/srv/http/yaws"
  mv "$pkgdir/srv/http/www" "$pkgdir/srv/http/yaws" || true
}

# getver: raw.githubusercontent.com/klacke/yaws/master/vsn.mk
# vim: ts=2 sw=2 et:
