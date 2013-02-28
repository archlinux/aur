# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Lukas Fleischer <archlinux@cryptocrack.de>
# Contributor: Vesa Kaihlavirta <vesa@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>
# Contributor: Tom Burdick <thomas.burdick@wrightwoodtech.com>
# Contributor: Ricardo Catalinas Jiménez <jimenezrick@gmail.com>

pkgname=erlang-nox
pkgver=R16B
pkgrel=1
pkgdesc='General-purpose concurrent functional programming language developed by Ericsson (headless version)'
arch=('x86_64' 'i686')
url='http://www.erlang.org/'
license=('custom')
depends=('ncurses' 'openssl')
makedepends=('perl' 'lksctp-tools' 'unixodbc')
provides=('erlang')
conflicts=('erlang')
optdepends=('erlang-unixodbc: database support'
            'java-environment: for Java support'
            'lksctp-tools: for SCTP support')
source=("http://www.erlang.org/download/otp_src_${pkgver/_/-}.tar.gz"
        "http://www.erlang.org/download/otp_doc_man_${pkgver/_/-}.tar.gz")
sha256sums=('f01c2cfe512d3118fd3398a66bdb82bea6ad0f45b464a46a58e452264b7682cd'
            'f7b1baa088d4ecda4a86944d3a782fcbf80c6b9161756bb50fec9e8d129176b9')

build() {
  cd "$srcdir/otp_src_${pkgver/_1/}"

  ./configure --prefix=/usr --enable-smp-support --with-odbc
  make
}

package() {
  cd "$srcdir/otp_src_${pkgver/_1/}"

  make DESTDIR="$pkgdir" install

  # Documentation
  install -d "$pkgdir/usr/share/doc/erlang"
  install -m0644 "$srcdir/otp_src_${pkgver/_1/}/README.md" \
    "$srcdir"/{README,COPYRIGHT} \
    "$pkgdir/usr/share/doc/erlang"

  # Compressed man pages
  for page in "$srcdir/man/man?/*"; do gzip $page; done
  cp -r "$srcdir/man" "$pkgdir/usr/lib/erlang"

  # License
  install -Dm0644 "$srcdir/otp_src_${pkgver/_1/}/EPLICENCE" \
    "$pkgdir/usr/share/licenses/$pkgname/EPLICENCE"

  # Remove files that are packaged as erlang-unixodbc
  rm -r "$pkgdir/usr/lib/erlang/"{lib/odbc*,man/man3/odbc.3.gz}
}

# vim:set ts=2 sw=2 et:
