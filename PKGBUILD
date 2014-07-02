# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Lukas Fleischer <archlinux@cryptocrack.de>
# Contributor: Vesa Kaihlavirta <vesa@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>
# Contributor: Tom Burdick <thomas.burdick@wrightwoodtech.com>
# Contributor: Ricardo Catalinas Jiménez <jimenezrick@gmail.com>

pkgname=erlang-nox
pkgver=17.1
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
source=("http://www.erlang.org/download/otp_src_$pkgver.tar.gz"
        "http://www.erlang.org/download/otp_doc_man_$pkgver.tar.gz"
        'epmd.service'
        'epmd.socket'
        'epmd.conf')
sha256sums=('b806f5b2b5cc2d0c0d5dd1a65657c21c10dc3a0535ef60adecdac9cd73b9c356'
            '4a230277f135e3730593e7bffdd5ca92596568340f02a5b3134f1d083b34eaab'
            'b121ec9053fb37abca5f910a81c526f93ec30fe13b574a12209223b346886a9e'
            '998a759e4cea4527f9d9b241bf9f32527d7378d63ea40afa38443c6c3ceaea34'
            '78ce5e67b21758c767d727e56b20502f75dc4385ff9b6c6db312d8e8506f2df2')

build() {
  cd "otp_src_$pkgver"

  ./configure --prefix=/usr --enable-smp-support --with-odbc
  make
}

package() {
  cd "otp_src_$pkgver"

  make DESTDIR="$pkgdir" install

  # Documentation
  install -d "$pkgdir/usr/share/doc/erlang"
  install -m0644 "$srcdir/otp_src_$pkgver/README.md" \
    "$srcdir"/{README,COPYRIGHT} \
    "$pkgdir/usr/share/doc/erlang"

  # Compressed man pages
  for page in "$srcdir/man/man?/*"; do gzip $page; done
  cp -r "$srcdir/man" "$pkgdir/usr/lib/erlang"

  # License
  install -Dm0644 "$srcdir/otp_src_$pkgver/EPLICENCE" \
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
