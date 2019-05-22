# # Maintainer: Ian Luites <ian@luites.com>
# Previous maintainer and contributors of the `erlang` pkg:
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Vesa Kaihlavirta <vesa@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>
# Contributor: Tom Burdick <thomas.burdick@wrightwoodtech.com>
# Contributor: Ricardo Catalinas Jiménez <jimenezrick@gmail.com>

pkgbase=erlang-git
pkgname=(erlang-git erlang-unixodbc-git)
pkgver=22.0.1
pkgrel=1
_docver=22.0
arch=(x86_64)
url='https://www.erlang.org'
license=(Apache)
makedepends=(fop git glu java-environment libxslt lksctp-tools
             mesa perl unixodbc wxgtk)
options=(staticlibs)
source=("git+https://github.com/erlang/otp.git#tag=OTP-$pkgver"
        "$url/download/otp_doc_man_$_docver.tar.gz"
        epmd.conf epmd.service epmd.socket)
sha256sums=('SKIP'
            'c3acdb3c7c69eaceb8bcd5a69f8a19ba8320d403c176a3b560f9240b943ab370'
            '78ce5e67b21758c767d727e56b20502f75dc4385ff9b6c6db312d8e8506f2df2'
            'b3b3b453d14f4bc233054430f1e3aa918c900ba293f09a6ea91e7102df2b87eb'
            '0f139f01547221ae091a868ce66d3bcc52c936facea3615c2932798d610bb74d')

prepare() {
  cd otp && ./otp_build autoconf
}

build() {
  cd otp
  ./configure \
    --prefix=/usr \
    --enable-builtin-zlib \
    --enable-smp-support \
    --with-odbc
  make
}

package_erlang-git() {
  pkgdesc='General-purpose concurrent functional programming language developed by Ericsson'
  depends=(ncurses glu wxgtk openssl)
  optdepends=('erlang-unixodbc: database support'
              'java-environment: for Java support'
              'lksctp-tools: for SCTP support')
  provides=(erlang erlang-nox)
  conflicts=(erlang erlang-nox)

  make -C otp DESTDIR="$pkgdir" install

  # move files that belong to the erlang-unixodbc package
  mkdir -p unixodbc
  mv "$pkgdir/usr/lib/erlang/lib/odbc"* "$srcdir/unixodbc/"

  # services and configuration
  install -Dm644 epmd.service "$pkgdir/usr/lib/systemd/system/epmd.service"
  install -Dm644 epmd.socket "$pkgdir/usr/lib/systemd/system/epmd.socket"
  install -Dm644 epmd.conf "$pkgdir/etc/conf.d/epmd"

  # readme and licenses
  install -Dm644 otp/README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/COPYRIGHT"
  install -Dm644 otp/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # man pages
  cp -r man "$pkgdir/usr/lib/erlang/"
}

package_erlang-unixodbc-git() {
  pkgdesc='Unixodbc support for Erlang'
  depends=(unixodbc erlang-nox)
  provides=(unixodbc)
  conflicts=(unixodbc)

  install -d "$pkgdir/usr/lib/erlang/lib"
  mv unixodbc/* "$pkgdir/usr/lib/erlang/lib/"
  install -Dm644 otp/LICENSE.txt \
    "$pkgdir/usr/share/licenses/$pkgname/LICENCE.txt"
}
