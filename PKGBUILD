# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Marco44 (Marc Cousin) <cousinmarc at gmail dot com>

pkgname=pgformatter
pkgver=5.2
pkgrel=2
pkgdesc="A PostgreSQL SQL syntax beautifier"
arch=('any')
url="https://github.com/darold/pgformatter"
license=('BSD')
depends=('perl')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('6244cf41a7a93c2fedf69707e11dccbe72d44965682fb4c469718538c8a22b90192e8de8a123c5f093a40728dd6d8e728c1967953ca70f9dcd6d052d57342666')
b2sums=('3f2b27290f9498cf1562575f57ecf6697920754c059712ad3ea7846a58131f6e41708de2a493ea42c00fc8b71018002001e0edb63ee096318f3e0b09aef3fabc')

build() {
  cd "pgFormatter-$pkgver"

  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps

  perl Makefile.PL
  make
}

check() {
  cd "pgFormatter-$pkgver"

  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1

  make test
}

package() {
  cd "pgFormatter-$pkgver"

  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"

  # provide symlink in /usr/bin for non-interactive shells
  ln -sf /usr/bin/vendor_perl/pg_format "$pkgdir/usr/bin/pg_format"

  # delete usr/lib as it's empty ...
  rm -rf "$pkgdir/usr/lib"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
