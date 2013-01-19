# $Id: PKGBUILD 80307 2012-11-19 19:18:28Z arodseth $
# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Lukas Fleischer <archlinux@cryptocrack.de>
# Contributor: Vesa Kaihlavirta <vesa@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>
# Contributor: Tom Burdick <thomas.burdick@wrightwoodtech.com>
# Contributor: Ricardo Catalinas Jiménez <jimenezrick@gmail.com>

pkgname=erlang-nox
pkgver=R15B03_1
pkgrel=2
pkgdesc='General-purpose concurrent functional programming language developed by Ericsson (headless version)'
arch=('x86_64' 'i686')
url='http://www.erlang.org/'
license=('custom')
depends=('ncurses' 'openssl')
provides=('erlang')
conflicts=('erlang')
makedepends=('perl' 'lksctp-tools')
optdepends=('unixodbc: for database support'
            'java-environment: for Java support'
            'lksctp-tools: for SCTP support')
source=("http://www.erlang.org/download/otp_src_${pkgver/_/-}.tar.gz"
        "http://www.erlang.org/download/otp_doc_man_${pkgver/_/-}.tar.gz")
sha256sums=('4bccac86dd76aec050252e44276a0283a0df9218e6470cf042a9b9f9dfc9476c'
            '07980d8014c7cf8194b7078c137353f5083992add4663ced3dcba2ff91f228d8')

build() {
  cd "$srcdir/otp_src_${pkgver/_1/}"

  msg2 'Configuring...'
  ./configure --prefix=/usr --enable-smp-support --with-odbc
  msg2 'Compiling...'
  make
}

package() {
  cd "$srcdir/otp_src_${pkgver/_1/}"

  make DESTDIR="$pkgdir" install

  # Install documentation
  install -d "$pkgdir/usr/share/doc/erlang"
  install -m0644 "$srcdir/otp_src_${pkgver/_1/}/README.md" \
    "$srcdir"/{README,COPYRIGHT} \
    "$pkgdir/usr/share/doc/erlang"

  # Install compressed man pages
  for page in "$srcdir/man/man?/*"; do gzip $page; done
  cp -r "$srcdir/man" "$pkgdir/usr/lib/erlang"

  # Install license
  install -Dm0644 "$srcdir/otp_src_${pkgver/_1/}/EPLICENCE" \
    "$pkgdir/usr/share/licenses/$pkgname/EPLICENCE"
}

# vim:set ts=2 sw=2 et:
