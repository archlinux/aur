# $Id: PKGBUILD 80307 2012-11-19 19:18:28Z arodseth $
# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Lukas Fleischer <archlinux@cryptocrack.de>
# Contributor: Vesa Kaihlavirta <vesa@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>
# Contributor: Tom Burdick <thomas.burdick@wrightwoodtech.com>
# Contributor: Ricardo Catalinas Jiménez <jimenezrick@gmail.com>

pkgname=erlang-nox
pkgver=R15B02
pkgrel=1
pkgdesc='General-purpose concurrent functional programming language developed by Ericsson (headless version)'
arch=('x86_64' 'i686')
url='http://www.erlang.org'
license=('custom')
depends=('ncurses')
provides=('erlang')
conflicts=('erlang')
makedepends=('perl' 'openssl')
optdepends=('unixodbc: for database support'
            'java-environment: for Java support')
source=("http://www.erlang.org/download/otp_src_$pkgver.tar.gz"
        "http://www.erlang.org/download/otp_doc_man_$pkgver.tar.gz")
sha256sums=('03eb0bd640916666ff83df1330912225fbf555e0c8cf58bb35d8307a314f1158'
            'e27ed26259a2560b81e02b89190ae2a3bf0a777dc2e875f9615adab0a5388f95')

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
