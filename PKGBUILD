# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Lukas Fleischer <archlinux@cryptocrack.de>
# Contributor: Vesa Kaihlavirta <vesa@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>
# Contributor: Tom Burdick <thomas.burdick@wrightwoodtech.com>
# Contributor: Ricardo Catalinas Jiménez <jimenezrick@gmail.com>

pkgname=erlang-nox
pkgver=R16B03_1
pkgrel=1
pkgdesc='General-purpose concurrent functional programming language developed by Ericsson (headless version)'
arch=('x86_64' 'i686')
url='http://www.erlang.org/'
license=('custom')
depends=('ncurses' 'openssl')
makedepends=('perl' 'lksctp-tools' 'unixodbc')
conflicts=('erlang')
optdepends=('erlang-unixodbc: database support'
            'java-environment: for Java support'
            'lksctp-tools: for SCTP support')
options=('staticlibs')
source=("http://www.erlang.org/download/otp_src_${pkgver/_/-}.tar.gz"
        "http://www.erlang.org/download/otp_doc_man_${pkgver/_/-}.tar.gz"
        'epmd.service'
        'epmd.socket'
        'epmd.conf')
sha256sums=('17ce53459bc5ceb34fc2da412e15ac8c23835a15fbd84e62c8d1852704747ee7'
            '0f31bc7d7215aa4b6834b1a565cd7d6e3173e3b392fb870254bae5136499c39d'
            'b121ec9053fb37abca5f910a81c526f93ec30fe13b574a12209223b346886a9e'
            '998a759e4cea4527f9d9b241bf9f32527d7378d63ea40afa38443c6c3ceaea34'
            '78ce5e67b21758c767d727e56b20502f75dc4385ff9b6c6db312d8e8506f2df2')

build() {
  cd "otp_src_${pkgver/_/-}"

  ./configure --prefix=/usr --enable-smp-support --with-odbc
  make
}

package() {
  cd "otp_src_${pkgver/_/-}"

  make DESTDIR="$pkgdir" install

  # Documentation
  install -d "$pkgdir/usr/share/doc/erlang"
  install -m0644 "$srcdir/otp_src_${pkgver/_/-}/README.md" \
    "$srcdir"/{README,COPYRIGHT} \
    "$pkgdir/usr/share/doc/erlang"

  # Compressed man pages
  for page in "$srcdir/man/man?/*"; do gzip $page; done
  cp -r "$srcdir/man" "$pkgdir/usr/lib/erlang"

  # License
  install -Dm0644 "$srcdir/otp_src_${pkgver/_/-}/EPLICENCE" \
    "$pkgdir/usr/share/licenses/$pkgname/EPLICENCE"

  # Remove files that are packaged as erlang-unixodbc
  rm -r "$pkgdir/usr/lib/erlang/"{lib/odbc*,man/man3/odbc.3.gz}

  # epmd service, socket and conf
  cd "$srcdir"
  install -Dm644 epmd.service "$pkgdir/usr/lib/systemd/system/epmd.service"
  install -Dm644 epmd.socket "$pkgdir/usr/lib/systemd/system/epmd.socket"
  install -Dm644 epmd.conf "$pkgdir/etc/conf.d/epmd"
}

# vim:set ts=2 sw=2 et:
