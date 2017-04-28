# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Vesa Kaihlavirta <vesa@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>
# Contributor: Tom Burdick <thomas.burdick@wrightwoodtech.com>
# Contributor: Ricardo Catalinas Jiménez <jimenezrick@gmail.com>

pkgname=erlang-nox
pkgver=19.3
pkgrel=3
pkgdesc='General-purpose concurrent functional programming language developed by Ericsson (headless version)'
arch=('x86_64' 'i686')
url='http://www.erlang.org/'
license=('Apache')
depends=('ncurses' 'openssl')
makedepends=('perl' 'lksctp-tools' 'unixodbc' 'git' 'libxslt' 'fop'
             'java-environment')
conflicts=('erlang')
optdepends=('erlang-unixodbc: database support'
            'java-environment: for Java support'
            'lksctp-tools: for SCTP support')
options=('staticlibs')
source=("git+https://github.com/erlang/otp.git#tag=OTP-$pkgver"
        "http://www.erlang.org/download/otp_doc_man_$pkgver.tar.gz"
        'epmd.service'
        'epmd.socket'
        'epmd.conf'
        otp-0007-Fix-CVE-2016-10253.patch
        openssl-1.1.0.patch
        openssl-1.1.0-fixup.patch)
sha256sums=('SKIP'
            'f8192ffdd7367083c055695eeddf198155da43dcc221aed1d870d1e3871dd95c'
            'b121ec9053fb37abca5f910a81c526f93ec30fe13b574a12209223b346886a9e'
            '998a759e4cea4527f9d9b241bf9f32527d7378d63ea40afa38443c6c3ceaea34'
            '78ce5e67b21758c767d727e56b20502f75dc4385ff9b6c6db312d8e8506f2df2'
            'a1361b0fd7b32d8de061f1a985df31f5b37f433b42d46a6a03e2f19c9372b46e'
            'dd315047f3ccdad8609a5eb881eb2f312222316e5fcc34ebec2a0b6328d5a7a5'
            '3ca0a3b8426f1ad08b7bb2fb45a243cf17efa7d5db0ed20a934cd8cbf6178b53')

prepare() {
  cd otp
  git cherry-pick -n 25aa0128340d819e85e641f0ef8b9e0fd5fdda0b
  git cherry-pick -n e30294f44d02200c20a80f1a3a2bb075afc3747d
  git cherry-pick -n 78a5de9611c25a4e7b5248aa9828f949f3a5c131
  git cherry-pick -n 1cdaf0a6fd8dbbf08fe88dd148424df4da683f48
  patch -Np1 -i ../openssl-1.1.0.patch
  patch -Np1 -i ../openssl-1.1.0-fixup.patch

  patch -Np1 -i ../otp-0007-Fix-CVE-2016-10253.patch
  ./otp_build autoconf
}

build() {
  cd otp

  ./configure --prefix=/usr --enable-smp-support --with-odbc --enable-builtin-zlib
  make
}

package() {
  make -C otp DESTDIR="$pkgdir" install

  # Documentation
  install -d "$pkgdir/usr/share/doc/erlang"
  install -m0644 "$srcdir/otp/README.md" \
    "$srcdir"/COPYRIGHT \
    "$pkgdir/usr/share/doc/erlang"

  # Compressed man pages
  for page in "$srcdir/man/man?/*"; do gzip $page; done
  cp -r "$srcdir/man" "$pkgdir/usr/lib/erlang/"

  # License
  install -Dm0644 "$srcdir/otp/LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"

  # Remove files that are packaged as erlang-unixodbc
  rm -r "$pkgdir/usr/lib/erlang/"{lib/odbc*,man/man3/odbc.3.gz}

  # epmd service, socket and conf
  cd "$srcdir"
  install -Dm644 epmd.service "$pkgdir/usr/lib/systemd/system/epmd.service"
  install -Dm644 epmd.socket "$pkgdir/usr/lib/systemd/system/epmd.socket"
  install -Dm644 epmd.conf "$pkgdir/etc/conf.d/epmd"
}

# getver: raw.githubusercontent.com/erlang/otp/maint/OTP_VERSION
# vim:set ts=2 sw=2 et:
