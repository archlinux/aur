# $Id: PKGBUILD 80307 2012-11-19 19:18:28Z arodseth $
# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Lukas Fleischer <archlinux@cryptocrack.de>
# Contributor: Vesa Kaihlavirta <vesa@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>
# Contributor: Tom Burdick <thomas.burdick@wrightwoodtech.com>
# Contributor: Ricardo Catalinas Jiménez <jimenezrick@gmail.com>

pkgname=erlang-nox
pkgver=R15B03
pkgrel=1
pkgdesc='General-purpose concurrent functional programming language developed by Ericsson (headless version)'
arch=('x86_64' 'i686')
url='http://www.erlang.org'
license=('custom')
depends=('ncurses' 'openssl')
provides=('erlang')
conflicts=('erlang')
makedepends=('perl')
optdepends=('unixodbc: for database support'
            'java-environment: for Java support')
source=("http://www.erlang.org/download/otp_src_$pkgver.tar.gz"
        "http://www.erlang.org/download/otp_doc_man_$pkgver.tar.gz")
sha256sums=('d1ee5dd3833537ad7533f2deaf164936508c55c992c2b930f0c4c4559d40aa12'
            '0a5a01f8c6050551c1ba0591de42731a6640370e7527fae81cdfe3d3d6af0a6b')

build() {
  cd "$srcdir/otp_src_$pkgver"

  msg2 'Configuring...'
  ./configure --prefix=/usr --enable-smp-support
  msg2 'Compiling...'
  make
}

package() {
  cd "$srcdir/otp_src_$pkgver"

  make DESTDIR="$pkgdir" install

  # Install documentation
  install -d "$pkgdir/usr/share/doc/erlang"
  install -m0644 "$srcdir/otp_src_$pkgver/README.md" \
    "$srcdir"/{README,COPYRIGHT} \
    "$pkgdir/usr/share/doc/erlang"

  # Install compressed man pages
  for page in "$srcdir/man/man?/*"; do gzip $page; done
  cp -r "$srcdir/man" "$pkgdir/usr/lib/erlang"

  # Install license
  install -Dm0644 "$srcdir/otp_src_$pkgver/EPLICENCE" \
    "$pkgdir/usr/share/licenses/$pkgname/EPLICENCE"
}

# vim:set ts=2 sw=2 et:
